# Riyan's portfolio

Responsive Flutter portfolio based on the supplied portfolio PDF. Includes selected projects, career history, education, nine certificates, and contact actions.

## Run locally

```sh
fvm flutter pub get
fvm flutter run -d chrome
```

## Validate and build

```sh
fvm flutter analyze
fvm flutter test
fvm flutter build web
```

The repository's `.fvmrc` selects the Flutter SDK. Use `flutter` directly if your active SDK matches it.

## Content and styling

- `lib/configs/themes/app_theme.dart`: colors, typography, and button styles.
- `lib/features/home/data/portfolio_data.dart`: profile, projects, experience, education, skills, and certificates.
- `lib/features/home/models/`: immutable content structures and project categories.
- `lib/features/home/controllers/`: GetX state for navigation, project filtering, and certificate visibility.
- `lib/features/home/bindings/home_binding.dart`: dependency registration for the home feature.
- `lib/features/home/views/components/contact_section.dart`: email and social links.
- `assets/projects/`: compressed artwork cropped from the supplied `Portofolio PDF.pdf`.
- `assets/fonts/`: bundled Roboto fonts and their license; typography does not require a Google Fonts request.

Project cards open local details. Add optional `googlePlayUrl` and `githubUrl` HTTPS addresses to a `ProjectModel` in `portfolio_data.dart` to display the corresponding buttons on both the card and detail dialog. Leave unavailable destinations null; no placeholder links are displayed. Certificates open local previews, with verification buttons for entries that have a `linkUrl`.

Scroll reveals, project hover effects, and section navigation respect the system's reduced-motion preference. Navigation and dialogs use standard keyboard-accessible Material controls. Widget tests cover mobile/tablet/desktop layouts, increased text size, navigation, project filtering, and certificate previews.
