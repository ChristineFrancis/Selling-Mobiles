import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart.dart';
import 'cartcontroller.dart';

class Tec extends StatefulWidget {
  Tec({Key? key}) : super(key: key);

  @override
  State<Tec> createState() => _TecState();
}

class _TecState extends State<Tec> {
  int tecnonum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffA4A9BC),
        title: Text(
          "TECNO",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Price :",
                    style: TextStyle(color: Color(0xffA4A9BC), fontSize: 35),
                  ),
                ),
                Text(
                  "150",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                " Name:",
                style: TextStyle(color: Color(0xffA4A9BC), fontSize: 35),
              ),
            ),
            Text(
              "Tecno",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
            ),
            Image.asset("images/img.png"),
            Text(
              "Description:",
              style: TextStyle(color: Color(0xffA4A9BC), fontSize: 35),
            ),
            Text(" Ram:8", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30)),
            Text(" Camera:50", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30)),
            Text(" Battery:5020", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30)),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Select the quantity you want:",
                style: TextStyle(color: Color(0xffA4A9BC), fontSize: 35),
              ),
            ),
            Row(
              children: [
                Spacer(flex: 2),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      tecnonum++;
                    });
                  },
                  child: Icon(
                    Icons.add,
                    color: Color(0xffA4A9BC),
                    size: 50,
                  ),
                ),
                Spacer(flex: 1),
                Text(
                  "$tecnonum",
                  style: TextStyle(fontSize: 45),
                ),
                Spacer(flex: 2),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        tecnonum--;
                      });
                    },
                    child: Icon(
                      Icons.minimize_rounded,
                      color: Color(0xffA4A9BC),
                      size: 50,
                    ),
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
            IconButton(iconSize: 80 , onPressed:(){

              if(tecnonum!=0)
                Get.put(CartController()).addToCart("Tecno", tecnonum, 150.0);
            }, icon:Icon( Icons.shopping_cart) ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  Get.to(CartView());
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 0),
                  height: 60,
                  width: 180,
                  decoration: const BoxDecoration(
                    color: Color((0xffA4A9BC)),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(2, 3)),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "YOUR CART",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
