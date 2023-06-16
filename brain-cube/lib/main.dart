import 'package:flutter/material.dart';

extension XList<T> on List<T> {
  void ai(T t, bool c) {
    if (c) {
      add(t);
    }
  }
}

extension XString on String {
  String ca(int i) => characters.characterAt(i).string;
  bool cax(int i) => ca(i) == "x";
}

class Algorithm {
  String algorithm;
  Algorithm(this.algorithm);
}

class OLLA extends Algorithm {
  final List<CA> pattern;
  OLLA(String algorithm, this.pattern) : super(algorithm);
  Widget render(BuildContext context) => Text("Render...");
  static OLLA encode(String pattern, String algorithm) => OLLA(
      algorithm,
      <CA>[]
        ..ai(CA(1, 0), pattern.cax(0))
        ..ai(CA(2, 0), pattern.cax(1))
        ..ai(CA(3, 0), pattern.cax(2))
        ..ai(CA(0, 1), pattern.cax(3))
        ..ai(CA(1, 1), pattern.cax(4))
        ..ai(CA(2, 1), pattern.cax(5))
        ..ai(CA(3, 1), pattern.cax(6))
        ..ai(CA(4, 1), pattern.cax(7))
        ..ai(CA(0, 2), pattern.cax(8))
        ..ai(CA(1, 2), pattern.cax(9))
        ..ai(CA(2, 2), pattern.cax(10))
        ..ai(CA(3, 2), pattern.cax(11))
        ..ai(CA(4, 2), pattern.cax(12))
        ..ai(CA(0, 3), pattern.cax(13))
        ..ai(CA(1, 3), pattern.cax(14))
        ..ai(CA(2, 3), pattern.cax(15))
        ..ai(CA(3, 3), pattern.cax(16))
        ..ai(CA(4, 3), pattern.cax(17))
        ..ai(CA(1, 4), pattern.cax(18))
        ..ai(CA(2, 4), pattern.cax(19))
        ..ai(CA(3, 4), pattern.cax(20)));
}

class PLLA extends Algorithm {
  final Map<CA, CA> pattern;
  PLLA(String algorithm, this.pattern) : super(algorithm);
}

List<OLLA> ollAlgorithms = <OLLA>[
  OLLA.encode("x;;;;xx;;xx;x;;;x;xx;", "R U R' U' R U' R' F' U' F R U R'"),
  OLLA.encode(";;;x;x;x;xx;x;x;x;;x;", "F R' F R2 U' R' U' R U R' F2"),
];
List<PLLA> pllAlgorithms = <PLLA>[];

class CA {
  final int x;
  final int y;

  CA(this.x, this.y);
}

void main() {
  runApp(const BrainCube());
}

class BrainCube extends StatelessWidget {
  const BrainCube({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Brain Cube",
        home: HomeScreen(),
      );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          children: [
            ListTile(
              title: Text("OLL Algorithms"),
            ),
            GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: ollAlgorithms.length,
              itemBuilder: (context, pos) => ollAlgorithms[pos].render(context),
            ),
            ListTile(
              title: Text("PLL Algorithms"),
            )
          ],
        ),
      );
}
