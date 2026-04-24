# Repository Guidelines

## Project Structure & Module Organization
`ohos_shell/` is the application root. Main Flutter code lives in `ohos_shell/lib/`: `pages/` for screens, `providers/` for state, `serivces/` for data and auth flows, `widgets/`, `models/`, `utils/`, and `injection/`. Static assets are in `ohos_shell/assets/`, and Flutter tests live in `ohos_shell/test/`. The HarmonyOS wrapper lives in `ohos_shell/ohos/`, with app metadata in `AppScope/`, module config in `entry/`, and ETS tests under `entry/src/ohosTest/`. Repository-level CI is in `.github/workflows/`.

## Build, Test, and Development Commands
Run commands from `ohos_shell/` unless noted otherwise.

- `flutter pub get` installs Dart and Flutter dependencies.
- `flutter analyze` runs the `flutter_lints` rules from `analysis_options.yaml`.
- `flutter test` runs the Flutter widget and unit tests in `test/`.
- `flutter gen-l10n` regenerates `lib/l10n/app_localizations*.dart` from the ARB files.
- `flutter build hap --release` builds a HarmonyOS `.hap`; this mirrors the CI workflow and requires an OHOS-enabled Flutter SDK plus `hvigor`.

## Coding Style & Naming Conventions
Use standard Dart style: 2-space indentation, `snake_case.dart` filenames, `UpperCamelCase` for types, and `lowerCamelCase` for fields and methods. Prefer `package:bugaoshan_ohos/...` imports inside Flutter code. Follow the existing directory split instead of mixing UI, services, and models in one file. Do not hand-edit generated localization files under `lib/l10n/`; update the `.arb` sources instead. If DI registrations change, keep `lib/injection/injector.dart` and `injector.config.dart` in sync.

## Testing Guidelines
Add or update `flutter_test` coverage for UI or logic changes. Place Dart tests in `ohos_shell/test/` and use the `*_test.dart` naming pattern. For HarmonyOS wrapper changes, add ETS tests under `ohos_shell/ohos/entry/src/ohosTest/ets/test/` using the existing `*.test.ets` pattern. Before opening a PR, run `flutter analyze` and `flutter test`; run `flutter build hap --release` when packaging or wrapper behavior changes.

## Commit & Pull Request Guidelines
Recent commits use short, lowercase type prefixes such as `feat:` and `feature:`. Keep subjects imperative and focused, for example `feat: add classroom detail filtering`. PRs should describe the user-visible change, list touched areas such as `lib/`, `assets/`, or `ohos/`, link the related issue when available, and include screenshots for UI work. Include the commands you ran for validation.

## Security & Configuration Tips
Do not commit signing keys, certificates, or local OHOS build artifacts. The CI workflow restores signing material from GitHub secrets, so local credentials should stay outside the repository.
