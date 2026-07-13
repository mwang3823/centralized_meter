# dbtt

## Common Commands
```bash
flutter run                    # Run app
flutter test                   # Run all tests
flutter build apk --release    # Build APK
dart format lib/               # Format code
dart analyze                   # Analyze code
flutter pub get                # Install dependencies
```

## Architecture
- `lib/` - Main source code
- `lib/features/` - Feature modules
- `lib/core/` - Shared utilities, services, theme
- `lib/data/` - Repositories, data sources, models
- `test/` - Unit and widget tests

## Development Guidelines
- Sử dụng BLoC/Cubit cho state management
- Tách UI và business logic rõ ràng
- Viết test cho mọi business logic
- Dùng `dart format` trước khi commit
- Chạy `dart analyze` để đảm bảo không có warnings

## Skills
- `/feature` — Tạo feature mới theo chuẩn
- `/api` — Tạo API layer (repository + model)
- `/review` — Review code/PR
- `/commit` — Tạo commit chuẩn conventional
