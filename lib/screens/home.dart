import 'package:chat__application/main.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 226, 228, 230),
        //

        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [mediumColor, lightColor, lightColor, lightColor]),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 34,
                      backgroundColor: Colors.red,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Hi, Ali",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Lato - Bold',
                          fontSize: 25),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black54,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.black54,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Text(
                      "Chat",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 40,
                          fontFamily: "Lato - Black"),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Text(
                          "35",
                          style: TextStyle(
                              fontSize: 15, fontFamily: "Lato - Regular"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: const Color(0xFFF9F9FA),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                  offset: const Offset(1, 1))
                            ],
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 60,
                          child: const TabBar(
                            dividerHeight: 0,
                            labelStyle: TextStyle(
                                fontFamily: "Lato - Bold",
                                fontSize: 18,
                                color: Colors.black),
                            unselectedLabelColor: Colors.grey,
                            indicator: BoxDecoration(),
                            tabs: [
                              Tab(
                                text: 'All',
                              ),
                              Tab(text: 'Office'),
                              Tab(text: 'Family'),
                              Tab(
                                text: "Others",
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        blurRadius: 10,
                                        spreadRadius: 1,
                                        offset: const Offset(1, 1))
                                  ],
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              child: const TabBarView(
                                children: [
                                  Center(child: Text('All Content')),
                                  Center(child: Text('Office Content')),
                                  Center(child: Text('Family Content')),
                                  Center(child: Text('Others Content')),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
