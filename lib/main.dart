import 'package:flutter/material.dart';
import 'package:espanso_gui_v2/app/app.bottomsheets.dart';
import 'package:espanso_gui_v2/app/app.dialogs.dart';
import 'package:espanso_gui_v2/app/app.locator.dart';
import 'package:espanso_gui_v2/app/app.router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_services/stacked_services.dart';

ThemeData THEME = ThemeData.from(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade600),
    textTheme: GoogleFonts.dmSansTextTheme());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.espansoView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
      theme: THEME,
      /*
      ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          background: const Color.fromARGB(255, 230, 230, 230),
        ),
        tabBarTheme: const TabBarTheme(
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.black,
          dividerHeight: 0.5,
          labelPadding: EdgeInsets.symmetric(horizontal: 8),
        ),
        useMaterial3: true,
      ),
      */
    );
  }
}
