import 'package:flutter/material.dart';

class card extends StatefulWidget {
  const card({super.key});

  @override
  State<card> createState() => _cardState();
}
List<String> myaccont = [
  "My Acoont" ,
  "Notfication",
  "Setting",
  "Help Center" ,
  "Log out"
];
List<Widget> myicon = [
  Icon(Icons.person ,),
  Icon(Icons.add_alert_outlined),
  Icon(Icons.settings),
  Icon(Icons.help),
  Icon(Icons.logout),
];
class _cardState extends State<card> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 50),
            width: MediaQuery.of(context).size.width,
              child: Text('Profile' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),)),
          SizedBox(height: 30,),
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('img/user.jpeg')
              )
            ),
          ),
         Expanded(
           child: ListView.builder(
             itemCount: myaccont.length,
               itemBuilder:(context , index){
             return  Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
               child: Container(
                 padding: EdgeInsets.all(8),
                 width: MediaQuery.of(context).size.width * .9,
                 height: 60,
                 decoration: BoxDecoration(
                     color: Colors.grey[300],
                     borderRadius: BorderRadius.circular(10)
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Row(
                       children: [
                         Container(
                           child: myicon[index],
                         ),
                         SizedBox(width: 10,),
                         Text("${myaccont[index]}" , style: TextStyle(fontSize: 14 , color: Colors.grey ),) ,
                       ],
                     ),
                     Icon(Icons.arrow_forward_ios , color: Colors.grey , size: 16,),
                   ],
                 ),
               ),
             ) ;
           }),
         )
        ],
      ),
    );
  }
}
