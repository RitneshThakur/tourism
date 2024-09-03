import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pathika/commom/my_text.dart';
import 'package:pathika/firebase/firebase_auth.dart';

import '../commom/text_field.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});
   final emailControllers=TextEditingController();
   final passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/bg.jpg",
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop)),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    "Welcome Back",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                  CustomForm(
                    text: "Email",
                    color: Colors.grey,
                      controller: emailControllers,
                    icon: Icon(Icons.email),
                  ),
                  CustomForm(
                    text: "Password",
                    color: Colors.grey,
                    controller: passwordController,
                    icon: Icon(Icons.password),
                    txt: true,

                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /* SizedBox(
                                width: 50,
                              ),*/
                            ElevatedButton(
                                onPressed: () async{
                                  Navigator.pushReplacementNamed(context, '/nav');
                                  final userName=emailControllers.text;
                                  final password=passwordController.text;
                                  final firebaseAuthService =FirebaseAuthServices();
                                  try {
                                    final User? user = await firebaseAuthService.loginUserWithEmailAndPassword(userName, password);
                                    if (user != null) {

                                      print("Success");
                                    } else {
                                      print("Login failed");
                                    }
                                  } catch (e) {
                                    print("An error occurred: $e");
                                    // You could also show a dialog or a Snackbar to the user
                                  }
                                }, child: Text("Log In"))


                                /*onPressed: () =>
                                 // loginController.handleLogin(context),*/
                                ,
                            SizedBox(
                              width: 25,
                            ),
                            MyText("Not a member?",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.blue),
                            TextButton(onPressed: (){
                              Navigator.pushNamed(context, '/sign');
                            }, child: MyText("Sign Up"))
                          ],
                        ),
                        SizedBox(height: 50,),
                        MyText(
                          "OR",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        SizedBox(height: 10,),
                        MyText(
                          "Login with",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IonIcons.logo_facebook,
                                  color: Colors.blue,
                                  size: 50,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  EvaIcons.google,
                                  color: Colors.yellow[100],
                                  size: 50,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
