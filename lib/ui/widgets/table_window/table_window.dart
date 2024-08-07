import 'package:flutter/material.dart';
import 'package:overflow_tab_bar/overflow_tab_bar.dart';
import 'package:stacked/stacked.dart';

import 'table_window_model.dart';

class TableWindow extends StackedView<TableWindowModel> {
  final List<Widget> widgets;
  final Iterable<String> titles;
  const TableWindow({super.key, required this.widgets, required this.titles});

  @override
  Widget builder(
    BuildContext context,
    TableWindowModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: widgets.length,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.only(bottom: 15),
              child: OverflowTabBar(
                tabs: titles.toList(),
                textStyle: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(child: TabBarView(children: widgets)),
          ],
        ),
      ),
    );
  }

  @override
  TableWindowModel viewModelBuilder(
    BuildContext context,
  ) =>
      TableWindowModel();
}
