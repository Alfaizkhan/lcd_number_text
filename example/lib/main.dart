import 'package:flutter/material.dart';
import 'package:lcd_number_text/lcd_number_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LCDNumberTextExample(),
    );
  }
}

class LCDNumberTextExample extends StatelessWidget {
  const LCDNumberTextExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LCD Numbers'),
      ),
      body: const SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 112,
                  child: LCDNumberText(
                    number: 1,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 112,
                  child: LCDNumberText(
                    number: 2,
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 112,
                  child: LCDNumberText(
                    number: 3,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(
                  height: 112,
                  child: LCDNumberText(
                    number: 4,
                    color: Colors.cyan,
                  ),
                ),
                SizedBox(
                  height: 112,
                  child: LCDNumberText(
                    number: 5,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 112,
                  child: LCDNumberText(
                    number: 6,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(
                  height: 112,
                  child: LCDNumberText(
                    number: 7,
                    color: Colors.pink,
                  ),
                ),
                SizedBox(
                  height: 112,
                  child: LCDNumberText(
                    number: 8,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(
                  height: 112,
                  child: LCDNumberText(
                    number: 9,
                    color: Colors.brown,
                  ),
                ),
                SizedBox(
                  height: 112,
                  child: LCDNumberText(
                    number: 0,
                    color: Colors.lightGreen,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
