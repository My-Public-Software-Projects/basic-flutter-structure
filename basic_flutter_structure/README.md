# Basic Flutter Structure

A package to generate a base Flutter project structure. This package helps you quickly set up a new Flutter project with a predefined structure, including common directories and files.

## Features

- Generates common directories and files for a Flutter project.
- Includes helper files for themes, shared preferences, and more.
- Provides a basic navigation setup.

## Getting Started

To use this package, add it as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  basic_flutter_structure:
    path: ../basic_flutter_structure
```

## Usage

To generate the basic structure of a Flutter project, use the `FlutterProjectGenerator.createBaseStructure` method.

## Example

Here is an example of how to use this package:

```dart
import 'package:basic_flutter_structure/basic_flutter_structure.dart';

void main() {
  FlutterProjectGenerator.createBaseStructure('path_to_your_project');
}
```

## Example
Here is an example of how to use this package:
```import 'package:basic_flutter_structure/basic_flutter_structure.dart';

void main() {
  // Specify the path where you want to create the project structure
  String projectPath = 'path_to_your_project';
  
  // Generate the project structure
  FlutterProjectGenerator.createBaseStructure(projectPath);
}
```

## Additional Information

For more information, please refer to the documentation or contact the package authors.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

Cela devrait résoudre le problème et permettre la mise à jour des packages.