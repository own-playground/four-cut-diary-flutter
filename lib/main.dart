import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

// StatefulWidget은 화면이 로드된 이후에 변경이 있을 때 사용하는 위젯
// StatelessWidget는 화면이 로드된 이후에 변경이 없을 때 사용하는 위젯
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('네컷 일기', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold), ),
          title: Text(
            '네컷 일기',
            style: GoogleFonts.nanumPenScript(textStyle: const TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ))
          ),
          backgroundColor: Colors.orange,
          elevation: 0,
      ),
      body: Container(
        color: const Color(0xffFAF9E6),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.width,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    color: Colors.black,
                  ),
                  Container(
                    color: Colors.white,
                  ),
                  Container(
                    color: Colors.yellow,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                ],
              )
            ),
            Transform.rotate(
              angle: 60 * math.pi / 180,
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(
                    Radius.elliptical(70, 85)
                  ),
                ),
              ),
            ),
            Text('제목입니다.',
              style: GoogleFonts.nanumPenScript(
                textStyle: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w800)),
              textAlign: TextAlign.center,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(4)
                ),
                  child: Text('2024.06.20(목)', style: GoogleFonts.nanumPenScript(
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
                  ))
            ),
          ],
        )
      )
    );
  }
}
