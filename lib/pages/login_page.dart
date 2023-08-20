import 'dart:ui';

import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPassController = TextEditingController();

  String? usernameError;
  String? emailError;
  String? passwordError;
  String? confPassError;

  void resetValidation() {
    setState(() {
      usernameError = null;
      emailError = null;
      passwordError = null;
      confPassError = null;
    });
  }

  void loginValidation() {
    resetValidation();

    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confPass = confPassController.text;

    if(username.isEmpty) {
      setState(() {
        usernameError = "Username can't be empty";
      });

      return;
    }

    if(email.isEmpty) {
      setState(() {
        emailError = "Email can't be empty";
      });

      return;
    }

    if(password.isEmpty) {
      setState(() {
        passwordError = "Password can't be empty";
      });

      return;
    }

    if(confPass.isEmpty) {
      setState(() {
        confPassError = "Confirm Password can't be empty";
      });

      return;
    }

    if(username.length < 5) {
      setState(() {
        usernameError = "Username must be at least 5 characters";
      });

      return;
    }

    if(!email.contains('@gmail.com')) {
      setState(() {
        emailError = "Email must be ended with @gmail.com";
      });

      return;
    }

    if(password.length < 8) {
      setState(() {
        passwordError = "Password must be at least 8 characters";
      });

      return;
    }

    if(password != confPass) {
      setState(() {
        confPassError = "Confirm password must be the same as password!";
      });

      return;
    }

    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: const Text("Success"),
          content: Text("Hello, $username!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute (
                    builder: (context) {
                      return HomePage(username: username);
                    }
                  ),
                  (route) => false
                );
              }, 
              child: const Text("Ok")
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: [
            Center(child: 
              Image.asset(
                "logo.png",
                width: 250,
                height: 250,
              )
            ),
            
            const SizedBox(
              height: 35.0,
            ),

            const Center(child:
              Text("JOMINO PIZZA",
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(
              height: 35.0,
            ),

            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                errorText: usernameError,
                hintText: "Username",
                labelText: "Username",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
              ),
            ),

            const SizedBox(
              height: 25.0,
            ),

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                errorText: emailError,
                hintText: "Email",
                labelText: "Email",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
              ),
            ),

            const SizedBox(
              height: 25.0,
            ),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                errorText: passwordError,
                hintText: "Password",
                labelText: "Password",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
              ),
            ),

            const SizedBox(
              height: 25.0,
            ),

            TextField(
              controller: confPassController,
              obscureText: true,
              decoration: InputDecoration(
                errorText: confPassError,
                hintText: "Confirm Password",
                labelText: "Confirm Password",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
              ),
            ),

            const SizedBox(
              height: 35.0,
            ),

            ElevatedButton(
              onPressed: loginValidation,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(60), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )// NEW
              ),
              child: 
                const Text(
                  "LOGIN",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}