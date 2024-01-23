 import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'cart.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, backgroundColor: Color(0xffA4A9BC),
          title: Text("MOBILES" , style: TextStyle(color: Colors.white ,fontSize: 35, fontWeight: FontWeight.w500, ),)),
      body: Container(
        padding: EdgeInsets.only(left: 15 , right: 15 ,bottom: 30 , top: 30),
        child: ListView(
          children: [
            MyCard(name: "TECNO",image: "images/img.png", onpressed: MaterialButton(  onPressed: () { Navigator.of(context).pushNamed("tecno"); },child:Icon(Icons.arrow_forward_ios , color:Color(0xffA4A9BC)) ,),),
            MyCard(name: "HONOR",image: "images/img_1.png", onpressed: MaterialButton(onPressed: () { Navigator.of(context).pushNamed("honor"); },child:Icon(Icons.arrow_forward_ios , color:Color(0xffA4A9BC)) ,),),
            MyCard(name: "SUMSONG",image: "images/img_2.png", onpressed: MaterialButton(onPressed: () { Navigator.of(context).pushNamed("sum"); },child:Icon(Icons.arrow_forward_ios , color:Color(0xffA4A9BC)) ,),),
            MyCard(name: "VIVO",image: "images/img_3.png", onpressed: MaterialButton(onPressed: () { Navigator.of(context).pushNamed("vivo"); },child:Icon(Icons.arrow_forward_ios , color:Color(0xffA4A9BC)) ,),),
            MyCard(name: "INFINIX",image: "images/img_4.png", onpressed: MaterialButton(onPressed: () { Navigator.of(context).pushNamed("in");},child:Icon(Icons.arrow_forward_ios , color:Color(0xffA4A9BC)) ,),),
            MyCard(name: "REDME",image: "images/img_5.png", onpressed: MaterialButton(onPressed: () { Navigator.of(context).pushNamed("red"); },child:Icon(Icons.arrow_forward_ios , color:Color(0xffA4A9BC)) ,),),
            MyCard(name: "VIVOT",image: "images/img_6.png", onpressed: MaterialButton(onPressed: () { Navigator.of(context).pushNamed("vivo"); },child:Icon(Icons.arrow_forward_ios , color:Color(0xffA4A9BC)) ,),),
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
     /* body: ListView(children: [
        Image.asset("images/img.png"),
        Image.asset("images/img_1.png"),
      ],)*/
    );
  }
}
 class MyCard extends StatelessWidget {
   final name;
   final image;
   final onpressed;
   const MyCard({super.key , this.name ,this.image ,  this.onpressed});

   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Card(
         child: ListTile(
             leading:Image.asset("$image") ,
             title: Text("$name" , style: TextStyle(fontWeight: FontWeight.w600),),
             trailing: onpressed // MaterialButton(onPressed: () {  },),//Icon(Icons.arrow_forward_ios , color:Color(0xffF4CAE5) ,),
         ),
       ),
     );

   }
 }

