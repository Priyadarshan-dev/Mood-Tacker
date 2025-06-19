import 'package:cloud_firestore/cloud_firestore.dart';

class Mood {
  final String mood;
  final String note;
  final DateTime timestamp;

  Mood({required this.mood, required this.note, required this.timestamp});

  // Convert Mood to Map for Firestore
  Map<String, dynamic> toMap() {
    return {'mood': mood, 'note': note, 'timestamp': timestamp};
  }

  // Create Mood from Firestore document
  factory Mood.fromMap(Map<String, dynamic> map) {
    return Mood(
      mood: map['mood'] ?? '',
      note: map['note'] ?? '',
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }
}
