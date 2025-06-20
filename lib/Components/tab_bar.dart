import 'package:flutter/material.dart';
import 'package:mood_tracker/Screens/homepage.dart';
import 'package:mood_tracker/Screens/mood_history.dart';
import 'package:mood_tracker/Screens/settings_page.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text(
            "M o o d T r a c k e r",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.grey.shade300,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: EdgeInsets.all(12),
                child: TabBar(
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 3, color: Color(0xFF7B5E57)),
                    insets: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  labelColor: Color(0xFF7B5E57),
                  unselectedLabelColor: Color(0xFFCBBFAD),
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(text: "Home"),
                    Tab(text: "Mood History"),
                    Tab(text: "Settings"),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [Homepage(), MoodHistory(), SettingsPage()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

