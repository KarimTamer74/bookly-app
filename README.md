# 🚀 Bookly App
![Bookly Demo](app_design/shots.png)
> **Bookly** is a feature-rich Flutter app that displays a curated collection of books with powerful search capabilities.  
> The app includes detailed book pages with reading links, pagination for smooth browsing, offline data caching, and robust error handling. Built with Clean Architecture principles for scalability and maintainability.

---

## ✨ Features

- 📚 Browse a comprehensive list of books with detailed information
- 🔍 Smart search functionality to quickly find any book
- 📖 Detailed book pages with information and direct reading links
- 📄 **Pagination** for efficient data loading and smooth scrolling
- 💾 **Local data caching** - books are saved and loaded instantly on app launch
- ⚠️ **Comprehensive error handling** for network issues and edge cases
- 🎨 Clean and beautiful UI with responsive design using **flutter_screenutil**
- 🏗️ Built with **Clean Architecture** for better code organization and testability
- 🔄 State management with **flutter_bloc**
- 💉 Dependency Injection using **get_it**

---

## 🛠 Tech Stack

- ![Flutter](https://img.shields.io/badge/Flutter-3.13+-blue?logo=flutter)
- ![Dart](https://img.shields.io/badge/Dart-3.1+-blue?logo=dart)
- **Architecture**: Clean Architecture with BLoC Pattern
- **State Management**: BLoC Pattern  
- **Dependency Injection**: get_it
- **API Fetching**: dio & retrofit
- **Local Storage**: Hive for efficient data caching
- **UI**: Responsive design with flutter_screenutil
- **Other Packages**: dartz, cached_network_image, font_awesome_flutter, google_fonts, and more

---

## 🏗️ Architecture

The app follows **Clean Architecture** principles with clear separation of concerns:

- **Presentation Layer**: UI components and BLoC for state management
- **Domain Layer**: Business logic, use cases, and entities
- **Data Layer**: API integration, local caching, and repositories

This architecture ensures:
- ✅ Testability
- ✅ Scalability
- ✅ Maintainability
- ✅ Independence of frameworks and UI

---

## 🎥 **App Demo**

Check out the app demo video:  
[**Watch Video**](https://drive.google.com/file/d/10FTWhLGPklyj8HhzSsS0LBU33u1IPDSR/view?usp=drive_link)

---

## 📦 Installation

### Option 1: Download APK
[![Download APK from Google Drive](https://img.shields.io/badge/Download-Bookly_1.0.0.apk-brightgreen?style=for-the-badge&logo=android)](https://drive.google.com/drive/folders/1I9mlnQTVlxWuVbUY8epKAIVCeha82nb5?usp=drive_link)

### Option 2: Build from Source

1. Clone the repo:
   ```bash
   git clone https://github.com/KarimTamer74/bookly-app.git
   cd bookly-app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

---

## 🚀 What's New

- ✨ **Pagination**: Load books efficiently as you scroll
- 💾 **Data Persistence**: Books are cached locally and loaded instantly on startup
- ⚠️ **Error Handling**: Graceful handling of network errors and edge cases
- 🏗️ **Clean Architecture**: Migrated from MVVM to Clean Architecture for better code quality

---

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 👨‍💻 Developer

**Karim Tamer**  
[![GitHub](https://img.shields.io/badge/GitHub-KarimTamer74-black?logo=github)](https://github.com/KarimTamer74)

---
