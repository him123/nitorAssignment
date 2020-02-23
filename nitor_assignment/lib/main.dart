import 'package:flutter/material.dart';
import 'package:nitor_assignment/screens/home_screen.dart';
import 'package:nitor_assignment/screens/user_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nitor infotech',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.white,
        canvasColor: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'Poppins',
      ),
      home: HomeScreen(),
      routes: {
        UserDetailsScreen.id: (context) => UserDetailsScreen(),
      },
    );
  }
}
