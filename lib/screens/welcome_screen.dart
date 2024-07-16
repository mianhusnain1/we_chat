import 'package:chat__application/main.dart';
import 'package:chat__application/screens/login.dart';
import 'package:chat__application/screens/signup.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.orange,
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
                bottom: 0.1,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [darkColor, lightColor]),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(35.0),
                        child: Text(
                          "Welcome!",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: "Lato - Black"),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35.0),
                        child: Text(
                          "Connect with your friends and family instantly.",
                          style: TextStyle(
                              fontSize: 22, fontFamily: "Lato - Regular"),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _options(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          }, Colors.black, Colors.white, "SIGN IN"),
                          const SizedBox(
                            width: 15,
                          ),
                          _options(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signup()));
                          }, Colors.white, Colors.black, "SIGN UP")
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  _options(
      VoidCallback ontap, Color containerColor, Color textColor, String name) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.065,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
            color: containerColor, borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
                color: textColor, fontSize: 17, fontFamily: "Lato - Bold"),
          ),
        ),
      ),
    );
  }
}
