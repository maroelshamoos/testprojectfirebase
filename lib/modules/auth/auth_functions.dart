import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testprojectfirebase/entities/profile.dart';
import 'package:testprojectfirebase/models/profile_model.dart';

class AuthFunctions {
  Future signUp(String firstName, String lastName, String pass, String email,
      String phoneNum) async {
    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        pass.isNotEmpty &&
        email.isNotEmpty &&
        phoneNum.isNotEmpty) {
      final user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      ProfileModel profileModel = ProfileModel(
          fName: firstName,
          lName: lastName,
          email: email,
          isAdmin: false,
          phoneNumber: phoneNum,
          points: 0);
      await FirebaseFirestore.instance
          .collection('profiles')
          .doc(user.user!.uid)
          .set(profileModel.toJson());
      await FirebaseFirestore.instance
          .collection('carts')
          .doc(user.user!.uid)
          .set({});
    }
  }

  Future login(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    }
  }
}
