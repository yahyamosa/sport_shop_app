import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/cubit/cubit.dart';

import 'Screen/splash.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(shopapp());
}
class shopapp extends StatelessWidget {
  const shopapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[
      BlocProvider(create:(context)=>cubitui())
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home:splash(),
    ));
  }
}
