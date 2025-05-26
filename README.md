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


## 🎨 Theme Support

- The app supports **Dark Mode** and **Light Mode**.  
- Theme changes automatically based on the user’s device settings.  
- Additional UI for switching themes manually can be added if desired.  

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
<img width="305" alt="Ekran Resmi 2025-05-26 03 23 20" src="https://github.com/user-attachments/assets/aeb4ddbc-7e17-424b-9e35-dd5b33ce884a" />


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
<img width="305" alt="Ekran Resmi 2025-05-26 03 23 53" src="https://github.com/user-attachments/assets/7302590f-a8da-4602-b7af-5acadedcad65" />

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

<div style="display: flex; gap: 12px; justify-content: center; align-items: flex-start;">
  <img width="320" alt="Ekran Resmi 2025-05-26 00 08 35" src="https://github.com/user-attachments/assets/3f38d5ba-559e-40fb-9676-074daeab0a6f" />
  <img width="320" alt="Ekran Resmi 2025-05-26 00 09 02" src="https://github.com/user-attachments/assets/2e50f4ee-609e-441f-8c55-24d656964acc" />
</div>

## 👤 Profile Page (`profile_page.dart`)

### Purpose

This page displays the profile information of the currently logged-in user, including their username, email, and a list of their posts. User data is fetched asynchronously from Firestore, and posts are streamed in real-time.

### Features

- Fetches and displays user details (`username`, `email`) from Firestore using `FutureBuilder`.  
- Shows a loading spinner while user data is being fetched.  
- Handles errors gracefully when fetching user data.  
- Displays the user's posts in real-time using a `StreamBuilder` connected to Firestore.  
- Includes a custom back button (`MyBackButton`) for easy navigation.  
- Shows posts with a custom list tile (`MyListTile`), displaying post message and user email.

### Components Used

- `FirebaseAuth` to get the currently authenticated user.  
- `FirebaseFirestore` to retrieve user profile data and posts.  
- `FutureBuilder` for asynchronous user data fetching.  
- `StreamBuilder` for real-time updates of user posts.  
- Custom widgets: `MyBackButton`, `MyListTile`.  
- `FirestoreDatabase` class that provides a stream of user posts.

### UI Overview

- Scrollable column layout including:  
  - Back button at top-left corner.  
  - Profile icon placeholder with primary theme color background.  
  - Username displayed in bold, large font.  
  - User email shown in smaller, grey-colored text.  
  - Section header titled **My Posts**.  
  - Fixed-height list showing user's posts with message and user email.

---

### Screenshot

<img width="328" alt="Ekran Resmi 2025-05-26 01 04 17" src="https://github.com/user-attachments/assets/a772a533-4f91-42ad-9811-30fc55de370f" />
<img width="303" alt="Ekran Resmi 2025-05-26 03 25 45" src="https://github.com/user-attachments/assets/ccc325f4-6c93-4a16-9936-7e1bc6b56f19" />

## 👥 Users Page (`users_page.dart`)

### Purpose

This page displays a real-time list of all registered users fetched from the Firestore "Users" collection. It allows browsing users with their usernames and emails.

### Features

- Uses a `StreamBuilder` to listen to real-time updates from Firestore's "Users" collection.  
- Shows a loading indicator while data is being fetched.  
- Handles errors gracefully by displaying a message to the user.  
- Displays a scrollable list of users using a custom list tile widget (`MyListTile`).  
- Includes a custom back button (`MyBackButton`) for navigation.

### Components Used

- `FirebaseFirestore` to stream user documents.  
- `StreamBuilder` for real-time Firestore updates.  
- Custom widgets: `MyBackButton`, `MyListTile`.  
- `displayMessageToUser()` helper function for error notifications.

### UI Overview

- Vertical column layout including:  
  - Back button at the top-left with padding.  
  - Spacer between the back button and the user list.  
  - Expanded `ListView` showing all users with username as the title and email as the subtitle in each list tile.

---

### Screenshot


<img width="308" alt="Ekran Resmi 2025-05-26 00 09 43" src="https://github.com/user-attachments/assets/1885e149-5da2-4c66-8f23-b09fda60d170" />
<img width="306" alt="Ekran Resmi 2025-05-26 03 26 14" src="https://github.com/user-attachments/assets/bf3e770b-4932-4cbd-82f2-102f14c9aa7e" />


