import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:espanso_gui_v2/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:espanso_gui_v2/services/espanso_matches_service.dart';
import 'package:espanso_gui_v2/services/file_service.dart';
import 'package:espanso_gui_v2/services/theme_service_service.dart';
import 'package:espanso_gui_v2/services/theme_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<EspansoMatchesService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FileService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ThemeServiceService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ThemeService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterEspansoMatchesService();
  getAndRegisterFileService();
  getAndRegisterThemeServiceService();
  getAndRegisterThemeService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockEspansoMatchesService getAndRegisterEspansoMatchesService() {
  _removeRegistrationIfExists<EspansoMatchesService>();
  final service = MockEspansoMatchesService();
  locator.registerSingleton<EspansoMatchesService>(service);
  return service;
}

MockFileService getAndRegisterFileService() {
  _removeRegistrationIfExists<FileService>();
  final service = MockFileService();
  locator.registerSingleton<FileService>(service);
  return service;
}

MockThemeServiceService getAndRegisterThemeServiceService() {
  _removeRegistrationIfExists<ThemeServiceService>();
  final service = MockThemeServiceService();
  locator.registerSingleton<ThemeServiceService>(service);
  return service;
}

MockThemeService getAndRegisterThemeService() {
  _removeRegistrationIfExists<ThemeService>();
  final service = MockThemeService();
  locator.registerSingleton<ThemeService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
