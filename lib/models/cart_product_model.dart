import 'package:testprojectfirebase/entities/product.dart';
import '../entities/cart_product.dart';

class CartProductModel extends CartProduct {
  const CartProductModel({required super.product, required super.quantity});

  factory CartProductModel.fromJson(Product product, int quantity) => CartProductModel(
    product: product,
    quantity: quantity,
  );
}