import 'package:espanso_gui_v2/ui/widgets/common/matches_table/matches_table.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'espanso_viewmodel.dart';

class EspansoView extends StackedView<EspansoViewModel> {
  const EspansoView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EspansoViewModel viewModel,
    Widget? child,
  ) {
    final double sidePadding = MediaQuery.sizeOf(context).width / 6;

    final List<Widget> titles = viewModel.titles
        .map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Tab(
                child:
                    Text(e, style: Theme.of(context).textTheme.headlineSmall),
              ),
            ))
        .toList();

    final List<Widget> widgets =
        viewModel.categories.map((e) => MatchesTable(file: e)).toList();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        alignment: Alignment.topCenter,
        child: DefaultTabController(
          length: widgets.length,
          child: Container(
            margin: EdgeInsets.only(
                top: 50, bottom: 100, left: sidePadding, right: sidePadding),
            padding: const EdgeInsets.all(16.0),
            width: 1030,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    height: 60,
                    width: 1000,
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TabBar(
                      // onTap: (e) => hideOverlay(),
                      tabs: titles,
                    )),
                Expanded(child: TabBarView(children: widgets)),
              ],
            ),
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
