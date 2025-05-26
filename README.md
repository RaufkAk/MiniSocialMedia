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

<img width="328" alt="Ekran Resmi 2025-05-26 01 04 17" src="https://github.com/user-attachments/assets/c8c0e1e9-1f3f-4a4a-aadb-0757988c55f4" />


## 📝 Register Page (`register_page.dart`)

### Purpose

This page allows users to create a new account by providing a username, email, and password. It uses Firebase Authentication for user registration and Firestore to store user profile data.

### Features

- Registers new users with `FirebaseAuth.createUserWithEmailAndPassword`
- Validates password confirmation to ensure both passwords match
- Shows a loading spinner during registration process
- Displays error messages using a custom helper function `displayMessageToUser`
- Creates a user document in Firestore with UID, email, username, and registration timestamp
- Provides navigation to the Login page

### Components Used

- `MyTextfield` – Custom input widget for username, email, password, and password confirmation fields  
- `MyButton` – Custom styled register button  
- `FirebaseAuth` – Firebase authentication service  
- `FirebaseFirestore` – Firestore database for storing user profiles  
- `showDialog` – Displays loading indicator during registration  
- `displayMessageToUser()` – Shows registration error messages to the user  

### UI Overview

- Clean and minimal interface featuring a user icon  
- Title text: **MINI SOCIAL MEDIA**  
- Registration form with username, email, password, and confirm password fields  
- “Already have an account? Log in here.” link for navigating back to Login page  

---

### Screenshot
<img width="324" alt="Ekran Resmi 2025-05-26 00 06 42" src="https://github.com/user-attachments/assets/4c3965de-6aec-4c6f-ba20-20a7db0a265f" />



