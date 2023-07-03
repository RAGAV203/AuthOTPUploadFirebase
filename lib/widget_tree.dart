import './provider/auth_provider.dart';

import '../pages/welcome_screen.dart';
//import '../auth.dart';
import '../pages/home_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(

      stream: AuthProvider().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Homepage();
        } else {
          return const WelcomeScreen();
        }
      },
    );
  }
}