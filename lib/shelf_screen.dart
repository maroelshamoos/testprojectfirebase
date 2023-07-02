import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testprojectfirebase/entities/product.dart';
import 'package:testprojectfirebase/functions/get_product.dart';
import 'package:testprojectfirebase/models/product_model.dart';

import 'modules/auth/presentation/screens/login_screen.dart';

class ProductScreenShelf extends StatefulWidget {
  const ProductScreenShelf({Key? key}) : super(key: key);


  @override
  State<ProductScreenShelf> createState() => _ProductScreenShelfState();
}

class _ProductScreenShelfState extends State<ProductScreenShelf> {



  GetProductShelf getProductshelf = GetProductShelf();
  List<ProductModelShelf> products =[];
  _init()async{
    products = await getProductshelf.fromDataBase();
    setState(() {

    });
  }



  @override
  void initState() {
    super.initState();
    _init();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC2185B),
        title: const Text(
            style: TextStyle(
                color: Colors.white
            ), 'Shelf'
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder:(context , index) => buildShelfItems(products[index]),
                        separatorBuilder:(context , index) => Container(
                          height: 1.0,
                          color: Colors.grey[300],
                          width: double.infinity,
                        ),
                        itemCount:products.length),
                    const SizedBox(height: 10.0,),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  await Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ],
        
      ),
    );
  }

  Widget buildShelfItems (ProductShelf productShelf)=>
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CircleAvatar(
                backgroundColor:Colors.white ,
                radius: 50.0,
                child: Image(
                    image: NetworkImage(productShelf.imgUrl)
                )
            ),
            const SizedBox(width: 10.0,),
            SizedBox(
              width: 180.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productShelf.pName,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  Text(
                    'price :${productShelf.price} EGP',
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
            Container(
              width: 70.0,
              child: Text(
                'Qty : ${productShelf.quantity}',
                style: const TextStyle(
                  fontSize: 20.0 ,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
      
          ],
        ),
      );
}
