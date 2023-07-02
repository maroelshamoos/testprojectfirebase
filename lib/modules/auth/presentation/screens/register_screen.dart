import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testprojectfirebase/layout/home_layout.dart';
import 'package:testprojectfirebase/modules/auth/auth_functions.dart';

import '../../../../shared/componantes/componants.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool is_obsecure = true;

  var fnamecontroller = TextEditingController();
  var lnamecontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  signup() async {
    AuthFunctions authFunctions = AuthFunctions();
    await authFunctions.signUp(fnamecontroller.text, lnamecontroller.text,
        passcontroller.text, emailcontroller.text, phonecontroller.text);
    if (FirebaseAuth.instance.currentUser?.uid != null) {
      await Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeLayout()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIGN UP'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                DefaultFormfield(
                    controller: fnamecontroller,
                    inputtype: TextInputType.text,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'first name must be written';
                      }
                    },
                    label: 'firstname',
                    preicon: Icons.drive_file_rename_outline_rounded),
                const SizedBox(
                  height: 10.0,
                ),
                DefaultFormfield(
                    controller: lnamecontroller,
                    inputtype: TextInputType.text,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'last name must be written';
                      }
                    },
                    label: 'lastname',
                    preicon: Icons.drive_file_rename_outline_rounded),
                const SizedBox(
                  height: 10.0,
                ),
                DefaultFormfield(
                  controller: passcontroller,
                  inputtype: TextInputType.visiblePassword,
                  isPassword: is_obsecure,
                  Onsubmit: (value) {
                    print(value);
                  },
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Password must be written';
                    }
                  },
                  label: 'Password',
                  preicon: Icons.lock,
                  sufix: is_obsecure ? Icons.visibility : Icons.visibility_off,
                  sufpressed: () {
                    setState(() {
                      is_obsecure = !is_obsecure;
                    });
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                DefaultFormfield(
                    controller: emailcontroller,
                    inputtype: TextInputType.emailAddress,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'email must be written';
                      }
                    },
                    label: 'email',
                    preicon: Icons.email),
                const SizedBox(
                  height: 10.0,
                ),
                DefaultFormfield(
                    controller: phonecontroller,
                    inputtype: TextInputType.phone,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'phone number must be written';
                      }
                    },
                    label: 'phone',
                    preicon: Icons.phone),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: double.infinity,
                  child: DefaultButton(
                      backgroundcolor: Color(0xFFC2185B),
                      function: () async {
                        if (formkey.currentState!.validate()) {
                          await signup();
                        }
                      },
                      text: 'signup'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
