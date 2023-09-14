import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Screen/home.dart';
import 'package:shopapp/Screen/page_bot_nav_bar/accont.dart';
import 'package:shopapp/cubit/cubit.dart';
import 'package:shopapp/cubit/state.dart';

class signup extends StatelessWidget {
   signup({super.key});
TextEditingController cont1 = TextEditingController();
TextEditingController cont2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cubitui , state>(
        builder:(context , state){
      return Scaffold(
        body: SingleChildScrollView(
          child: Center(
              child:Padding(
                padding: const EdgeInsets.only(top: 150 , left: 20 , right:  20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Nado" , style: TextStyle(fontSize: 28 , fontWeight: FontWeight.bold),),
                        Text(" Express" , style: TextStyle(color: Colors.red , fontSize: 17 , fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child:TextFormField(
                                decoration: InputDecoration(
                                    label: Text("firstName"),
                                    prefixIcon: Icon(Icons.person),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)
                                    )
                                ),
                              ),
                              width: 200,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),

                              ),
                            ),
                          ),
                          SizedBox(width: 6,),
                          Expanded(
                            child: Container(
                              child:TextFormField(
                                decoration: InputDecoration(
                                    label: Text("lastName"),
                                    prefixIcon: Icon(Icons.person),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)
                                    )
                                ),
                              ),
                              width: 200,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: cont2,
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
                      controller: cont1,
                      decoration:InputDecoration(
                          label: Text("email"),
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration:InputDecoration(
                          label: Text("city"),
                          prefixIcon: Icon(Icons.location_city),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)
                          )
                      ),
                    ),
                    SizedBox(height: 18,),
                    Container(
                      width: double.infinity,
                      child: MaterialButton(onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder:(context)=>accont()) );
                        // BlocProvider.of<cubitui>(context).suingup(email:cont1.text.toString(), passworld:cont2.text.toString());
                      } ,
                        color: Colors.red,
                        child:state is lodlsungin ?Container(
                          width: 20,
                            height: 20,
                            child: CircularProgressIndicator()) :Text("suingup") ,
                      ),
                    ),

                  ],
                ),
              )
          ),
        ),
      );
    }, listener: (context , state){
          state is secssesingup ? Navigator.push(context,MaterialPageRoute(builder: (context)=>home())):Text('') ;
    });
  }
}
