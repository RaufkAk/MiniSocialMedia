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

## 🏠 Home Page (`home_page.dart`)

### Purpose

This is the main feed page where users can create new posts and view posts shared by others in real-time. It integrates with Firestore to read and write posts.

### Features

- Allows users to write and post messages using a text input and a post button  
- Posts are saved to Firestore via a dedicated `FirestoreDatabase` class  
- Displays a real-time list of posts using `StreamBuilder` to listen to Firestore updates  
- Shows a loading indicator while posts are loading  
- Displays a friendly message when there are no posts available  
- Includes a navigation drawer (`MyDrawer`) for app-wide navigation  

### Components Used

- `MyTexfield` – Custom input widget for entering new post messages  
- `MyPostButton` – Custom button widget to submit new posts  
- `MyListTile` – Custom list tile widget to display individual posts with message and user email  
- `StreamBuilder` – Flutter widget to build UI based on real-time Firestore data stream  
- `FirestoreDatabase` – Custom class handling Firestore read/write operations  

### UI Overview

- Simple, clean layout with an AppBar titled **F E E D**  
- Text input and post button aligned horizontally at the top  
- Scrollable list of posts below, showing message text and user email  
- Drawer menu accessible via AppBar  

---

### Screenshot


<img width="320" alt="Ekran Resmi 2025-05-26 00 08 35" src="https://github.com/user-attachments/assets/3f38d5ba-559e-40fb-9676-074daeab0a6f" /><img width="325" alt="Ekran Resmi 2025-05-26 00 09 02" src="https://github.com/user-attachments/assets/2e50f4ee-609e-441f-8c55-24d656964acc" />


