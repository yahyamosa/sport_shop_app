import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Screen/page_bot_nav_bar/accont.dart';
import 'package:shopapp/Screen/page_bot_nav_bar/card.dart';
import 'package:shopapp/Screen/page_bot_nav_bar/home.dart';
import 'package:shopapp/Screen/page_bot_nav_bar/search.dart';
import 'package:shopapp/cubit/cubit.dart';
import 'package:shopapp/cubit/state.dart';

class home extends StatelessWidget {
   home({super.key});

  int i = 0 ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cubitui , state>(builder:(context , state){
      return  Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          type:BottomNavigationBarType.fixed,
          elevation: 0,
          items: [
            BottomNavigationBarItem( icon:Icon(Icons.home) , label:"home"),
            BottomNavigationBarItem( icon:Icon(Icons.search) , label:"shopp"),
            BottomNavigationBarItem( icon:Icon(Icons.shopping_cart) , label:"account"),
            BottomNavigationBarItem( icon:Icon(Icons.person) , label:"account"),

          ],
          onTap:(value){
            BlocProvider.of<cubitui>(context).setbottomnavbar(value);
          },
          currentIndex: BlocProvider.of<cubitui>(context).a,
        ),
        body:BlocProvider.of<cubitui>(context).page[BlocProvider.of<cubitui>(context).a],
      );
    }, listener: (context , state){});
  }
}

