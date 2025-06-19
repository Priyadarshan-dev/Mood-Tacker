import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/Auth/login_page.dart';
import 'package:mood_tracker/Components/register_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Create Account",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          RegisterTextfield(
            textEditingController: userNameController,
            hinText: "Full Name",
            obscureText: false,
            prefixIcon: Icons.person,
          ),
          SizedBox(height: 20),
          RegisterTextfield(
            textEditingController: emailController,
            hinText: "E-mail",
            obscureText: false,
            prefixIcon: Icons.email,
          ),
          SizedBox(height: 20),
          RegisterTextfield(
            textEditingController: passwordController,
            hinText: "Password",
            obscureText: true,
            prefixIcon: Icons.lock,
          ),
          SizedBox(height: 20),
          RegisterTextfield(
            textEditingController: confirmPassController,
            hinText: "Confirm Password",
            obscureText: true,
            prefixIcon: Icons.lock,
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () async {
              String username = userNameController.text.trim();
              String email = emailController.text.trim();
              String password = passwordController.text.trim();
              String confirmPass = confirmPassController.text.trim();
              // if the text field are empty
              if (username.isEmpty ||
                  email.isEmpty ||
                  password.isEmpty ||
                  confirmPass.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please Enter All the Fields")),
                );
                return;
              }
              // if pass not equal
              if (password != confirmPass) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Passwords Do not Match")),
                );
                return;
              }

              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Registered SuccessFully")),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Error: ${e.toString()}")),
                );
                print("Error: $e");
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 60,
                width: 370,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.redAccent,
                ),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already Have An Account ? ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
