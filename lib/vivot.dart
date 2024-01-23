 import 'package:flutter/material.dart';

class Vivot extends StatelessWidget {
  const Vivot({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(leading: MaterialButton(onPressed: (){ Navigator.of(context).pop();},
        child: const Icon(Icons.arrow_back_outlined , color:Colors.white ,),),centerTitle: true, backgroundColor: Color(0xffA4A9BC),
          title: Text("VIVOT" , style: TextStyle(color: Colors.white ,fontSize: 35, fontWeight: FontWeight.w500, ),)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          Row(children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Product Number:" , style:TextStyle(color:Color(0xffA4A9BC),fontSize: 35, ) ),
          ) ,
            Text(" 1" ,style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 35) )
          ],),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Product Name:" , style:TextStyle(color:Color(0xffA4A9BC),fontSize: 35, ) ),
          ) ,
          Text("vivot" ,style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 30) ),

          Image.asset("images/img_3.png") ,
          Text("Descreption:" , style:TextStyle(color:Color(0xffA4A9BC),fontSize: 35, ) ) ,
          Text(" Ram:8" ,style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 30) ),
          Text(" Camera:50" ,style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 30) ),
          Text(" Pattery:5020" ,style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 30) )



        ],),
      ),
    );
  }
}
