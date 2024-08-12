import 'package:chat__application/dialogs/dialogs.dart';
import 'package:chat__application/main.dart';
import 'package:chat__application/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  bool _isobscure = true;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontFamily: 'Lato - Bold'),
                  ),
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
                    "Create Account",
                    style: TextStyle(fontSize: 30, fontFamily: "Lato - Black"),
                  ),
                  Text(
                    "Join now! Sign up to chat, connect, and share.",
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
            ),
          ],
        ),
      ),
    );
  }

  _buildForm() {
    return Form(
      key: _formkey,
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
              controller: _namecontroller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                prefixIconColor: darkColor,
                labelText: "Name",
                hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                hintText: "Enter Name",
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
                hintText: "Enter Email",
                hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
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
              obscureText: _isobscure,
              controller: _passwordcontroller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                prefixIconColor: darkColor,
                labelText: "Password",
                hintText: "Enter Password",
                hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isobscure = !_isobscure;
                      });
                    },
                    icon: const Icon(Icons.remove_red_eye)),
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
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: InkWell(
              onTap: () async {
                if (_formkey.currentState!.validate()) {
                  try {
                    showDialog(
                      context: context,
                      builder: (context) => Center(
                        child: LottieBuilder.asset(
                          "assets/Lottie/Loading.json",
                          height: 100,
                        ),
                      ),
                    );

                    final auth = FirebaseAuth.instance;
                    await auth.createUserWithEmailAndPassword(
                      email: _emailcontroller.text,
                      password: _passwordcontroller.text,
                    );

                    // Successfully registered
                    Navigator.of(context).pop(); // Close loading dialog
                    Dialogs.errorDialogs(
                      context,
                      "Success",
                      "Your Account Has been Successfully Created",
                      () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    );
                  } on FirebaseAuthException catch (e) {
                    Navigator.of(context).pop(); // Close loading dialog

                    // Handle specific Firebase Auth errors
                    if (e.code == "invalid-credential") {
                      Dialogs.errorDialogs(
                        context,
                        "Error",
                        "You have entered invalid credentials.",
                        () => Navigator.of(context).pop(),
                      );
                    } else if (e.code == "invalid-email") {
                      Dialogs.errorDialogs(
                        context,
                        "Error",
                        "Please correct your email format.",
                        () => Navigator.of(context).pop(),
                      );
                    } else if (e.code == "network-request-failed") {
                      Dialogs.errorDialogs(
                        context,
                        "Error",
                        "Pleas internet connection.",
                        () => Navigator.of(context).pop(),
                      );
                    } else {
                      // Handle other Firebase Auth exceptions
                      Dialogs.errorDialogs(
                        context,
                        "Error",
                        "Something went wrong. Please try again later.",
                        () => Navigator.of(context).pop(),
                      );
                    }

                    print("Firebase Auth Error: ${e.code}");
                  } catch (e) {
                    Navigator.of(context).pop(); // Close loading dialog
                    // Handle other exceptions
                  }
                }
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
                    "SIGN UP",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  width: MediaQuery.of(context).size.width - 0.2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(1, 2),
                            blurRadius: 1,
                            color: Colors.grey.withOpacity(0.3))
                      ],
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          child: Image.asset("assets/Icons/google.png"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Continue with Google",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lato - Regular',
                              fontSize: 17),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        )
                      ],
                    ),
                  )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  width: MediaQuery.of(context).size.width - 0.2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(1, 2),
                            blurRadius: 1,
                            color: Colors.grey.withOpacity(0.3))
                      ],
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 17,
                          child: Image.asset("assets/Icons/fb.png"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Continue with Facebook",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lato - Regular',
                              fontSize: 17),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        )
                      ],
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
