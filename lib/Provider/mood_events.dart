import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Models/mood_model.dart';

class MoodEvents extends ChangeNotifier {
  final List<Mood> _moodEvents = [];

  List<Mood> get moodEvents => _moodEvents;

  void addMood(Mood mood) {
    _moodEvents.add(mood);
    notifyListeners();
    _saveMoodToFirestore(mood);
  }

  void removeMood(int index) {
    _moodEvents.removeAt(index);
    notifyListeners();
    // Optional: remove from Firestore if needed
  }

  Future<void> _saveMoodToFirestore(Mood mood) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('moods')
          .add(mood.toMap());

      print("✅ Mood saved to Firestore!");
    } catch (e) {
      print("❌ Firestore error: $e");
    }
  }
}
