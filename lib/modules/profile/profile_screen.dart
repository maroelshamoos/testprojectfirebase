import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testprojectfirebase/entities/profile.dart';
import 'package:testprojectfirebase/models/profile_model.dart';
import 'package:testprojectfirebase/modules/auth/presentation/screens/login_screen.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  Profile profile = Profile(
      fName: '',
      lName: '',
      email: '',
      phoneNumber: '',
      isAdmin: false,
      points: 0);

  getProfileUser() async {
    profile = await FirebaseFirestore.instance
        .collection('profiles')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) => ProfileModel.fromJson(value.data()!));
    setState(() {});
  }

  @override
  void initState() {
    getProfileUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 70.0,
                    backgroundImage: AssetImage('assets/images/Maro.png'),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          '${profile.fName} ${profile.lName}',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'VIP customer',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey[500],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'points : ${profile.points}',
                          style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 10.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.email),
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Text(profile.email),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Text(profile.phoneNumber),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
        )
      ],
    );
  }
}

// NetworkImage('https://cdn.britannica.com/92/215392-050-96A4BC1D/Australian-actor-Chris-Hemsworth-2019.jpg')
