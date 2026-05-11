# Contributing to picons

Thanks for taking the time to contribute! This project is a fork of [phosphor-icons/flutter](https://github.com/phosphor-icons/flutter), actively maintained and open to community contributions in every form — code, icons, and design.

## Ways to contribute

- **Report a bug** — something is broken or behaving unexpectedly
- **Suggest an enhancement** — a feature or improvement to the Flutter package
- **Request an icon** — you need an icon that isn't in the set yet
- **Contribute an icon** — you've designed one and want to add it
- **Improve the code** — fix a bug, refactor, or add a feature

---

## Reporting bugs

Before filing a bug:

- Make sure you're on the latest version.
- Check if the issue already exists in the [issue tracker](https://github.com/liontude/picons/issues).

When filing a bug, include:

- Flutter and Dart versions
- Steps to reproduce
- Expected vs. actual behavior
- A minimal code snippet if possible

Open a [bug report](https://github.com/liontude/picons/issues/new?labels=bug).

---

## Requesting an icon

Open an [icon request issue](https://github.com/liontude/picons/issues/new?labels=icon-request) and describe:

- What the icon represents
- Where you plan to use it
- Any visual reference (optional but helpful)

We'll review the request and either design it or open it for community design contributions.

---

## Contributing an icon

We welcome icon design contributions. To keep the set visually consistent, all icons must follow the **Phosphor design system**.

The full icon grid, guidelines, and existing icons are available in the official Figma file:
[Phosphor Icons — Figma Community](https://www.figma.com/community/file/903830135544202908/phosphor-icons)

### Design requirements

- Follow the Phosphor grid and stroke conventions from the Figma file.
- Provide all 6 styles: **Regular, Thin, Light, Bold, Fill, and Duotone**.
- Export each style as a clean SVG.

### Submission

Open a PR with:

1. The SVG files for each style under a clearly named folder.
2. A description of the icon and its intended use.

We'll handle integrating it into the font and generating the Dart code. You don't need to run the generator yourself, though the process is documented in [bin/update_process.md](bin/update_process.md).

---

## Code contributions

### Setup

```sh
flutter pub get
```

### Running the generator

The Dart classes in `lib/src/` are auto-generated. To regenerate them:

```sh
cd bin
dart pub get
dart run main.dart
```

### Submitting a PR

- One logical change per PR.
- Make sure `flutter analyze` passes with no errors.
- Follow the commit message conventions below.

---

## Commit messages

We use [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/):

```
<type>(<scope>): <subject>
```

Types: `feat`, `fix`, `chore`, `refactor`, `docs`, `style`, `test`, `perf`

Examples:
- `feat(icons): add hand-wave icon in all 6 styles`
- `fix(picon): correct duotone layer opacity`
- `docs(readme): update usage examples`

---

## Legal notice

By contributing, you confirm that you authored the content, hold the necessary rights, and agree that it may be distributed under the project's [MIT License](LICENSE).
