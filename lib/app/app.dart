import 'package:espanso_gui_v2/services/espanso_matches_service.dart';
import 'package:espanso_gui_v2/services/file_service.dart';
import 'package:espanso_gui_v2/services/theme_service.dart';
import 'package:espanso_gui_v2/services/theme_service_service.dart';
import 'package:espanso_gui_v2/ui/archive/espanso/espanso_view.dart';
import 'package:espanso_gui_v2/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:espanso_gui_v2/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:espanso_gui_v2/ui/views/espanso_new/espanso_new_view.dart';
import 'package:espanso_gui_v2/ui/views/home/home_view.dart';
import 'package:espanso_gui_v2/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: EspansoView),
    MaterialRoute(page: EspansoNewView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: EspansoMatchesService),
    LazySingleton(classType: FileService),
    LazySingleton(classType: ThemeServiceService),
    LazySingleton(classType: ThemeService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
