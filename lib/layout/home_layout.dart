import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testprojectfirebase/entities/profile.dart';
import '../models/profile_model.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';
import '../shelf_screen.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  bool isAdmin = false;
  bool isLoading = true;

  @override
  void initState() {
    checkIsAdmin();
    super.initState();
  }

  Future checkIsAdmin() async {
    Profile profile = await FirebaseFirestore.instance
        .collection('profiles')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) => ProfileModel.fromJson(value.data()!));
    setState(() {
      isAdmin = profile.isAdmin;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red)),
            ),
          )
        : isAdmin
            ? ProductScreenShelf()
            : BlocProvider(
                create: (BuildContext context) => AppCubit(),
                child: BlocConsumer<AppCubit, AppStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var cubit = AppCubit.get(context);

                    return Scaffold(
                      key: scaffoldkey,
                      appBar: AppBar(
                        title: Text(
                          cubit.titles[cubit.currentindex],
                        ),
                      ),
                      bottomNavigationBar: BottomNavigationBar(
                        currentIndex: cubit.currentindex,
                        onTap: (index) {
                          cubit.changebottomnavbarindex(index);
                        },
                        items: cubit.Bottomitems,
                      ),
                      body: cubit.screens[cubit.currentindex],
                    );
                  },
                ),
              );
  }
}
