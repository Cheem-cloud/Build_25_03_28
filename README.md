# CheemHang_03_25

A SwiftUI-based iOS app with Google Sign-In authentication and Firebase integration.

## Setup Instructions

1. Clone the repository
2. Install dependencies:
   ```bash
   swift package resolve
   ```
3. Open the project in Xcode:
   ```bash
   xed .
   ```
4. Configure Firebase:
   - Add your `GoogleService-Info.plist` file to the project
   - Update the `GIDClientID` in `Info.plist` with your Google Client ID
   - Update the URL scheme in `Info.plist` with your Google Client ID

5. Build and run the project

## Features

- Google Sign-In authentication
- Email whitelist for access control
- Firebase integration
- SwiftUI-based UI
- Tab-based navigation

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+
- Firebase account
- Google Cloud project with OAuth 2.0 credentials 

<!-- Last updated: 2024-03-25 --> 