import 'package:testprojectfirebase/entities/product.dart';


//basket
class ProductModel extends Product {
  ProductModel(
      {required super.pName,
      required super.imgUrl,
      required super.price,
      required super.quantity});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        imgUrl: json["image"],
        pName: json["name"],     //names in the firebase cant be changed
        price: json["price"],
        quantity: json["quantity"],
      );//this factory is a constractor and this from json will take the data from firebase to the entity
}


//shelf
class ProductModelShelf extends ProductShelf {
  ProductModelShelf(
      {required super.pName,
        required super.imgUrl,
        required super.price,
        required super.quantity});

  factory ProductModelShelf.fromJson(Map<String, dynamic> json) => ProductModelShelf(
    imgUrl: json["image"],
    pName: json["name"],     //names in the firebase cant be changed
    price: json["price"],
    quantity: json["quantity"],
  );
}

