import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:basic_flutter_structure/basic_flutter_structure.dart';

void main() {
  test('createBaseStructure creates the correct files and directories', () {
    final testPath = 'test_project';
    FlutterProjectGenerator.createBaseStructure(testPath);

    // Check if the base directory exists
    expect(Directory(testPath).existsSync(), true);

    // Check if the common files exist
    expect(File('$testPath/lib/common/helper.dart').existsSync(), true);
    expect(File('$testPath/lib/common/theme.dart').existsSync(), true);
    expect(
        File('$testPath/lib/common/variable_globale.dart').existsSync(), true);

    // Check if the data files exist
    expect(File('$testPath/lib/data/api.dart').existsSync(), true);
    expect(
        File('$testPath/lib/data/shared_preferences.dart').existsSync(), true);

    // Check if the view files exist
    expect(File('$testPath/lib/view/manage.dart').existsSync(), true);
    expect(File('$testPath/lib/view/start.dart').existsSync(), true);

    // Check if the onboarding files exist
    expect(
        File('$testPath/lib/view/interfaces/onboarding/onboarding_1.dart')
            .existsSync(),
        true);
    expect(
        File('$testPath/lib/view/interfaces/onboarding/onboarding_2.dart')
            .existsSync(),
        true);
    expect(
        File('$testPath/lib/view/interfaces/onboarding/onboarding_3.dart')
            .existsSync(),
        true);
    expect(
        File('$testPath/lib/view/interfaces/onboarding/onboarding.dart')
            .existsSync(),
        true);

    // Check if the splash screen file exists
    expect(
        File('$testPath/lib/view/interfaces/splash_screen.dart').existsSync(),
        true);

    // Check if the widget navigation file exists
    expect(
        File('$testPath/lib/view/widgets/widget_navigation.dart').existsSync(),
        true);

    // Clean up
    Directory(testPath).deleteSync(recursive: true);
  });
}
