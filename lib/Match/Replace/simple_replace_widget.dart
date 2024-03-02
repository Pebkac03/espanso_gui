import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SimpleReplaceWidget extends StatefulWidget {
  final String text;

  const SimpleReplaceWidget({super.key, required this.text});

  @override
  State<SimpleReplaceWidget> createState() => _SimpleReplaceWidgetState();
}

class _SimpleReplaceWidgetState extends State<SimpleReplaceWidget> {
  bool inFocus = false;

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    void changeFocus() {
      print('trying to change focus');
      if (_focusNode.hasFocus != inFocus) {
        print('changing focus');
        setState(() {
          inFocus = _focusNode.hasFocus;
        });
      }
    }

    _focusNode.addListener(() {
      changeFocus();
    });

    if (inFocus) {
      return Hero(
        tag: 'this is my tag',
        child: Container(
          padding: EdgeInsets.all(8),
          width: 300,
          decoration: BoxDecoration(
              border: Border.all(
                  style: BorderStyle.solid, width: 0.5, color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: TextField(
            style: Theme.of(context).textTheme.bodyLarge,
            autofocus: true,
            controller: _controller,
            focusNode: _focusNode,
            maxLines: null,
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
      );
    } else {
      return Hero(
        tag: 'this is my tag',
        child: TapRegion(
          onTapInside: (e) {
            print('tapped inside');
            setState(() {
              inFocus = true;
            });
          },
          child: Container(
            alignment: Alignment.centerLeft,
            width: 100,
            decoration: BoxDecoration(
                border: Border.all(
                    style: BorderStyle.solid,
                    width: 0.5,
                    color: Colors.grey.shade800),
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            child: Text(
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyLarge,
              _controller.text,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );
    }
  }
}
