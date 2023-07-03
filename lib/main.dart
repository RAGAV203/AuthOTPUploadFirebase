//import 'package:proj_1/pages/welcome_screen.dart';
import 'package:provider/provider.dart';
import '../widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../provider/auth_provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WidgetTree(), 
      title: 'Flutter APP',
      ),
    );
  }
}

