import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class app_bar_home extends StatefulWidget {
  const app_bar_home({super.key});

  @override
  State<app_bar_home> createState() => _app_bar_homeState();
}

class _app_bar_homeState extends State<app_bar_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
//Stack(
//       clipBehavior: Clip.none,
//       children:[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("log in"),
//             IconButton(onPressed:(){
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("heelo")));
//             }, icon:Icon(Icons.drag_handle))
//           ],
//         ),
//
//         Positioned(
//           top: 50,
//           child: TextFormField(
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30)
//                 )
//             ),
//           ),
//         )
//
//       ],
//     );