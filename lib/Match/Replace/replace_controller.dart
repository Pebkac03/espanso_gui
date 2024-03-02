import 'package:flutter/material.dart';

/*class WidgetSpanTextEditingController extends TextEditingController {
  WidgetSpanTextEditingController({String? text})
      : super.fromValue(text == null
            ? TextEditingValue.empty
            : TextEditingValue(text: text));

  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    TextRange? matchedRange;

    if (RegExp(r'{{\w+}}').hasMatch(text)) {
      matchedRange = _findMatchedRange(text);
    }

    if (matchedRange != null) {
      /*final int _offset = matchedRange.textBefore(text).length +
          matchedRange.textInside(text).length;
      print(matchedRange.textInside(text).toString());
      print('offset: ' + _offset.toString());
      TextSelection.fromPosition(TextPosition(offset: _offset));*/
      return TextSpan(
        children: [
          TextSpan(text: matchedRange.textBefore(text)),
          const WidgetSpan(child: FlutterLogo()),
          TextSpan(text: matchedRange.textAfter(text)),
        ],
        style: style,
      );
    }

    return TextSpan(text: text, style: style);
  }

  TextRange _findMatchedRange(String text) {
    final RegExp matchPattern = RegExp(r'{{\w+}}');
    late TextRange matchedRange;

    for (final Match match in matchPattern.allMatches(text)) {
      matchedRange = TextRange(start: match.start, end: match.end);
    }

    return matchedRange;
  }
}*/

class WidgetSpanTextEditingController extends TextEditingController {
  WidgetSpanTextEditingController({String? text})
      : super.fromValue(text == null
            ? TextEditingValue.empty
            : TextEditingValue(text: text));
  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    bool? withComposing,
  }) {
    TextRange? matchedRange;
    print('build text span called');

    final Map<String, Widget> cases = {
      r'/u23f8\w*\u23f8': FlutterLogo(),
      r'/u23f9\w*\u23f9': FlutterLogo(),
      r'/u23fa\w*\u23fa': FlutterLogo(),
      r'\{{\w*}}': FlutterLogo(),
    };

    final List<Map<String, dynamic>> allWidgets = [];
    final Map<String, TextRange> matchedRanges = {};

    cases.forEach((pattern, widget) {
      if (RegExp(pattern).hasMatch(text)) {
        print('match found!' + pattern);
        final RegExp matchPattern = RegExp(pattern);
        matchPattern.allMatches(text).forEach((match) {
          allWidgets
              .add({'start': match.start, 'end': match.end, 'widget': widget});
        });
      }
    });

    allWidgets.sort((a, b) => a['end'].compareTo(b['start']));
    print(allWidgets);

    int currentIteration = 0;
    final int lastIteration = allWidgets.length;
    List<InlineSpan> result = [];

    for (var e in allWidgets) {
      if (currentIteration == 0 && e['start'] != 0) {
        result.add(TextSpan(text: text.substring(0, e['start'])));
      } else if (currentIteration != 0) {
        result.add(
          TextSpan(
            text: text.substring(
                allWidgets[currentIteration - 1]['end'], e['start']),
          ),
        );
      }

      result.add(WidgetSpan(child: e['widget']));
      for (var i = 0; i < e['end'] - (e['start'] + 1); i++) {
        result.add(const TextSpan(text: '\u200b'));
      }

      currentIteration++;

      if (currentIteration == lastIteration && e['end'] < currentIteration) {
        result.add(
          TextSpan(
            text: text.substring(e['end'], text.length - 1),
            style: style,
          ),
        );
      }
    }
    print(result);

    if (result.isNotEmpty) {
      return TextSpan(children: result);
    } else {
      return TextSpan(text: text, style: style);
    }

    matchedRanges.forEach((key, value) {});
    if (matchedRange != null) {
      final children = matchedRanges;
      return TextSpan(
        children: [
          TextSpan(text: matchedRange.textBefore(text)),
          const WidgetSpan(child: FlutterLogo()),
          for (var i = 0; i < matchedRange.end - (matchedRange.start + 1); i++)
            const TextSpan(text: '\u200b'),
          TextSpan(text: matchedRange.textAfter(text)),
        ],
        style: style,
      );
    }

    return TextSpan(text: text, style: style);
  }

  TextRange _findMatchedRange(String text, String pattern) {
    final RegExp matchPattern = RegExp(pattern);
    late TextRange matchedRange;

    for (final Match match in matchPattern.allMatches(text)) {
      matchedRange = TextRange(start: match.start, end: match.end);
    }
    return matchedRange;
  }
}
