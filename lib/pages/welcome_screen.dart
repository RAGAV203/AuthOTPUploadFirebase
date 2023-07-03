import 'package:flutter/material.dart';
import 'package:proj_1/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_button.dart';
import 'RegisterScreen.dart';
import 'home_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap= Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Center(
             child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/Online-learning.gif",
                  height: 300,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Let's get started",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Upload your photo to our securely",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed: () {
                      ap.isSignedIn == true ?
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage()
                      )) : Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterScreen()
                      ),
                    );
                    },
                    text: "Get Started",
                  )
                )
              ],   
           ),
        ),
      ),
      ),
    );
  }
}