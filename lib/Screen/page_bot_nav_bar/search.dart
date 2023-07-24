import 'package:flutter/material.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50 , left: 20 , right: 20),
            child: TextFormField(
              decoration: InputDecoration(
                label: Text('search'),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder:(context , indext){
                  return Padding(
                    padding: const EdgeInsets.only(left: 20 , bottom: 10),
                    child: Row(

                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('img/d.jpeg')
                              )
                          ),
                          width: 70,
                          height: 70,

                        ) ,
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nike potes" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 22),),
                            SizedBox(height: 5,),
                            Text(r"200.0$" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 12 , color: Colors.grey),)
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
  }
}
