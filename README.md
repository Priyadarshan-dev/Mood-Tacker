# 🧠 Mood Tracker App

A simple Flutter-based Mood Tracker application built for the Codexcelerate IT Consultancy internship task. The app allows users to log their mood along with a note, view mood history, and delete entries. All data is securely stored in Firebase using Firestore and Firebase Authentication.

---

## 📱 Features

- 🔐 Firebase Authentication (Register & Login)
- 😄 Mood selection with emoji UI
- 📝 Add a note for the day
- 📚 Mood diary (history)
- 🗑 Delete a mood entry
- ☁ Real-time Firestore database sync
- 🔒 Firebase Security Rules (per-user access)
- ✅ Single mood per user per day logic
- 📦 Clean code with Provider state management

---

## 🔧 Setup Instructions

1. *Clone the repository*
   bash
   git clone https://github.com/Priyadarshan-dev/Mood-Tacker.git
   

2. *Install dependencies*
   bash
   flutter pub get
   

3. *Configure Firebase*
   - Go to [Firebase Console](https://console.firebase.google.com)
   - Create a new project and register your Android app
   - Download the google-services.json file and place it in android/app/
   - Enable *Email/Password Authentication*
   - Enable *Cloud Firestore* and set rules to:
     js
     rules_version = '2';
     service cloud.firestore {
       match /databases/{database}/documents {
         match /users/{userId}/moods/{moodId} {
           allow read, write: if request.auth != null && request.auth.uid == userId;
         }
       }
     }
     

4. *Run the app*
   bash
   flutter run
   

---

## 🧠 Project Logic

- *Authentication*: Firebase Auth is used to register/login users.
- *Mood Entry*: Each user can select one emoji and add a mood note per day.
- *Firestore Storage*: Data is stored in:
  
  users/{uid}/moods/{auto-id}
  
- *Security*: Firestore rules ensure users only access their own data.
- *State Management*: Provider is used to manage mood entries in real-time.

---
📹 Demo Video

▶ Click here to watch the demo : https://drive.google.com/file/d/1wsbiQ2YXcfq_BAeItUQ4GaePt2UUf2Ap/view?usp=drivesdk
---

## 🗂 Folder Structure

lib/
├── main.dart
├── Models/
│   └── mood_model.dart
├── Provider/
│   └── mood_events.dart
├── Auth/
│   ├── login_page.dart
│   ├── register_page.dart
│   └── auth.dart
├── Screens/
│   ├── homepage.dart
│   └── mood_history.dart
├── Components/
│   └── add_event_textfield.dart


---

## ✅ Conclusion

This project demonstrates basic full-stack Flutter app development with Firebase integration. It handles user auth, data syncing with Firestore, and state management using Provider. Ideal for internship or junior Flutter roles.
