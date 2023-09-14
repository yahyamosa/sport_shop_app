import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/cubit/cubit.dart';
import 'package:shopapp/cubit/state.dart';
import 'package:shopapp/model/prodect_model.dart';

// search page
class search extends StatefulWidget {
   search({super.key});

  @override
  State<search> createState() => _searchState();
}
int i = 0 ;
TextEditingController cont = TextEditingController();
class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cubitui , state>(
        builder:(context , state){

          List<prodectModel> mylist = BlocProvider.of<cubitui>(context).mysearche;

      return Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50 , left: 20 , right: 20),
                child: TextFormField(
                  onChanged:(val){
                    mylist.clear();
                    BlocProvider.of<cubitui>(context).searchitem(val);
                  },
                  controller:cont ,
                  decoration: InputDecoration(
                      label: Text('search'),
                      suffixIcon: IconButton(onPressed: (){
                        
                      
                      },icon: Icon(Icons.search),),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                      )
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: mylist.length,
                    itemBuilder:(context , indext){
                      return mylist.length == 0 ? Center(child: Text("not found")):  Padding(
                        padding: const EdgeInsets.only(left: 20 , bottom: 10),
                        child: Row(

                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('${mylist[indext].img}')
                                  )
                              ),
                              width: 70,
                              height: 70,

                            ) ,
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${mylist[indext].name}" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 22),),
                                SizedBox(height: 5,),
                                Text("${mylist[indext].price}" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 12 , color: Colors.grey),)
                              ],
                            ) ,
                            SizedBox(width: MediaQuery.of(context).size.width * .3,),
                            Icon(Icons.delete , color: Colors.grey,)
                          ],
                        ),
                      ) ;
                    }),
              ) ,
            ],
          )

      );
    }, listener: (context , state){
    });
  }
}
