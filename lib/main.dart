import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_fund_web_app/ui/home_page.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAIC1J_r55frKdqY4g9j0edk1a3ZRFxFeY",
  authDomain: "social-funds-fb831.firebaseapp.com",
  projectId: "social-funds-fb831",
  storageBucket: "social-funds-fb831.appspot.com",
  messagingSenderId: "294822994367",
  appId: "1:294822994367:web:811eee12e7691e762dc10a",
  measurementId: "G-42SFV49YZY"
        ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Funds',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomePage(),
    );
  }
}
