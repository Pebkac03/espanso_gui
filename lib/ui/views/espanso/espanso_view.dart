import 'dart:math';

import 'package:espanso_gui_v2/ui/widgets/matches_table2/matches_table2.dart';
import 'package:flutter/material.dart';
import 'package:overflow_tab_bar/overflow_tab_bar.dart';
import 'package:stacked/stacked.dart';

import 'espanso_viewmodel.dart';

class EspansoView extends StackedView<EspansoViewModel> {
  static const double borderRadius = 16;
  const EspansoView({super.key});

  @override
  Widget builder(
    BuildContext context,
    EspansoViewModel viewModel,
    Widget? child,
  ) {
    final double screenSize = MediaQuery.sizeOf(context).width;
    const double minWidth = 750;
    final double tableWidth = max(screenSize * (2 / 3), minWidth * (2 / 3));
    final double spacingWidth = max(screenSize * (1 / 6), minWidth * (1 / 6));

    /*
    final List<Widget> titles = viewModel.titles
        .map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Tab(
                child:
                    Text(e, style: Theme.of(context).textTheme.headlineSmall),
              ),
            ))
        .toList();
        */

    final List<Widget> widgets =
        viewModel.categories.map((e) => MatchesTable2(file: e)).toList();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Scrollbar(
        controller: viewModel.scrollController,
        thumbVisibility: true,
        trackVisibility: true,
        child: SingleChildScrollView(
          controller: viewModel.scrollController,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: spacingWidth,
              ),
              DefaultTabController(
                length: widgets.length,
                child: Container(
                  width: tableWidth,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(borderRadius)),
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          height: 60,
                          padding: const EdgeInsets.only(bottom: 15),
                          child: OverflowTabBar(
                            tabs: viewModel.titles.toList(),
                            textStyle: Theme.of(context).textTheme.titleMedium,
                          )),
                      Expanded(child: TabBarView(children: widgets)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: spacingWidth)
            ],
          ),
        ),
      ),
    );
  }

  @override
  EspansoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EspansoViewModel();
}
