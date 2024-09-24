## Project Overview
This project is designed for easy integration into your own projects and to provide convenient usage. The project has two main functions: tracking the application's lifecycle and triggering biometric verifications when necessary using the local_auth package. Additionally, I have utilized the provider package, but you can replace it with another state management solution if you prefer.

## Features
### 1. Lifecycle Tracking
 The LifecycleNotifier class monitors the application's lifecycle events, such as when the app is running, moved to the background, or resumed. This helps manage user authentication and security measures based on the app's state.

### 2. Biometric Authentication
The AuthNotifier class handles biometric verification using the power of the local_auth package. It facilitates facial recognition or fingerprint verification to secure sensitive screens or actions within the app.

## Screens
To demonstrate the core logic of the project, there are two main screens:

 Screen A: This screen requires a facial scan from the user before navigating to Screen B. If the facial scan is successful, the app proceeds to Screen B. Otherwise, it shows an error and remains on Screen A.

 Screen B: This is where important operations are handled (e.g., banking accounts, password management, etc.). You can customize this screen to suit your specific needs.

## Screen A Flow:
Requests biometric verification (e.g., face scan) before navigation.
Successful scan transitions the user to Screen B.
Failed scan keeps the user on Screen A with an error message.
## Screen B Flow:
While on Screen B, the LifecycleNotifier continues monitoring the app's state.
If the app is sent to the background, a message saying "Access Blocked" appears on the recent apps screen to prevent viewing sensitive content.
When the app is reopened, biometric verification is requested again due to the importance of the operations on Screen B.
If the verification fails, the user cannot access Screen B again.
## Customization
You can easily modify the screen designs to match your application requirements. The biometric authentication and lifecycle management system are flexible and can be adapted to various use cases, especially where sensitive data and operations are involved.

## Security Features
The project ensures that sensitive content is hidden when the app is in the background.
Re-authentication is required every time the app is resumed from the background for secure access to critical screens.
## Usage
This simple system can be seamlessly integrated into most projects and provides a robust framework for managing sensitive operations with biometric authentication.

## Medium 
If you want to check out a simpler version of this project: https://medium.com/@ardacopur/flutter-ile-uygulama-yaşam-döngüsü-takip-etmek-ve-parmak-i̇zi-ile-kimlik-doğrulama-b465d4d9e89d
