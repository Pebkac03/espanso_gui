import 'dart:math';

import 'package:espanso_gui_v2/models/espanso_match_model.dart';
import 'package:espanso_gui_v2/ui/widgets/table_window/matches_table3/matches_table3.dart';
import 'package:espanso_gui_v2/ui/widgets/table_window/table_window.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'espanso_new_viewmodel.dart';

class EspansoNewView extends StackedView<EspansoNewViewModel> {
  static const EdgeInsets _margin = EdgeInsets.all(32);
  static const EdgeInsets _padding = EdgeInsets.all(32);
  static const BorderRadius _borderRadius =
      BorderRadius.all(Radius.circular(32));
  static const Map<String, int> _flex = {'left': 34, 'right': 21};

  static Color _windowColor(context) =>
      Theme.of(context).colorScheme.surfaceContainer;
  static Color _backgroundColor(context) =>
      Theme.of(context).colorScheme.surface;

  static const double borderRadius = 16;
  const EspansoNewView({super.key});

  @override
  Widget builder(
    BuildContext context,
    EspansoNewViewModel viewModel,
    Widget? child,
  ) {
    final double screenSize = MediaQuery.sizeOf(context).width;
    const double minWidth = 1000;
    final double windowWidth = max(screenSize, minWidth);
    final ValueNotifier<EspansoMatch?> currentMatch = ValueNotifier(null);

    final List<Widget> widgets = viewModel.categories
        .map((e) =>
            MatchesTable3(file: e, onChanged: (e) => currentMatch.value = e))
        .toList();

    Container windowContainer({required child}) {
      return Container(
        decoration: BoxDecoration(
            color: _windowColor(context),
            boxShadow: kElevationToShadow[4],
            borderRadius: _borderRadius),
        margin: _margin,
        padding: _padding,
        child: child,
      );
    }

    return Scaffold(
      backgroundColor: _backgroundColor(context),
      appBar: AppBar(
          title: TextField(
        onSubmitted: (e) => viewModel.setPath(e),
        decoration: const InputDecoration(hintText: 'matches path'),
      )),
      body: Scrollbar(
        controller: viewModel.scrollController,
        thumbVisibility: true,
        trackVisibility: true,
        child: SingleChildScrollView(
          controller: viewModel.scrollController,
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: windowWidth,
            child: Row(
              children: [
                // Left table window
                Expanded(
                  flex: _flex['left']!,
                  child: windowContainer(
                      child: TableWindow(
                          widgets: widgets, titles: viewModel.titles)),
                ),

                // Right window
                Expanded(
                  flex: _flex['right']!,
                  child: windowContainer(
                    child: ValueListenableBuilder(
                      valueListenable: currentMatch,
                      builder: (context, value, widget) {
                        return value == null
                            ? Container()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: Text(
                                        value.trigger.trigger ?? '',
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                    ),
                                    const Flexible(child: Divider())
                                  ]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  EspansoNewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EspansoNewViewModel();
}
