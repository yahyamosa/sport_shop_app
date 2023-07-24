class prodectModel
{
  dynamic img ;
  dynamic name ;
  dynamic price ;
  dynamic dic ;

  prodectModel({required this.img ,required this.name ,required this.price ,required this.dic});

  factory prodectModel.fromjson(dynamic json){
    return prodectModel(
        img: json['img'],
        name: json['name'],
        price: json['price'],
        dic: json['dic']);
  }
}