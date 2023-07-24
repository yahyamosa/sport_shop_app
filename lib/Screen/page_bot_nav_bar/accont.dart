import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/cubit/cubit.dart';
import 'package:shopapp/cubit/state.dart';
import 'package:shopapp/model/prodect_model.dart';

class accont extends StatefulWidget {
   accont({super.key});

  @override
  State<accont> createState() => _accontState();
}

class _accontState extends State<accont> {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<cubitui , state>(
        builder:(context , state){
          List<prodectModel> mylist = BlocProvider.of<cubitui>(context).livedata;
      return Scaffold(
          body:Column(
            children: [
              Container(
                  padding:const EdgeInsets.only(top: 60),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child:const Text("Cart" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),)),
              Expanded(
                child: ListView.builder(
                    itemCount:mylist.length,
                    itemBuilder:(context , indext){
                      return Dismissible(
                        key:const Key("1"),
                        behavior: HitTestBehavior.deferToChild,
                        background: Container(
                          padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          color: Colors.red,
                          child: Icon(Icons.delete),
                        ),
                        onDismissed:(d){

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20 , bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage('${mylist[indext].img}')
                                    )
                                ),
                                width: 70,
                                height: 70,

                              ) ,
                             const SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${mylist[indext].name}" , style:const TextStyle(fontWeight: FontWeight.bold , fontSize: 22),),
                                const  SizedBox(height: 5,),
                                  Text("${mylist[indext].price} " , style:const TextStyle(fontWeight: FontWeight.bold , fontSize: 14 , color: Colors.grey),)
                                ],
                              )
                            ],
                          ),
                        ),
                      ) ;
                    }),
              ) ,
              SizedBox(height: 10,),
              Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: MaterialButton(onPressed: (){} , child:const Text("Buy Now" , style: TextStyle(color: Colors.white),),)) ,
             const SizedBox(height: 5,)
            ],
          )
      );
    }, listener:(context , state){});
  }
}
