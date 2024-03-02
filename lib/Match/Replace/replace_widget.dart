import 'dart:math';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'replace_controller.dart';

class ReplaceWidget extends StatefulWidget {
  final String text;
  const ReplaceWidget({super.key, this.text = ''});

  @override
  State<ReplaceWidget> createState() => _ReplaceWidgetState();
}

class _ReplaceWidgetState extends State<ReplaceWidget> {
  final WidgetSpanTextEditingController _controller =
      WidgetSpanTextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.text;
    const keyRight = SingleActivator(LogicalKeyboardKey.arrowRight);
    const keyLeft = SingleActivator(LogicalKeyboardKey.arrowLeft);
    const keyBackspace = SingleActivator(LogicalKeyboardKey.backspace);
    const keyDelete = SingleActivator(LogicalKeyboardKey.delete);
    const keyFwdSlash = CharacterActivator('/', includeRepeats: false);

    return Shortcuts(
      shortcuts: const <ShortcutActivator, Intent>{
        keyRight: RightIntent(),
        keyLeft: LeftIntent(),
        keyBackspace: BackspaceIntent(),
        keyDelete: DeleteIntent(),
        keyFwdSlash: VariableIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          // on right arrow
          RightIntent: CallbackAction<RightIntent>(
            onInvoke: (RightIntent intent) {
              if (max(_controller.selection.baseOffset,
                      _controller.selection.extentOffset) !=
                  _controller.text.length) {
                int distance = 1;
                if (_controller.text.startsWith(
                    RegExp(r'{{\w+}}'), _controller.selection.extentOffset)) {
                  distance = _controller.text
                          .indexOf('}}', _controller.selection.extentOffset) -
                      _controller.text
                          .indexOf('{{', _controller.selection.extentOffset);
                }
                _controller.selection = TextSelection.fromPosition(TextPosition(
                    offset: _controller.selection.extentOffset + distance));
              }
              return null;
            },
          ),

          // on left arrow
          LeftIntent: CallbackAction<LeftIntent>(
            onInvoke: ((LeftIntent intent) {
              int distance = 1;
              return null;
            }),
          ),

          // on backspace
          BackspaceIntent: CallbackAction<BackspaceIntent>(
            onInvoke: (BackspaceIntent intent) {
              final String content = _controller.text;
              final List chars = content.characters.toList();
              final int end = max(_controller.selection.extentOffset,
                  _controller.selection.baseOffset);
              final int start = min(_controller.selection.extentOffset,
                  _controller.selection.baseOffset);

              void simpleDelete() {
                _controller.text =
                    StringUtils.removeCharAtPosition(content, start);
                _controller.selection =
                    TextSelection.fromPosition(TextPosition(offset: start - 1));
              }

              void rightVarDelete() {
                _controller.text = StringUtils.reverse(
                    StringUtils.reverse(content).replaceFirst(
                        RegExp(r'}}\w+{{'), '', content.length - start));
                _controller.selection = TextSelection.fromPosition(TextPosition(
                    offset:
                        start - (content.length - _controller.text.length)));
              }

              void leftVarDelete() {}

              if (start == end && start != 0 && chars.length > 2) {
                debugPrint(
                    'Selection is collapsed, selection is not 0, string is longer than 2. 1st layer IF');
                if (start == 1) {
                  debugPrint('start == 1. 2nd layer IF');
                  debugPrint('');
                  if (chars[1] == '{' && chars[0] == '{') {
                    debugPrint(
                        'Leading variable left hand deletion. Case 1/6. 3rd layer IF');
                    leftVarDelete();
                  } else {
                    debugPrint(
                        'Leading character deleted. Case 2/6. 3rd layer ELSE');
                    simpleDelete();
                  }
                } else if (chars[start - 1] == '}' && chars[start - 2] == '}') {
                  debugPrint(
                      'Variable right hand deleted. Case 3/6. 2nd layer ELSE IF 1/3');
                  rightVarDelete();
                } else if (start == content.length) {
                  debugPrint(
                      'Trailing character deleted. Case 4/6. 2nd layer ELSE IF 2/3');
                  simpleDelete();
                } else if (chars[start] == '{' && chars[start - 1] == '{') {
                  debugPrint(
                      'Variable left hand deleted. Case 5/6. 2nd layer ELSE IF 3/3');
                  leftVarDelete();
                } else {
                  debugPrint('Character deleted. Case 6/6. 2nd layer ELSE');
                  simpleDelete();
                }
              } else {
                simpleDelete();
                debugPrint(
                    'Selection was not collapsed, cursor at beggining, or the string was shorter than 2. 1st layer ELSE');
              }
              return null;
            },
          ),
          DeleteIntent:
              CallbackAction<DeleteIntent>(onInvoke: ((DeleteIntent intent) {
            setState(() {
              _controller.text + '\u23f1';
            });

            return null;

            // do something
          })),
          VariableIntent:
              CallbackAction<VariableIntent>(onInvoke: (VariableIntent intent) {
            print('FwdSlash Captured');
            return null;
          })
        },
        child: TextField(
          maxLines: null,
          controller: _controller,
        ),
      ),
    );
  }
}

class RightIntent extends Intent {
  const RightIntent();
}

class LeftIntent extends Intent {
  const LeftIntent();
}

class BackspaceIntent extends Intent {
  const BackspaceIntent();
}

class DeleteIntent extends Intent {
  const DeleteIntent();
}

class VariableIntent extends Intent {
  const VariableIntent();
}
