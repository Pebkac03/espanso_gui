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

    const List<String> cases = [
      r'\u23f8\w*\u23f8',
      r'\u23f9\w*\u23f9',
      r'\u23fa\w*\u23fa',
    ];
    final Map ranges = {};

    if (RegExp(
      r'\u23f8\w*\u23f8',
    ).hasMatch(text)) {
      matchedRange = _findMatchedRange(text, r'\u23f8\w*\u23f8');
    }

    ranges.forEach((key, value) {});
    if (matchedRange != null) {
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
