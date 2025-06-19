import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/Auth/register_page.dart';
import 'package:mood_tracker/Components/add_event_textfield.dart';
import 'package:mood_tracker/Provider/mood_events.dart';
import 'package:mood_tracker/Screens/mood_history.dart';
import 'package:provider/provider.dart';

import '../Models/mood_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? selectedMood;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<MoodEvents>(
      builder:
          (context, event, child) => Scaffold(
            backgroundColor: Colors.grey.shade300,
            appBar: AppBar(
              backgroundColor: Colors.grey.shade900,
              title: Text(
                "M o o d T r a c k e r",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),

            body: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "How Are You Feeling ?",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (final mood in ["😊", "😐", "🙁", "😔"])
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedMood = mood;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Container(
                                height: 200,
                                width: 190,
                                decoration:
                                    selectedMood == mood
                                        ? ShapeDecoration(
                                          shape: CircleBorder(),
                                          color: Colors.grey,
                                        )
                                        : ShapeDecoration(
                                          shape: CircleBorder(),
                                          color: Colors.transparent,
                                        ),
                                child: Center(
                                  child: Text(
                                    mood,
                                    style: TextStyle(fontSize: 140),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  SizedBox(height: 50),
                  AddEventTextfield(
                    textEditingController: controller,
                    prefixIcon: Icons.add,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MoodHistory(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade900,
                            ),
                            height: 50,
                            width: 150,
                            child: Center(
                              child: Text(
                                "Mood Diary",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          final moodNote = controller.text.trim();
                          if (selectedMood != null && moodNote.isNotEmpty) {
                            final moodObj = Mood(
                              mood: selectedMood!,
                              note: moodNote,
                              timestamp: DateTime.now(),
                            );
                            event.addMood(moodObj);
                            controller.clear();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade900,
                            ),
                            height: 50,
                            width: 100,
                            child: Center(
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 290),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade900,
                          ),
                          height: 50,
                          width: 150,
                          child: Center(
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
