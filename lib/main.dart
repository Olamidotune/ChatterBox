import 'package:chatterbox/config/colors.dart';
import 'package:chatterbox/presentations/screens/auth/sign_in.dart';
import 'package:chatterbox/presentations/screens/auth/sign_up.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     theme: ThemeData(
              primaryColor: THEME,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'DMSans',
              scaffoldBackgroundColor: Colors.white,
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  fontSize: 14,
                  color: BLACK_2,
                ),
                bodySmall: TextStyle(
                  fontSize: 12,
                  color: BLACK_2,
                ),
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              fontFamily: 'DMSans',
              textTheme: TextTheme(
                bodySmall: TextStyle(color: Colors.white),
                bodyLarge: TextStyle(
                  color: BLACK_2,
                  fontWeight: FontWeight.w500,
                ),
                bodyMedium: TextStyle(color: Colors.white),
                titleLarge: TextStyle(color: Colors.white),
                titleMedium: TextStyle(color: Colors.white),
                titleSmall: TextStyle(color: Colors.white),
                displayLarge: TextStyle(color: Colors.white),
                displayMedium: TextStyle(color: Colors.white),
                displaySmall: TextStyle(color: Colors.white),
              ),
              scaffoldBackgroundColor: Colors.black,
            ),
      home: const SignInScreen(),
      routes: {
        SignInScreen.routeName:(context) => SignInScreen(),
        SignUpScreen.routeName:(context) => SignUpScreen()
      },
    );
  }
}
