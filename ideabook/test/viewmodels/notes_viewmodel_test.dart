import 'package:flutter_test/flutter_test.dart';
import 'package:ideabook/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('NotesViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}