import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../firebase/firebase_auth.dart';
import '../../model/user_model.dart';
import '../firebase/firebase_database.dart';

class SignInController extends GetxController {
  String? imgURL;
  String role = "user";
  var selectedImg = File("").obs;
  final formKey = GlobalKey<FormState>(); //underscore : private
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  handleSignIn(BuildContext context) async {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {

        final email = emailController.text;
        final password = pwController.text;
       // final DOB = dateController.text;
        final firebaseAuthService = FirebaseAuthServices();
        final User? user = await firebaseAuthService
            .createUserWithEmailAndPassword(email, password);
        if (user != null) {
          final userModel = UserModel(
              id: user.uid,
              fullName: nameController.text,
             // birthDate: DOB,
              phoneNumber: int.parse(contactController.text),
              address: addressController.text,
             /* imageURL: imgURL,
              role: role*/
          );
          print("up:$imgURL");
          final firebaseDatabase = FirebaseDatabaseService();
          firebaseDatabase.createUser(userModel: userModel);
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('uId', user.uid);
          Navigator.pushReplacementNamed(context, '/home');
        }
      }
    }
  }


}
