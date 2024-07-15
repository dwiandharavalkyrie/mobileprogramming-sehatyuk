import 'package:flutter/material.dart';
import 'package:sehatyuk/pages/onboarding.dart';
import 'package:sehatyuk/pages/registerpage.dart';
import 'package:sehatyuk/pages/loginpage.dart';
import 'package:sehatyuk/pages/mainpage.dart';
import 'package:sehatyuk/pages/mainchatdokterpage.dart'; // Pastikan impor file mainchatdokterpage.dart dengan benar
import 'package:sehatyuk/pages/pendaftaranpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Sets the initial route to OnboardingPage
      routes: {
        '/': (context) =>
            const OnboardingPage(), // Home route mapped to OnboardingPage
        '/register': (context) =>
            const RegisterPage(), // Register route mapped to RegisterPage
        '/login': (context) =>
            const LoginPage(), // Login route mapped to LoginPage
        '/main': (context) => const MainPage(), // Main route mapped to MainPage
        '/pendaftaran': (context) =>
            const PendaftaranPage(), // Pendaftaran route mapped to PendaftaranPage
        '/mainchatdokter': (context) =>
            const MainChatDokterPage(), // Route mapped to MainChatDokterPage
      },
    );
  }
}
