import 'package:testprojectfirebase/entities/product.dart';

class CartProduct{
  final Product product;
  final int quantity;

  const CartProduct({required this.product,
    required this.quantity});
}