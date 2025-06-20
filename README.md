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
- *Mood Entry*: Each user can select one emoji and add a mood note.
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
├── Auth/
│   ├── auth.dart                  # Handles auth state and routes user accordingly
│   ├── login_page.dart            # Login UI and logic
│   └── register_page.dart         # Registration UI and logic
│
├── Components/
│   ├── add_event_textfield.dart   # Reusable widget for adding notes
│   ├── loginpage_textfield.dart   # Reusable textfield for login
│   ├── register_textfield.dart    # Reusable textfield for register
│   └── tab_bar.dart               # Tab bar UI with Home, History, Settings
│
├── Models/
│   └── mood_model.dart            # Mood model with toMap/fromMap methods
│
├── Provider/
│   └── mood_events.dart           # Provider for managing mood data and saving to Firestore
│
├── Screens/
│   ├── homepage.dart              # Main mood entry screen
│   ├── mood_history.dart          # Displays list of saved moods from Firestore
│   ├── settings_page.dart         # Logout and future settings
│   └── firebase_options.dart      # Firebase config file (auto-generated)
│
├── main.dart                      # App entry point

---

## ✅ Conclusion

This project demonstrates basic full-stack Flutter app development with Firebase integration. It handles user auth, data syncing with Firestore, and state management using Provider. Ideal for internship or junior Flutter roles.
