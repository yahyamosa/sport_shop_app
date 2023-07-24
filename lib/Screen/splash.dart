import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopapp/Screen/login.dart';

class splash extends StatefulWidget {
   splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Timer(Duration(seconds:4) ,()=> Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>login())));
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width:215,
              height:221,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('img/img.png')
                  )
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Nado" , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),),
                SizedBox(width: 5,),
                Text("Express" , style: TextStyle(fontSize: 14 , color: Colors.red),),
              ],
            )

          ],
        ),
      )
    );
  }
}
