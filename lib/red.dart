import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'cart.dart';
import 'cartcontroller.dart';
class Red extends StatefulWidget {
   Red({super.key});

  @override
  State<Red> createState() => _RedState();
}

class _RedState extends State<Red> {
  int rednum=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: MaterialButton(onPressed: (){ Navigator.of(context).pop();},
        child: const Icon(Icons.arrow_back_outlined , color:Colors.white ,),),centerTitle: true, backgroundColor: Color(0xffA4A9BC),
          title: Text("REDME" , style: TextStyle(color: Colors.white ,fontSize: 35, fontWeight: FontWeight.w500, ),)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          Row(children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Price:" , style:TextStyle(color:Color(0xffA4A9BC),fontSize: 35, ) ),
          ) ,
            Text("250" ,style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 35) )
          ],),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Product Name:" , style:TextStyle(color:Color(0xffA4A9BC),fontSize: 35, ) ),
          ) ,
          Text("redme" ,style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 30) ),

          Image.asset("images/img_5.png") ,
          Text("Descreption:" , style:TextStyle(color:Color(0xffA4A9BC),fontSize: 35, ) ) ,
          Text(" Ram:8" ,style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 30) ),
          Text(" Camera:108" ,style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 30) ),
          Text(" Pattery:5020" ,style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 30) ),
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
                    rednum++;
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
                "$rednum",
                style: TextStyle(fontSize: 45),
              ),
              Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      rednum--;
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

            if(rednum!=0)
              Get.put(CartController()).addToCart("Redme", rednum, 250.0);
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






        ],),
      ),
    );
  }
}
