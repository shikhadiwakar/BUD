import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:last/ui/chat.dart';
import 'package:last/ui/chatb.dart';
import 'package:last/ui/chatd.dart';
import 'package:last/ui/avatar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bud',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        ChatPage.routeName: (context) => const ChatPage(),
        ChatBPage.routeName: (context) => const ChatBPage(),
        ChatDPage.routeName: (context) => const ChatDPage(),
      },
    );
  }
}
