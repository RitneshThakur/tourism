import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:pathika/controllers/sign_up_controllers.dart';

import '../commom/my_text.dart';
import '../commom/text_field.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    final SignInController signInController = Get.put(SignInController());
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/32.gif'),
            fit: BoxFit.cover,
            colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: signInController.formKey,
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  MyText(
                    "Please Enter Few Details To Get Started",
                    color: Colors.grey[100],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: CircleAvatar(/*
                      backgroundImage: AssetImage(
                        'lib/assets/images/man.gif',
                      ),
                      backgroundColor: Colors.grey,
                      radius: 50,
                      child: signInController.selectedImg == null
                          ? Image.asset(
                        'lib/assets/images/man.gif',
                        height: 300,
                      )
                          : Obx(() {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: FileImage(
                                    signInController.selectedImg.value),
                                fit: BoxFit.cover),
                          ),
                        );
                      }),
                    */),
                  ),
                  ElevatedButton(
                    onPressed: (){},/* =>
                        signInController.optionDialog(context: context),*/
                    child: Icon(Icons.camera),
                  ),
                  CustomForm(
                    text: 'Please enter your full name',
                    color: Colors.white,
                    controller: signInController.nameController,
                    icon: Icon(Bootstrap.person),
                    validator: (fullName) {
                      if (fullName == null || fullName.trim().isEmpty) {
                        return "Please Enter Your Full Name";
                      }
                    },
                  ),
                  CustomForm(
                    text: "Enter Your Address",
                    color: Colors.white,
                    controller: signInController.addressController,
                    icon: Icon(FontAwesome.location_arrow_solid),
                    validator: (address) {
                      if (address == null || address.trim().isEmpty) {
                        return "Please Enter Your Phone Number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  CustomForm(
                    validator: (phoneNumber) {
                      if (phoneNumber == null || phoneNumber.trim().isEmpty) {
                        return "Please Enter Your Phone Number";
                      } else {
                        return null;
                      }
                    },
                    icon: Icon(EvaIcons.phone),
                    text: 'Mobile Number',
                    controller: signInController.contactController,
                    color: Colors.white,
                  ),
                  CustomForm(
                    icon: Icon(FontAwesome.location_arrow_solid),
                    text: "Enter email address",
                    controller: signInController.emailController,
                    color: Colors.white,
                    validator: (email) {
                      if (email == null || email.trim().isEmpty) {
                        return "Please Enter Your Phone Number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  CustomForm(
                    icon: Icon(Icons.password_sharp),
                    text: "Enter your password",
                    txt: true,
                    controller: signInController.pwController,
                    color: Colors.white,
                    validator: (password) {
                      if (password == null || password.trim().isEmpty) {
                        return "Please Enter Your Phone Number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: TextFormField(
                        validator: (date) {
                          if (date == null || date.trim().isEmpty) {
                            return "Please Enter Your Phone Number";
                          } else {
                            return null;
                          }
                        },
                        controller: signInController.dateController,
                        decoration: InputDecoration(
                          hintText: "Enter Your Birthday",
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.calendar_today),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2030),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              signInController.dateController.text =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      ElevatedButton(
                          onPressed: () =>
                              signInController.handleSignIn(context),
                          child: Text("Sign In")),
                      SizedBox(
                        width: 20,
                      ),
                      MyText(
                        "Already a member?",
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                            borderRadius: BorderRadius.circular(1),
                            child: Container(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.grey[200],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              ),
                            ),
                          )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
