# Origin UI
---

## Getting Started 🚀

### Flutter
The first thing you need is to setup flutter, please follow the steps: 
1. https://docs.flutter.dev/get-started/install
2. https://docs.flutter.dev/get-started/editor

### Running the project
This project has 3 environments:

- development
- staging
- production

To run the desired environment either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --target lib/main_development.dart

# Staging
$ flutter run --target lib/main_staging.dart

# Production
$ flutter run --target lib/main_production.dart
```

## Architecture
The project architecture aims to separete the UI from the domain. The code under **/lib** folder is only responsible components and state management.

All the code related with the domain (bussiness logic, api calls, json parse...) is under **/packages/domain** (check its readme too). 

This way the only part of the domain visible to the UI are the use cases and entities.

There is also another important package, **origin_design_system** , which contains the design system for the project, following the atomic design pattern.

---
## Running Tests 🧪

### Unit tests

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

### Integration tests
1. To run the integration tests locally on your machine you will first need to run the origin-api. You can do this following the README of the project. 
2. Then download chromedriver:
     https://chromedriver.chromium.org
3. After the download complete, open the folder and run chromedriver at port 4444 on your machine: 
    ```./chromedriver --port=4444```
4. Run the integrations tests:
    ```flutter -d chrome drive --driver=test_driver/integration_test.dart --target=integration_test/main_test.dart --web-port=8080```

---

## Continuous Integration 🤖
On each pull request and push, the CI `formats`, `lints`, and `tests` the code. This ensures the code remains consistent and behaves correctly as you add functionality or make changes. The project uses [Very Good Workflows][very_good_coverage_link] for Code coverage.

---
## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Localizations

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

2. Run the command to generate the new string :
```flutter gen-l10n```

3. Use the new string

```dart
import 'package:origin_ui/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

---

[internationalization_link]: https://docs.flutter.dev/development/accessibility-and-localization/internationalization
[flutter_localizations_link]: https://pub.dev/packages/flutter_localization

[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage