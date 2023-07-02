import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:testprojectfirebase/core/viewmodels/floorplan_model.dart';
import 'package:testprojectfirebase/layout/home_layout.dart';
import 'package:testprojectfirebase/modules/auth/presentation/screens/login_screen.dart';
import 'package:testprojectfirebase/modules/cart/products_screen.dart';
import 'package:testprojectfirebase/shared/blocobserver.dart';
import 'package:testprojectfirebase/shelf_screen.dart';
import 'modules/allcatproducts/all_cat_products.dart';

void main() async {

  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FloorPlanModel>(create: (context) => FloorPlanModel()),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme:const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white ,
            statusBarIconBrightness: Brightness.dark ,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black ,
            fontSize: 20.0 ,
            fontWeight: FontWeight.bold ,
          ),
          backgroundColor: Colors.white ,
          elevation: 0.0 ,
          iconTheme: IconThemeData(
              color: Colors.black
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed ,
          selectedItemColor: Color(0xFFC2185B),
          elevation: 20.0,
        ),
      ),
      home: FirebaseAuth.instance.currentUser?.uid == null?LoginScreen():HomeLayout(),
      )
    );
  }
}


