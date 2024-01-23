


import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'cartcontroller.dart';



//import 'controller.dart';

class CartView extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  //SharedPreferences prefs =  SharedPreferences.getInstance() as SharedPreferences;
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color((0xffA4A9BC)),
        centerTitle: true,
        title: const Text(
          "YOUR CART",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        leading: MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
        ),
      ),

      body: Obx(() => Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: cartController.cartItems.isNotEmpty
                  ? cartController.cartItems
                  .map((item) => Card(
                child: ListTile(
                  title: Row(
                    children: [

                      Text(
                        item.name,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      /*const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(FontAwesomeIcons.pills, color: Color(0xff50C2BC) , ),
                      ),*/
                    ],
                  ),
                  leading:
                  Text(
                    "${item.amount}",
                    style: const TextStyle(
                        fontSize: 22, color:  Colors.black , fontWeight: FontWeight.w700),
                  ),


                  trailing:
                  Text(
                    "${item.price}",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xffA4A9BC)),
                  ),
                ),
              ))
                  .toList()
                  : [const Text('Your cart is empty')],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: Divider(color: Colors.black, thickness: 5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Total price:" , style: TextStyle(fontSize:30 , fontWeight: FontWeight.w500 , color: Colors.black ),),
                Text("${cartController.calculateTotalPrice()}" , style: const TextStyle(fontSize:30 , fontWeight: FontWeight.w500 , color:  Color((0xffA4A9BC)),),),
              ],
            ),
            MaterialButton(
              onPressed: ()  {
              },

              child: Container(
                margin: const EdgeInsets.only(top: 25, bottom: 10),
                height: 60,
                width: 180,
                decoration: const BoxDecoration(
                  color: Color((0xffA4A9BC)),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(color: Colors.grey, offset: Offset(2, 3))
                  ],
                ),
                child: const Center(
                    child: Text(
                      "BUY",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            ),

          ],
        ),
      )),
    );
  }
}
