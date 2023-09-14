
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  void setbottomnavbar(int i){
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



   Future<void> deleat() async{
     String uid = FirebaseFirestore.instance.collection('fav').doc().id;
  var a  = await  FirebaseFirestore.instance.collection('fav').doc(uid).delete();
     print(uid);
    emit(secssedel());
  }

  Future<void> login({required String email ,required String passworld})async{
    emit(lodlogin());
    var auth = FirebaseAuth.instance;
   await auth.signInWithEmailAndPassword(email: email, password: passworld);
   emit(secsselogin());
  }

  Future<void> suingup({required String email ,required String passworld})async{
    emit(lodlsungin());
    var auth = FirebaseAuth.instance;
     await auth.createUserWithEmailAndPassword(email: email, password:passworld);
     emit(secssesingup());
  }

List<prodectModel> searchlist = [] ;
  searchdata({required prodectModel prodect})async{
    searchlist.clear();
    for(int i = 0 ; i < data.length ; i++){
      if(data[i].name == prodect.name){
      searchlist = data ;
        emit(ok());
        print(searchlist.length);
        print('ok');
        return searchlist ;
      }else{
        emit(notok());
      }

    }
  }


  GoogleSignIn googlesignIn = GoogleSignIn(scopes: ['email']);

  Future<void> sigin()async{
   try
   {
    GoogleSignInAccount? a =  await googlesignIn.signIn();
    print(a?.email);
     emit(secssegooglesigin());
     print('goood');
   }
   catch(e)
   {
     print(e.toString());
   }
  }

Future<void> sigout()async{
    await googlesignIn.signOut();
}

Future<void> deleatdoc({required int index})async{
try
{
  getdata.snapshots().listen((event) {
    String id = event.docs[index].id;
    String uid = FirebaseFirestore.instance.collection("").doc().id;
    print(uid);
    //print(id.toString());
    print('good');
    getdata.doc("aKS1vR7GqSFfnp4fNjQf").delete();
    emit(secssedeleat());
  });
}
catch (e)
{
  print(e.toString());}
}


// example
List<prodectModel> mysearche = [];

void searchitem(String name){
  mysearche = data.where((element) => element.name!.toString().toLowerCase().contains(name.toLowerCase())).toList();
  emit(secsses_search());
}



}