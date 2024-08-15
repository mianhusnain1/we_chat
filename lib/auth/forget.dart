import 'package:chat__application/auth/login.dart';
import 'package:chat__application/dialogs/dialogs.dart';
import 'package:chat__application/main.dart';
import 'package:chat__application/screens/home.dart';
import 'package:chat__application/auth/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  // TextEditingController _namecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mediumColor,
      appBar: AppBar(
        backgroundColor: mediumColor,
        foregroundColor: Colors.black,
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20, fontFamily: 'Lato - Bold'),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30.0, top: 50),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forget Password?",
                    style: TextStyle(fontSize: 30, fontFamily: "Lato - Black"),
                  ),
                  Text(
                    "Provide your email and you will receive a verification link.",
                    style:
                        TextStyle(fontSize: 18, fontFamily: 'Lato - Regular'),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                // height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40))),
                child: _buildForm(),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildForm() {
    return Form(
        child: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextFormField(
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                return null;
              } else {
                return "Required";
              }
            },
            controller: _emailcontroller,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              prefixIconColor: darkColor,
              labelText: "Email",
              labelStyle: const TextStyle(fontSize: 15, color: Colors.grey),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: darkColor),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: InkWell(
            onTap: () async {
              try {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                          child: LottieBuilder.asset(
                        "assets/Lottie/Loading.json",
                        height: 100,
                      ));
                    });
                final auth = FirebaseAuth.instance;

                auth.sendPasswordResetEmail(email: _emailcontroller.text).then(
                    (value) => Dialogs.errorDialogs(context, "Success",
                            "We have sent you a verification email.", () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        }));
              } catch (e) {}
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.width - 0.2,
              decoration: BoxDecoration(
                  gradient:
                      const LinearGradient(colors: [mediumColor, lightColor]),
                  borderRadius: BorderRadius.circular(30)),
              child: const Center(
                child: Text(
                  "Send",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: 'Lato - Bold'),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const SizedBox(
          height: 80,
        )
      ],
    ));
  }
}
