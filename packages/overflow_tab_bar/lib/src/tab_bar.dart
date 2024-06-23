import 'package:flutter/material.dart';

class OverflowTabBar extends StatelessWidget {
  static const double iconSize = 24;
  static const double iconPadding = 8;
  static const double buttonPadding = 8;
  static const double maxWidthOffset = iconSize + (iconPadding * 2);

  final List<String> tabs;
  final TabController? controller;
  final TextStyle? textStyle;
  const OverflowTabBar(
      {super.key,
      this.controller,
      required this.tabs,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    final TabController newController =
        controller ?? DefaultTabController.of(context);
    final TextScaler textScaler = MediaQuery.textScalerOf(context);
    final List<double> tabWidths = tabs.map((e) {
      return (TextPainter(
        text: TextSpan(text: e, style: textStyle),
        maxLines: 1,
        textScaler: textScaler,
        textDirection: TextDirection.ltr,
        textWidthBasis: TextWidthBasis.parent,
      )..layout())
          .size
          .width;
    }).toList();

    print(tabWidths);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final double maxWidth = constraints.maxWidth - maxWidthOffset;
      print(maxWidth);

      // Add all tabs that fits into visible tabs
      List<Widget> visibleTabs = [];
      int overflowTabsStartIndex = 0;
      bool hasOverflowTabs = false;
      double totalWidth = 0;
      for (var i = 0; i < tabWidths.length; i++) {
        totalWidth = totalWidth + tabWidths[i] + (buttonPadding * 2);
        print(totalWidth);

        // Break loop if no more tabs fit
        if (totalWidth >= maxWidth) {
          print('tab does not fit');
          overflowTabsStartIndex = i;
          hasOverflowTabs = true;
          break;
        }

        print('tab fits');
        visibleTabs.add(OverflowTabBarButton(
            controller: newController,
            index: i,
            padding: const EdgeInsets.all(buttonPadding),
            text: tabs[i],
            textStyle: textStyle,
            textScaler: textScaler));
      }

      final List<PopupMenuItem> overflowTabs = [];
      if (hasOverflowTabs) {
        for (var i = overflowTabsStartIndex; i < tabs.length; i++) {
          overflowTabs.add(
            PopupMenuItem(
              child: Text(tabs[i], style: textStyle, textScaler: textScaler),
              onTap: () => newController.animateTo(i),
            ),
          );
        }
      }

      return Row(
        children: [
          ...visibleTabs,
          PopupMenuButton(
            position: PopupMenuPosition.under,
            iconSize: iconSize,
            padding: const EdgeInsets.all(iconPadding),
            itemBuilder: (BuildContext context) => overflowTabs,
            onSelected: (e) {},
          )
        ],
      );
    });
  }
}

class OverflowTabBarButton extends StatefulWidget {
  final TabController controller;
  final int index;
  final EdgeInsetsGeometry padding;
  final String text;
  final TextStyle? textStyle;
  final TextScaler textScaler;
  const OverflowTabBarButton(
      {super.key,
      required this.controller,
      required this.index,
      required this.padding,
      required this.text,
      required this.textStyle,
      required this.textScaler});

  @override
  State<OverflowTabBarButton> createState() => _OverflowTabBarButtonState();
}

class _OverflowTabBarButtonState extends State<OverflowTabBarButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        hoverColor: Colors.grey,
        onTap: () => widget.controller.animateTo(widget.index),
        child: Padding(
          padding: widget.padding,
          child: Center(
            child: Text(
              widget.text,
              style: widget.textStyle,
              textScaler: widget.textScaler,
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
