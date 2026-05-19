# Update Process

## Requirements

- Flutter >= 3.44.0
- Dart >= 3.12.0

## Steps

1. Make sure you are in the `bin/` directory and dependencies are installed:

   ```sh
   cd bin
   dart pub get
   ```

2. Run the generator — it downloads the latest Phosphor release and regenerates
   all Dart files:

   ```sh
   dart run main.dart
   ```

3. Go back to the package root and verify no analysis errors:

   ```sh
   cd ..
   flutter analyze
   ```

4. Update the version in `pubspec.yaml`.

5. Add a `CHANGELOG.md` entry.

6. Commit the updated files:
   - `pubspec.yaml` — new version
   - `lib/src/picons_*.dart` — regenerated icon constants
   - `lib/src/picons_base.dart` — regenerated style switcher
   - `lib/fonts/Phosphor*.ttf` — updated font files
   - `example/lib/constants/all_icons.dart` — regenerated example constants
   - `CHANGELOG.md`

7. Publish:

   ```sh
   dart pub publish --dry-run
   dart pub publish
   ```
