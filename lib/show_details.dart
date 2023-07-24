import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/cubit/cubit.dart';
import 'package:shopapp/cubit/state.dart';
import 'package:shopapp/model/prodect_model.dart';

class prodect extends StatefulWidget {
   prodect({required this.model , super.key});
prodectModel model;
  @override
  State<prodect> createState() => _prodectState();
}

class _prodectState extends State<prodect> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<cubitui>(context).getfiv();
  }
  Widget build(BuildContext context) {
    return BlocConsumer<cubitui , state>(
        builder:(context , index){
          List<prodectModel> fiv = BlocProvider.of<cubitui>(context).livedata;
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon:const Icon(Icons.arrow_back_ios_new)),
                  Text("${widget.model.name}" , style:const TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                 Stack(
                   children: [
                     IconButton(onPressed:(){}, icon: const Icon(Icons.shopping_cart)) ,
                     Positioned(
                          left: 23,
                         top: 4,
                         child: Container(
                           alignment: Alignment.center,
                           width: 16,
                           height: 16,
                           decoration: BoxDecoration(
                             color: Colors.red,
                             borderRadius: BorderRadius.circular(20)
                           ),
                             child: Text("${fiv.length}" , style: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold),)))
                   ],
                 )
                ],
              ),
            ),
           const SizedBox(height: 25,),
            Container(
              margin:const EdgeInsets.only(left: 10 , right: 10),
              width: MediaQuery.of(context).size.width ,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("${widget.model.img}")
                  )
              ),
            ) ,
            Container(
              padding:const EdgeInsets.symmetric(horizontal: 20 , vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${widget.model.name}" , style:const TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
                  Text("${widget.model.price}" , style:const TextStyle(color: Colors.grey , fontWeight: FontWeight.bold),)
                ],
              ),
            ) ,
            Container(
                padding:const EdgeInsets.all(20),
                width: 300,
                child: Text('I-fal is a rapidly expanding online English platform with interactive video lessons. for students of all levels. Make a reservation now! Your first lesson is Free on us' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.grey[600]),)) ,
            const SizedBox(height: 130,),
            Container(
                decoration:BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)
                ),
                margin:const EdgeInsets.only(left: 20 , right: 20),
                width: MediaQuery.of(context).size.width,
                child: MaterialButton(onPressed:(){
               BlocProvider.of<cubitui>(context).addfiv(img:widget.model.img, name: widget.model.name, price: widget.model.price, dis: widget.model.dic);
                  print(fiv.length);
                } , child:const Text("Add to Cart" , style: TextStyle(color: Colors.white),),))
          ],
        ),
      );
    }, listener: (context , indext){});
  }
}
