# AI 戀愛交友應用程式

## 專案概述

這是一個使用 Flutter 開發的行動交友應用程式，旨在讓使用者能夠與 AI 驅動的角色進行浪漫互動。本應用程式專注於提供個人化的使用者體驗、確保安全性，並保持未來功能擴展的彈性。

## 功能特色

### 使用者認證與檔案管理
*   **註冊/登入**: 支援電子郵件/密碼註冊與登入。
*   **個人檔案建立與編輯**: 使用者可以建立和更新個人資訊，包括照片。
*   **興趣與偏好**: 使用者可以選擇興趣標籤並設定配對偏好。

### 配對系統
*   **滑動介面**: 直觀的卡片式使用者介面，用於喜歡或跳過 AI 角色。
*   **AI 角色互動**: 喜歡 AI 角色後會啟動聊天，並由通用腳本引導。

### 即時聊天
*   **聊天列表**: 顯示所有與 AI 角色進行中的對話。
*   **一對一聊天室**: 為配對成功的 AI 角色提供專屬聊天室。
*   **文字訊息**: 即時文字訊息的傳送與接收。
*   **訊息時間戳記**: 顯示每條訊息的發送時間。

### 導航
*   **底部導航列**: 輕鬆在滑動、聊天和個人檔案畫面之間切換。

## 技術棧

*   **前端**: Flutter (Dart)
*   **後端**: RESTful API (網址將另行提供)

## 開始使用

請依照以下說明，在您的本機電腦上設定並執行本專案，以便進行開發和測試。

### 前置條件

*   [Flutter SDK](https://flutter.dev/docs/get-started/install)
*   程式碼編輯器，例如 [VS Code](https://code.visualstudio.com/) 或 [Android Studio](https://developer.android.com/studio)

### 安裝

1.  **導航至專案目錄：**
    ```bash
    cd /Users/eloise/work/project/flutter/pr005/dating_app
    ```

2.  **取得 Flutter 依賴項：**
    ```bash
    flutter pub get
    ```

### 執行應用程式

要在連接的設備或模擬器上執行應用程式：

```bash
flutter run
```

如果您連接了多個設備，可能需要指定一個：

```bash
flutter run -d <device_id>
```
(例如，`flutter run -d macos` 用於 macOS 桌面，或 `flutter run -d <emulator_id>` 用於 Android/iOS 模擬器)

## 專案結構

`lib` 目錄的組織結構如下：

```
lib/
|-- api/             # API 客戶端和服務定義
|-- models/          # 使用者、角色、訊息等資料模型
|-- screens/         # 應用程式不同部分的 UI
|   |-- auth/        # 認證相關畫面 (登入、註冊)
|   |-- chat/        # 聊天相關畫面 (聊天列表、聊天室)
|   |-- matching/    # 配對/滑動畫面
|   |-- profile/     # 使用者個人檔案相關畫面 (個人檔案、編輯個人檔案)
|   |-- main_screen.dart # 帶有底部導航的主畫面
|   |-- welcome_screen.dart # 初始歡迎畫面
|-- widgets/         # 可重用 UI 組件
|-- main.dart        # 應用程式的主要入口點
```

## 未來增強功能

*   與真實後端 API 整合。
*   實作第三方登入 (Google, Facebook)。
*   進階配對演算法。
*   語音/視訊聊天功能。
*   虛擬禮物和社群活動。
*   新配對和訊息的推播通知。
