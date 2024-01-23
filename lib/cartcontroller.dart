import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
//import 'package:http/http.dart' as http;
class CartItem {
  final String name;
  final int amount;
  final double price;


  CartItem({
    required this.name,
    required this.amount,
    required this.price,


  });
}

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  void addToCart(String name, int amount, double price) {
    cartItems.add(CartItem(name: name,
        amount: amount,
        price: price,
        ));
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var item in cartItems) {
      totalPrice += item.amount * item.price;
    }
    return totalPrice;
  }


  Future<void> sendCartItemsToServer(String token) async {
    List<Map<String, dynamic>> itemsToSend = [];

    for (var item in cartItems) {
      itemsToSend.add({
        'quantity': item.amount,
      });
    }


    final Map<String, dynamic> requestBody = {
      'items': itemsToSend,
    };


    try {
      final Uri uri = Uri.parse('http://10.0.2.2:8000/api/order');
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      print(token);

      final response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(requestBody),
      );


      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Items added successfully',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          icon: const Icon(Icons.check ,color: Colors.white,size: 40),
          duration: const Duration(seconds: 3),
          backgroundColor: const Color((0xffA4A9BC)),
        );
      } else {
        print('Request failed with status: ${response.statusCode}');
        print(requestBody);
        print(response.body.toString());
      }
    } catch (e) {
      print('Error sending cart items: $e');
    }
  }
}