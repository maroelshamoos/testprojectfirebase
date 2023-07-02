import 'package:flutter/material.dart';
import 'package:testprojectfirebase/componantes/componantes.dart';
import 'package:testprojectfirebase/entities/cart_product.dart';
import 'package:testprojectfirebase/functions/get_product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  GetProduct getProduct = GetProduct();
  List<CartProduct> products = [];
  double total = 0;

  _init() async {
    products = await getProduct.fromDataBase();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildCartItems(products[index]),
                separatorBuilder: (context, index) => Container(
                      height: 1.0,
                      color: Colors.grey[300],
                      width: double.infinity,
                    ),
                itemCount: products.length),
            const SizedBox(
              height: 10.0,
            ),
            DefaultButton(
                function: () {
                  for (var element in products) {
                    total = total + (element.quantity * element.product.price);
                  }
                  setState(() {});
                },
                text: 'Check out',
                backgroundcolor: const Color(0xFFC2185B)),
            if (total > 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Total price',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 21)),
                  Text(
                    '$total',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }

  Widget buildCartItems(CartProduct cartProduct) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50.0,
                child: Image(image: NetworkImage(cartProduct.product.imgUrl))),
            const SizedBox(width: 10.0),
            SizedBox(
              width: 180.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartProduct.product.pName,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'price :${cartProduct.product.price} EGP',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 1.0,
              height: 80.0,
              color: Colors.grey[300],
            ),
            SizedBox(
              width: 70.0,
              child: Text(
                'Qty : ${cartProduct.quantity}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
}
