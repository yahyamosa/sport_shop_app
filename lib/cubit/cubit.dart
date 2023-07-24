
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/cubit/state.dart';

import '../Screen/page_bot_nav_bar/accont.dart';
import '../Screen/page_bot_nav_bar/card.dart';
import '../Screen/page_bot_nav_bar/home.dart';
import '../Screen/page_bot_nav_bar/search.dart';
import '../model/prodect_model.dart';

class cubitui extends Cubit<state>{
  cubitui() : super(init());

  List<Widget> page =[
    home_nav(),
    search(),
    accont(),
    card()
  ];
int a = 0 ;
  void setbottomnavbar(int i ){
     a = i ;
     emit(secces());
  }

  CollectionReference getdata = FirebaseFirestore.instance.collection('prodect');
  CollectionReference live = FirebaseFirestore.instance.collection('fav');


  List<prodectModel> data = [];
  List<prodectModel> livedata = [];



  void getData(){
    getdata.orderBy("price").snapshots().listen((event) {
      data.clear();
      for(var i = 0 ; i < event.docs.length ; i++){
        data.add(prodectModel.fromjson(event.docs[i]));
        emit(seccesdata());
      }

   emit(seccesdata());
    });

  }



  void addfiv({ required String img ,required String name ,required String price ,required String dis}){
    live.add({
      "img" : img,
      "name" : name,
      "price" : price,
      "dic" : dis,
    });

    emit(secceslive());
  }



  void getfiv(){
    live.orderBy("price").snapshots().listen((event) {
      livedata.clear();
      for(var i = 0 ; i < event.docs.length ; i++){
        livedata.add(prodectModel.fromjson(event.docs[i]));
        emit(seccesdata());
      }

      emit(seccesgetlive());
    });




  }
  Future<void> deleat()async{
    var id  =  live.id;
    await live.doc(id).delete();
    emit(secssedel());
  }
}