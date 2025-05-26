# mini_social_media

Mini Social Media App is a basic social media application developed with Flutter and powered by Firebase services. Users can create accounts, log in, and share posts.

## 🚀 Features

- 🔐 User registration and login (Firebase Authentication)
- 📝 Creating posts (saved to Firestore)
- 📰 Listing posts on the home page
- 📱 Modern and responsive Flutter UI

## 🛠️ Technologies Used

- Flutter (Dart)  
- Firebase Authentication  
- Firebase Firestore  

---

## 🔐 Login Page (`login_page.dart`)

### Purpose

This page allows users to log in using their email and password via Firebase Authentication.

### Features

- Authenticates users with `FirebaseAuth.signInWithEmailAndPassword`
- Shows a loading spinner while signing in
- Displays error messages using a custom helper function `displayMessageToUser`
- Provides navigation to the Register page
- Includes a “Forgot Password?” prompt (not yet functional)

### Components Used

- `MyTextfield` – Custom input widget for email and password fields  
- `MyButton` – Custom styled login button  
- `FirebaseAuth` – Firebase authentication service  
- `showDialog` – Displays loading indicator during login process  
- `displayMessageToUser()` – Shows authentication error messages to the user  

### UI Overview

- Clean and minimal interface featuring a user icon  
- Title text: **MINI SOCIAL MEDIA**  
- Login form with email and password fields  
- “Don’t have an account?” prompt with **Register Here** navigation link  

---

### Screenshot

![Login Screen](https://github.com/user-attachments/assets/29c63826-c0eb-4c2d-9cd8-e3a0880418fd)
