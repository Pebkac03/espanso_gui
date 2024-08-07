import 'package:flutter_test/flutter_test.dart';
import 'package:espanso_gui_v2/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('EspansoNewViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
