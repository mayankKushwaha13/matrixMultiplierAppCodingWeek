import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled4/2x2matrixPage.dart';
import 'package:untitled4/3x3matrix.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int myIndex = 0;

  List<Widget> PageList = [
    MatrixMultiplyScreen(),
    Matrix3x3Page(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228,229,241),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromARGB(255, 228,229,241),
          color: const Color.fromARGB(255, 72, 75, 106),
          animationDuration: Duration(milliseconds: 300),
          onTap: (index){
            setState(() {
              myIndex = index;
            });
          },
          index: myIndex,
          items: [
            Container(
              height: 35,
              width: 35,
              child: Image.asset('lib/assets/matrix.png',
              color: Colors.white,
              ),
            ),
            Container(
              height: 35,
              width: 35,
              child: Column(
                children: [
                  Image.asset('lib/assets/locator.png',
                  color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),

        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 72, 75, 106),
          title: Text('Matrix Multiplier',
          style: GoogleFonts.lato(
            fontSize: 28,
            color: Color.fromARGB(255, 228,229,241),
          ),),
        ),
        body: PageList[myIndex],
    );
  }
}