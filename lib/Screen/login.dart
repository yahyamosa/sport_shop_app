import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Screen/home.dart';
import 'package:shopapp/Screen/signup.dart';
import 'package:shopapp/cubit/cubit.dart';
import 'package:shopapp/cubit/state.dart';

class login extends StatelessWidget {
   login({super.key});
TextEditingController cont1 = TextEditingController();
TextEditingController cont2 = TextEditingController();
  @override

  Widget build(BuildContext context) {
    return BlocConsumer<cubitui , state>(
        builder:(context , state){
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
                      controller: cont1,
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
                      controller: cont2,
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
                        BlocProvider.of<cubitui>(context).login(email:cont2.text.toString(), passworld: cont1.text.toString());
                      } ,
                        color: Colors.red,
                        child:state is lodlogin ? Container(
                          width: 20,
                            height: 20,
                            child: CircularProgressIndicator()) : Text("LOGIN") ,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>signup()));
                        }, child:Text("regester?")),
                      ],
                    ) , 
                    IconButton(onPressed:()async{
                     await BlocProvider.of<cubitui>(context).sigin();
                    }, icon:Icon(Icons.supervised_user_circle))
                  ],
                ),
              ),
            ),
          )
      );
    }, listener: (context , state){
      state is secsselogin ? Navigator.push(context,MaterialPageRoute(builder: (context)=>home())):Text('') ;
    });
  }
}
