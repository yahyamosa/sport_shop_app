import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
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
          var data = BlocProvider.of<cubitui>(context).getfiv();
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
                      return Padding(
                          padding: const EdgeInsets.only(left: 20 , bottom: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${mylist[indext].name}" , style:const TextStyle(fontWeight: FontWeight.bold , fontSize: 22),),
                                        const  SizedBox(height: 5,),
                                        Text("${mylist[indext].price} " , style:const TextStyle(fontWeight: FontWeight.bold , fontSize: 14 , color: Colors.grey),)
                                      ],
                                    ) ,
                                    SizedBox(width: MediaQuery.of(context).size.width /2.2,),
                                    IconButton(onPressed:(){
                                      BlocProvider.of<cubitui>(context).deleat();
                                      BlocProvider.of<cubitui>(context).getfiv();
                                    }, icon:Icon(Icons.delete , color: Colors.grey,))
                                  ],
                                )
                              ],
                            ),
                          ),
                        );

                    }),
              ) ,
              const SizedBox(height: 10,),
              Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: MaterialButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          PaypalCheckout(
                            sandboxMode: true,
                            clientId: "AW8pEj_0rR8fBilxBhB4cwS7x6lakja9QibsJCTZ3fZys3xIRIlwMU8lbOOnSB_vCGBdkOrHZNcTCBKK",
                            secretKey: "EM-twvRN18HnFfCz2KYt4UDoO8Zi8ErTg0sdRAm49282nNRXX7xuJkSAMrygXpr8eoUaLRQ3lL-8IDRT",
                            returnURL: "success.snippetcoder.com",
                            cancelURL: "cancel.snippetcoder.com",
                            transactions: const [
                              {
                                "amount": {
                                  "total": '70',
                                  "currency": "USD",
                                  "details": {
                                    "subtotal": '70',
                                    "shipping": '0',
                                    "shipping_discount": 0
                                  }
                                },
                                "description": "The payment transaction description.",
                                "item_list": {
                                  "items": [
                                    {
                                      "name": "Apple",
                                      "quantity": 4,
                                      "price": '5',
                                      "currency": "USD"
                                    },
                                    {
                                      "name": "Pineapple",
                                      "quantity": 5,
                                      "price": '10',
                                      "currency": "USD"
                                    }
                                  ],
                                  // shipping address is Optional
                                  "shipping_address": {
                                    "recipient_name": "Raman Singh",
                                    "line1": "Delhi",
                                    "line2": "",
                                    "city": "Delhi",
                                    "country_code": "IN",
                                    "postal_code": "11001",
                                    "phone": "+00000000",
                                    "state": "Texas"
                                  },
                                }
                              }
                            ],
                            note: "PAYMENT_NOTE",
                            onSuccess: (Map params) async {
                              print("onSuccess: $params");
                            },
                            onError: (error) {
                              print("onError: $error");
                              Navigator.pop(context);
                            },
                            onCancel: () {
                              print('cancelled:');
                            },
                          ),

                    ));
                  } , child:const Text("Buy Now" , style: TextStyle(color: Colors.white),),)) ,
             const SizedBox(height: 5,)
            ],
          )
      );
    }, listener:(context , state){});
  }
}
