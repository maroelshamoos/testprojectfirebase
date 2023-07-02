import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:testprojectfirebase/entities/cart_product.dart';
import 'package:testprojectfirebase/entities/product.dart';
import 'package:testprojectfirebase/models/cart_product_model.dart';
import 'package:testprojectfirebase/models/product_model.dart';

//basket
class GetProduct {
  Future<List<CartProduct>> fromDataBase() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("carts")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('cart')
        .get();

    final List<CartProduct> cartProducts = [];

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      Product product = await FirebaseFirestore.instance
          .collection('productsShelf')
          .doc(querySnapshot.docs[i].id)
          .get()
          .then((value) => ProductModel.fromJson(value.data()!));
      cartProducts.add(CartProductModel.fromJson(
          product, querySnapshot.docs[i].get('quantity')));
    }

    return cartProducts;
  }
}

//shelf
class GetProductShelf {
  Future<List<ProductModelShelf>> fromDataBase() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("productsShelf").get();
    final List allProductsShelf =
        querySnapshot.docs.map((doc) => doc.data()).toList();
    List<ProductModelShelf> dataShelf = [];
    for (var element in allProductsShelf) {
      dataShelf.add(ProductModelShelf.fromJson(element));
    }
    return dataShelf;
  }
}
