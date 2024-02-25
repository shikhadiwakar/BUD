import 'package:flutter/material.dart';
import 'package:last/ui/chat.dart';
import 'package:last/ui/chatb.dart';
import 'package:last/ui/chatd.dart';

void main() {
  runApp(
      MaterialApp(
        routes: {
          '/chat': (context) => ChatPage(),
          '/chatb': (context) => ChatBPage(),
          '/chatd': (context) => ChatDPage(),
        },
      )
  );
}

class HomePage extends StatelessWidget {
  static const routeName  = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFFFFFDE1),
      ),
      home: Scaffold(
        body: ListView(children: [
          AndroidLarge3(),
        ]),
      ),
    );
  }
}

class AndroidLarge3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 799,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Color(0xFFFFFDE1)),
      child: Stack(
        children: [
          Positioned(
            left: 15,
            top: 66,
            child: SizedBox(
              width: 324,
              height: 32,
              child: Text(
                'Choose your Avatar',
                style: TextStyle(
                  color: Color(0xFF237440),
                  fontSize: 31,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  height: 0.8,
                ),
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: 40,
            child: SizedBox(
              width: 132,
              height: 26,
              child: Text(
                'hi',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            top: 140,
            child: Container(
              width: 150,
              height: 160,
              decoration: ShapeDecoration(
                color: Color(0x42237440),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            top: 500,
            child: Container(
              width: 150,
              height: 160,
              decoration: ShapeDecoration(
                color: Color(0x3FE7E14C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Positioned(
            left: 180,
            top: 320,
            child: Container(
              width: 150,
              height: 160,
              decoration: ShapeDecoration(
                color: Color(0x666F6D6D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Positioned(
            left: 40,
            top: 510,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/chatd'); // Navigate to chatb.dart
              },
            child: Container(
              width: 130,
              height: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/cluffy.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ),
          Positioned(
            left: 0,
            top: 150,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/chatb'); // Navigate to chatb.dart
              },
            child: Container(
              width: 204,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/dp3.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          ),
          Positioned(
            left: 200,
            top: 186,
            child: SizedBox(
              width: 106,
              height: 10,
              child: Text(
                'hello, this is',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0.83,
                ),
              ),
            ),
          ),
          Positioned(
            left: 199,
            top: 538,
            child: SizedBox(
              width: 83,
              height: 10,
              child: Text(
                'ahoy, this is',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0.83,
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            top: 365,
              child: SizedBox(
              width: 83,
              height: 10,
              child: Text(
                'ayo, this is',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0.83,
                ),
              ),
            ),
            ),
      Positioned(
            left: 198,
            top: 203,
            child: SizedBox(
              width: 82,
              height: 64,
              child: Text(
                'Bud ',
                style: TextStyle(
                  color: Color(0xFF237440),
                  fontSize: 35,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 198,
            top: 552,
            child: SizedBox(
              width: 102,
              height: 64,
              child: Text(
                'Luffy',
                style: TextStyle(
                  color: Color(0xFFFBBF3D),
                  fontSize: 35,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 28,
            top: 386,
            child: SizedBox(
              width: 180,
              height: 64,
              child: Text(
                'Deadpool',
                style: TextStyle(
                  color: Color(0xFFC70C14),
                  fontSize: 30,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 183,
            top: 332,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/chat'); // Navigate to chat.dart
              },
            child: Container(
              width: 144,
              height: 136,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Deadpool.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          ),
     ],
      ),
    );

  }
}
