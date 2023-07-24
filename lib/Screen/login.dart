import 'package:flutter/material.dart';
import 'package:shopapp/Screen/home.dart';
import 'package:shopapp/Screen/signup.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 230 , left: 20 , right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Nado" , style: TextStyle(fontSize: 28 , fontWeight: FontWeight.bold),),
                    Text(" Express" , style: TextStyle(color: Colors.red , fontSize: 17 , fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration:InputDecoration(
                    label: Text("password"),
                    prefixIcon: Icon(Icons.lock_open),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration:InputDecoration(
                    label: Text("email"),
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  child: MaterialButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>home()));
                  } ,
                    color: Colors.red,
                    child:Text("LOGIN") ,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>signup()));
                    }, child:Text("regester?")),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
