import 'package:flutter/material.dart';
import 'package:mood_tracker/Components/add_event_textfield.dart';
import 'package:mood_tracker/Provider/mood_events.dart';
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                          setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Added To Mood History")),
                            );
                          });
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
                ],
              ),
            ),
          ),
    );
  }
}
