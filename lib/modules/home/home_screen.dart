import 'package:flutter/material.dart';
import 'package:testprojectfirebase/modules/allcatproducts/all_cat_products.dart';
import 'package:testprojectfirebase/modules/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'All Categories' ,
                style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AllCatProductScreen()));
                },
                child: Text(
                  'see all products',
                  style: TextStyle(
                    fontSize: 15.0 ,
                    fontWeight: FontWeight.bold ,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 150,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal ,
              itemBuilder:(context , index) => buildProductItem() ,
              separatorBuilder: (context , index) => SizedBox( width: 20, ),
              itemCount:6 ,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductItem() => Container(
      width: 60,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage:AssetImage('assets/images/1560108-01.png'),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'chipsy with chesse',
            maxLines: 1,
            overflow: TextOverflow.ellipsis ,
          ),
        ],
      )
  );
}
