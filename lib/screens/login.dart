import 'package:chat__application/main.dart';
import 'package:chat__application/screens/home.dart';
import 'package:chat__application/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TextEditingController _namecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  bool _isobscure = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // _namecontroller.dispose();
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
                child: const Text(
                  'Register',
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
                    "SIGN IN",
                    style: TextStyle(fontSize: 30, fontFamily: "Lato - Black"),
                  ),
                  Text(
                    "Please sign in to stay connected.",
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
              suffixIcon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.only(right: 15.0, top: 5),
                child: Text(
                  "Forget Password?",
                  style: TextStyle(fontFamily: 'Lato - Bold', fontSize: 17),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
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
                  "SIGN IN",
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
                        width: 40,
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
                  padding: const EdgeInsets.only(left: 10.0),
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
        const SizedBox(
          height: 30,
        )
      ],
    ));
  }
}
