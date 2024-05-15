
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatrixMultiplyScreen extends StatefulWidget {
  @override
  _MatrixMultiplyScreenState createState() => _MatrixMultiplyScreenState();
}

class _MatrixMultiplyScreenState extends State<MatrixMultiplyScreen> {

  int myIndex = 0;

  int s11 = 0;
  int s12 = 0;
  int s21 = 0;
  int s22 = 0;
  int t11 = 0;
  int t12 = 0;
  int t21 = 0;
  int t22 = 0;
  int p11 = 0;
  int p12 = 0;
  int p21 = 0;
  int p22 = 0;

  void updateS(int row, int col) {
    setState(() {
      if (row == 0 && col == 0) {
        s11 = (s11 + 1) % 10;
      } else if (row == 0 && col == 1) {
        s12 = (s12 + 1) % 10;
      } else if (row == 1 && col == 0) {
        s21 = (s21 + 1) % 10;
      } else if (row == 1 && col == 1) {
        s22 = (s22 + 1) % 10;
      }
    });
  }

  void updateT(int row, int col) {
    setState(() {
      if (row == 0 && col == 0) {
        t11 = (t11 + 1) % 10;
      } else if (row == 0 && col == 1) {
        t12 = (t12 + 1) % 10;
      } else if (row == 1 && col == 0) {
        t21 = (t21 + 1) % 10;
      } else if (row == 1 && col == 1) {
        t22 = (t22 + 1) % 10;
      }
    });
  }

  void updateP()
  {
    setState(() {
      p11 = s11*s21 + t11*s22;
      p12 = s11*t21 + t11*t22;
      p21 = s12*s21 + s22*t12;
      p22 = s12*t21 + t12*t22;

      p11 %= 10;
      p12 %= 10;
      p21 %= 10;
      p22 %= 10;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 228,229,241),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Text(
              //   "Matrix Multiplier",
              //   style: TextStyle(fontSize: 20),
              // ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      _buildMatrixCell(s11, 0, 0, updateS),
                      _buildMatrixCell(s12, 0, 1, updateS),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      _buildMatrixCell(t11, 0, 0, updateT),
                      _buildMatrixCell(t12, 0, 1, updateT),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text("x", style: TextStyle(fontSize: 30)),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      _buildMatrixCell(s21, 1, 0, updateS),
                      _buildMatrixCell(s22, 1, 1, updateS),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      _buildMatrixCell(t21, 1, 0, updateT),
                      _buildMatrixCell(t22, 1, 1, updateT),
                    ],
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("$p11",style: TextStyle(fontSize: 40,),),
                      Text("$p21",style: TextStyle(fontSize: 40),),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text("$p12",style: TextStyle(fontSize: 40),),
                      Text("$p22",style: TextStyle(fontSize: 40),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Ink(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromARGB(255, 147, 148, 165),
                ),
                child: InkWell(
                  onTap: () {
                    updateP();
                  },
                  child: Text(
                    "MULTIPLY!",
                    style: GoogleFonts.dmSans(
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
      
              SizedBox(height: 40,),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMatrixCell(int value, int row, int col, Function(int, int) onPressed) {
    return GestureDetector(
      onTap: () => onPressed(row, col),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Center(
          child: Text(
            value.toString(),
            style: TextStyle(fontSize: 30,),
          ),
        ),
      ),
    );
  }
}
