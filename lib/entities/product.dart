import 'dart:ffi';

import 'package:flutter/cupertino.dart';


//basket
class Product {
  final String pName ;
  final String imgUrl;
  final double price;
  final int quantity;

  Product({required this.pName,required this.imgUrl,required this.price,required this.quantity});
}


//shelf
class ProductShelf {
  final String pName ;
  final String imgUrl;
  final double price;
  final int quantity;

  ProductShelf({required this.pName,required this.imgUrl,required this.price,required this.quantity});
}

