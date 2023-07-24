import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Screen/page_bot_nav_bar/search.dart';
import 'package:shopapp/cubit/cubit.dart';
import 'package:shopapp/cubit/state.dart';
import 'package:shopapp/model/prodect_model.dart';


import '../../show_details.dart';

class home_nav extends StatefulWidget {
  const home_nav({super.key});

  @override
  State<home_nav> createState() => _home_navState();
}

class _home_navState extends State<home_nav> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var mydata = BlocProvider.of<cubitui>(context).getData();
  }
  Widget build(BuildContext context) {
    return BlocConsumer<cubitui , state>(
        builder:(context , state){
          List<prodectModel> data = BlocProvider.of<cubitui>(context).data;
      return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20 , right: 20 , top: 13),
              width: MediaQuery.of(context).size.width,
              height: 80,
              //  color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("DRIP" , style: TextStyle(fontWeight:FontWeight.bold ,fontSize: 20),),
                  GestureDetector(
                      onTap:(){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>search()));
                      },
                      child: Icon(Icons.search))
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              // color: Colors.blue,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context , indext){
                    return Padding(
                      padding: const EdgeInsets.only(left: 20 , top: 10  , right: 5),
                      child: Text("snakers" , style: TextStyle(fontWeight: FontWeight.bold),),
                    );
                  }),
            ) ,
            Container(
              width: MediaQuery.of(context).size.width *.95,
              height: 210,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit:BoxFit.cover,
                      image: AssetImage("img/imagsh.jpg")
                  ),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20)
              ),
            ) ,
            SizedBox(height: 20,),
            Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder:(context ,indext){
                    return GestureDetector(
                      onTap:(){
                        prodectModel c = prodectModel(img:data[indext].img, name: data[indext].name, price: data[indext].price, dic: data[indext].dic);
                        Navigator.push(context,MaterialPageRoute(builder:(context)=>prodect(model: c,)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10 , right: 10 , bottom: 12 ),
                        child: Container(
                          width: 160,
                          height: 190,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 160,
                                height: 85,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage('${data[indext].img}'),
                                    )
                                ),

                              ),
                             const SizedBox(height: 8,),
                              Padding(
                                padding:const  EdgeInsets.only(left: 8 , top: 8),
                                child: Text("${data[indext].name}" , style:const TextStyle(fontWeight: FontWeight.bold),),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text("${data[indext].price}" ,style:const TextStyle(fontSize: 12 , fontWeight: FontWeight.bold , color: Colors.grey),),
                                  ),
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.star , color: Colors.amber,))
                                ],
                              )
                            ],
                          ),

                        ),
                      ),
                    ) ;
                  }),
            )

          ],
        ),
      );
    }, listener:(context , state){});



  }
}
