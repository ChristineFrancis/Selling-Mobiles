

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> signUpAPI(BuildContext context, String fullName, String phoneNumber, String email, String password) async {
  final url = Uri.parse("http://10.0.2.2:8000/api/regester");

  try {
    final response = await http.post( url,
      body: {
        'name': fullName,
        'number': phoneNumber,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      print("successssssssss");
      final jsonResponse = json.decode(response.body);
      bool success = jsonResponse['success'];

      if (success) {
        String? tokensignup = jsonResponse['data']['token'].toString();
        print("Token:  $tokensignup");
        print(jsonResponse);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('TOKEN',tokensignup!);
        print("toooooken");
        //await prefs.getString(SignUp.accesstoken!);

        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(

              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              title: const Text("Success"),
              content: Text(jsonResponse['message']),
              actions: <Widget>[
               /* TextButton(
                  onPressed: (){Navigator.of(context).pop();
                  {/*Get.to(MyApplication());*/}
                  },
                  child: const Text("Next" , style: TextStyle(color:Color((0xff50C2BC))),),
                ),*/
              ],
            );
          },
        );
      } else {
        List<String> errorMessages = [];
        Map<String, dynamic> data = jsonResponse['data'];
        data.forEach((key, value) {
          errorMessages.addAll(value.map<String>((dynamic item) => item.toString()));
        });

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              title: const Text("Error"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: errorMessages.map((message) => Text(message)).toList(),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Try again"  , style: TextStyle(color:Color((0xffA4A9BC)))),
                ),
              ],
            );
          },
        );
      }
    } else {
      final jsonResponse = json.decode(response.body);
      List<String> errorMessages = [];
      Map<String, dynamic> data = jsonResponse['data'];
      data.forEach((key, value) {
        errorMessages.addAll(value.map<String>((dynamic item) => item.toString()));
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text("Error"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: errorMessages.map((message) => Text(message)).toList(),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Try again"  , style: TextStyle(color:Color((0xffA4A9BC)))),
              ),
            ],
          );
        },
      );

      throw Exception('Failed to load data' );


    }
  } catch (e) {
    print(e.toString());}
}