import 'package:flutter/material.dart';
import 'package:testprojectfirebase/entities/product.dart';
import 'package:testprojectfirebase/functions/get_product.dart';
import 'package:testprojectfirebase/models/product_model.dart';

class AllCatProductScreen extends StatefulWidget {
  const AllCatProductScreen({super.key});

  @override
  State<AllCatProductScreen> createState() => _AllCatProductScreenState();
}



class _AllCatProductScreenState extends State<AllCatProductScreen> {

  GetProductShelf getProductshelf = GetProductShelf();
  List<ProductModelShelf> products =[];
  _init()async{
    products = await getProductshelf.fromDataBase();
    setState(() {});
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
        title: const Text('All Categories'),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder:(context , index) => buildShelfItems(products[index]),
                  separatorBuilder:(context , index) => Container(
                    height: 1.0,
                    color: Colors.grey[300],
                    width: double.infinity,
                  ),
                  itemCount:products.length),
              SizedBox(height: 10.0,),
            ],
          ),
        ),
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
            SizedBox(width: 10.0,),
            Container(
              width: 180.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productShelf.pName,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    'price :${productShelf.price} EGP',
                    style: TextStyle(
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
            avaNotAva(productShelf.quantity > 0)
          ],
        ),
      );
}

Widget avaNotAva (bool isAv) {
  return isAv?Row(
    children: [
      CircleAvatar(
        radius: 5,
        backgroundColor: Colors.green,
      ),
      Text(
        ' Valid',
        style: TextStyle(
          fontSize: 16 ,
          fontWeight: FontWeight.bold,
          color: Colors.lightGreen,
        ),
      ),
    ],
  ): Row(
    children: [
      CircleAvatar(
        radius: 5,
        backgroundColor: Colors.red,
      ),
      Text(
        ' Not Valid',
        style: TextStyle(
          fontSize: 16 ,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    ],
  );
}
