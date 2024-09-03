import 'package:flutter/material.dart';

import '../commom/my_text.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              "Welcome To Yatra",
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            MyText("YATRA SAFAL RAHOS", color: Colors.black),
            SizedBox(height: 30,),
            Image.asset('assets/lg.jpg',height: 400,),
            SizedBox(
              height: 30,
            ),
            MyText(
              "The app for creating moments",
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.grey)),
                    child: MyText("Get Started", color: Colors.black)))
          ],
        ),
      ),
    );
  }
}
