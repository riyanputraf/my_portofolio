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
- `lib/features/home/models/project_model.dart`: seven projects and their categories.
- `lib/features/home/controllers/home_controller.dart`: experience, education, skills, and certificates.
- `lib/features/home/views/components/contact_section.dart`: email and social links.
- `assets/projects/`: compressed artwork cropped from the supplied `Portofolio PDF.pdf`.
- `assets/fonts/`: bundled Roboto fonts and their license; typography does not require a Google Fonts request.

Project cards open local details because no individual project repository or live-demo URLs were supplied. Certificates open local previews; only the supplied non-placeholder verification URL is exposed. Add confirmed verification URLs through `linkUrl` to enable additional verification buttons.

Scroll reveals, project hover effects, and section navigation respect the system's reduced-motion preference. Navigation and dialogs use standard keyboard-accessible Material controls. Widget tests cover mobile/tablet/desktop layouts, increased text size, navigation, project filtering, and certificate previews.
