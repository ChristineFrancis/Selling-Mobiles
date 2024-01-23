//import 'package:api/cart.dart';
//import 'package:api/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:untitled17/home.dart';
import 'package:untitled17/signupapi.dart';

import 'cart.dart';
import 'cartcontroller.dart';
//import 'dart:convert';
//import 'package:http/http.dart' as http;
//import 'package:http/http.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:api/signUpApi.dart';
//import 'package:get/get.dart';

//import 'CartController.dart';
class SignUp extends StatefulWidget {
  //static String? accesstoken="token";

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? fullName;
  String? phoneNumber;
  String? email;
  String? password;
  String? password1;
  String? confirmPassword;
  bool passwordVisible = false;
  bool confirmpasswordVisible = false;
  bool goHome=false;
  // static String? accessToken;

  GlobalKey<FormState> formstateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(backgroundColor: const Color((0xffA4A9BC)),
        centerTitle: true,
        title: const Text("SIGN UP", style: TextStyle(fontSize: 35,
            fontWeight: FontWeight.w500,
            color: Colors.white),),leading: MaterialButton(onPressed: (){ Navigator.of(context).pop();},
          child: const Icon(Icons.arrow_back_outlined , color:Colors.white ,),),),
      body: Container(
        height: 2000,
        width: 1000,
        padding: const EdgeInsets.only(right: 20, left: 8, bottom: 20),
        decoration: const BoxDecoration(color: Colors.white,),
        child: Form(
          key: formstateKey,
          child: ListView(
            children: [
            //  Image(image: AssetImage('image/rr.jpg'),
              //  fit: BoxFit.cover, ),
              Container(
                margin: EdgeInsets.only(top: 55 , bottom: 15),
                width: 50.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: const DecorationImage(
                    image: AssetImage('image/robot.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all( Radius.circular(200.0)),
                  border: Border.all(
                    color: Colors.white,
                    width: 4.0,
                  ),
                ),
              ),

              Column(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 0, right: 260, top: 20),
                    child: Text("Full Name:",
                      style: TextStyle(fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      onSaved: (val) {
                        fullName = val;
                      },
                      validator: (fullName) {
                        if (fullName!.isEmpty) return "can't be empty";
                        if (fullName.length < 5) {
                          return "can't be less than 4 ";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          label: const Text("full name"),
                          labelStyle: (const TextStyle(color: Color(
                              (0xffA4A9BC)))),
                          filled: true,
                          fillColor: Colors.grey[350],
                          border: InputBorder.none
                      ),
                    ),),
                  const Padding(
                    padding: EdgeInsets.only(left: 0, right: 260, top: 20),
                    child: Text("Phone Number:",
                      style: TextStyle(fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                        onSaved: (val) {
                          phoneNumber = val;
                        },
                        validator: (phoneNumber) {
                          if (phoneNumber!.isEmpty) return "can't be empty";
                          if (phoneNumber.length < 10) {
                            return "can't be less than 10 numbers";
                          }
                          if (phoneNumber[0] != "0" || phoneNumber[1] != "9") {
                            return "it's not correct";
                          }
                          return null;
                        },
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        // Only numbers can be entered

                        decoration: InputDecoration(

                          label: const Text("phone number"),
                          labelStyle: (const TextStyle(color: Color(
                              (0xffA4A9BC)))),
                          filled: true,
                          fillColor: Colors.grey[350],
                          border: InputBorder.none,
                        )
                    ),
                  ),


                  const Padding(
                    padding: EdgeInsets.only(left: 0, right: 300),
                    child: Text("Email:",
                      style: TextStyle(fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      onSaved: (val) {
                        email = val;
                      },
                      validator: (email) {
                        if (email!.isEmpty) return "can't be empty";
                        if (!email.contains("@") || !email.contains(".com")) {
                          return "it's not an email address";
                        }
                        return null;
                      },

                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        // hintText : "email",
                          label: const Text("your email adress"),
                          labelStyle: (const TextStyle(color: Color(
                              (0xffA4A9BC)))),
                          filled: true,
                          fillColor: Colors.grey[350],
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 0, right: 270, top: 15),
                    child: Text("Password:",
                      style: TextStyle(fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      onChanged: (val) {
                        setState(() {
                          password1 = val;
                        });
                      },
                      onSaved: (val) {
                        password = val;
                      },
                      validator: (password) {
                        if (password!.isEmpty) return "can't be empty";
                        if (password.length < 8) {
                          return "can't be less than 8 numbers";
                        }
                        return null;
                      },
                      obscureText: !passwordVisible,
                      maxLength: 30,
                      keyboardType: TextInputType.visiblePassword,
                      //textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        // hintText : "password",
                        label: const Text("password"),
                        labelStyle: (const TextStyle(color: Color(
                            (0xffA4A9BC)))),
                        filled: true,
                        fillColor: Colors.grey[350],
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                              color: const Color((0xffA4A9BC))),
                          onPressed: () {
                            setState(
                                  () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),

                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 0, right: 220),
                    child: Text("Confirm Password:",
                      style: TextStyle(fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      onSaved: (val) {
                        confirmPassword = val;
                      },
                      validator: (confirmPassword) {
                        if (confirmPassword!.isEmpty) return "can't be empty";
                        if (confirmPassword.length < 8) {
                          return "can't be less than 8 numbers";
                        }
                        if (confirmPassword != password1) {
                          return "it's wrong , rewrite your password";
                        }
                        return null;
                      },

                      obscureText: !confirmpasswordVisible,
                      maxLength: 30,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        //hintText : "password",
                        label: const Text("your password "),
                        labelStyle: (const TextStyle(color: Color(
                            (0xffA4A9BC)))),
                        filled: true,
                        fillColor: Colors.grey[350],
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(confirmpasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                              color: const Color((0xffA4A9BC))),
                          onPressed: () {
                            setState(
                                  () {
                                confirmpasswordVisible =
                                !confirmpasswordVisible;
                              },
                            );
                          },
                        ),

                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(onPressed: () {
                      if (formstateKey.currentState!.validate()) {
                        formstateKey.currentState!.save();
                        goHome=true;
                        print("doneeeeee");
                        print(fullName);
                        print(phoneNumber);
                        print(email);
                        print(password);
                        print(confirmPassword);
                        signUpAPI(context, fullName!, phoneNumber!, email!, password!);
                      }
                      else {
                        print("password1=$password1");
                        print("confirmPassword=$confirmPassword");
                      }
                    },
                      child: Container(margin: const EdgeInsets.only(top: 15),
                        height: 60,
                        width: 180,
                        decoration: const BoxDecoration(
                          color: Color((0xffA4A9BC)),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [BoxShadow(
                              color: Colors.grey, offset: Offset(2, 3))
                          ],),
                        child: const Center(
                            child: Text("SIGN UP", style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),)),),
                    ),
                  ),



                 /* Padding(
                    padding: EdgeInsets.only(top: 10 , bottom: 2),
                    child: Text("Are you already have an account?" , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 15),),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(onPressed: () {
                      if (goHome)
                      Get.to(Home());},
                      child: Container(margin: const EdgeInsets.only(top: 0),
                        height: 60,
                        width: 180,
                        decoration: const BoxDecoration(
                          color: Color((0xffA4A9BC)),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [BoxShadow(
                              color: Colors.grey, offset: Offset(2, 3))
                          ],),
                        child: const Center(
                            child: Text("HOME", style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),)),),
                    ),
                  ),






                ],),
            ],
          ),
        ),

      ),
    );

  }
}