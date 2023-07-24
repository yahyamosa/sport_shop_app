import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
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
                    child: MaterialButton(onPressed: (){} ,
                      color: Colors.red,
                      child:Text("LOGIN") ,
                    ),
                  ),

                ],
              ),
            )
        ),
      ),
    );
  }
}
