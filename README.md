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
- `lib/features/home/data/`: section-specific content in `profile_data.dart`, `projects_data.dart`, `experience_data.dart`, `education_data.dart`, `skills_data.dart`, and `certificates_data.dart`.
- `lib/features/home/models/`: immutable content structures and project categories.
- `lib/features/home/controllers/`: GetX state for navigation, project filtering, and certificate visibility.
- `lib/features/home/bindings/home_binding.dart`: dependency registration for the home feature.
- `lib/features/home/views/components/contact_section.dart`: email and social links.
- `assets/projects/`: compressed artwork cropped from the supplied `Portofolio PDF.pdf`.
- `assets/fonts/`: bundled Roboto fonts and their license; typography does not require a Google Fonts request.

Use lowercase, hyphen-separated names for image assets (for example `riyan-portrait.jpg`). Keep only referenced images in bundled asset folders. Certificate previews are limited to 1800 px on their longest edge; project screenshots and the hero portrait are already sized for the website. Keep the font license alongside its font files.

Project cards open local details. Add optional `googlePlayUrl` and `githubUrl` HTTPS addresses to a `ProjectModel` in `projects_data.dart` to display the corresponding buttons on both the card and detail dialog. Leave unavailable destinations null; no placeholder links are displayed. Certificates open local previews, with verification buttons for entries that have a `linkUrl`.

Scroll reveals, project hover effects, and section navigation respect the system's reduced-motion preference. Navigation and dialogs use standard keyboard-accessible Material controls. Widget tests cover mobile/tablet/desktop layouts, increased text size, navigation, project filtering, and certificate previews.
