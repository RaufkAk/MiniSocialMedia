# mini_social_media

Mini Social Media App, Flutter ile geliştirilen ve Firebase servisleri ile desteklenen temel bir sosyal medya uygulamasıdır. Kullanıcılar hesap oluşturabilir, giriş yapabilir ve gönderi paylaşabilir.

## 🚀 Özellikler

- 🔐 Kullanıcı kaydı ve giriş (Firebase Authentication)
- 📝 Gönderi oluşturma (Firestore’a kayıt)
- 📰 Ana sayfada gönderi listeleme
- 📱 Modern ve responsive Flutter arayüzü

## 🛠️ Kullanılan Teknolojiler

- **Flutter** (Dart)
- **Firebase Authentication**
- **Firebase Firestore**

🔐 Login Page (login_page.dart)

📌 Purpose:

This page allows users to log in to the app using their email and password via Firebase Authentication.

🚀 Features:
	•	Authenticates users using FirebaseAuth.signInWithEmailAndPassword
	•	Displays a loading indicator while logging in
	•	Shows error messages with a custom helper function displayMessageToUser
	•	Provides navigation to the Register page
	•	Includes a “Forgot Password?” text (not functional yet)

🛠️ Components Used:
	•	MyTextfield – Custom text input widget for email and password fields
	•	MyButton – Custom styled login button
	•	FirebaseAuth – Firebase authentication service
	•	showDialog – Displays loading spinner during sign-in
	•	displayMessageToUser() – Shows auth errors to the user

💡 UI Summary:
	•	A minimal and clean interface with a user icon
	•	Title: “MINI SOCIAL MEDIA”
	•	Login form with email and password
	•	“Don’t have an account?” message with Register Here navigation


