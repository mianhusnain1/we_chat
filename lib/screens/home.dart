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
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                        color: Colors.grey,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                      )),
                  // PopupMenuButton<String>(
                  //   onSelected: (String value) {
                  //     // Handle the selected menu option here
                  //   },
                  //   itemBuilder: (BuildContext context) {
                  //     return {'Option 1', 'Option 2', 'Option 3'}
                  //         .map((String choice) {
                  //       return PopupMenuItem<String>(
                  //         value: choice,
                  //         child: Text(choice),
                  //       );
                  //     }).toList();
                  //   },
                  //   icon: Icon(Icons.more_vert),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Stack(children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 249, 249, 250),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: const TabBar(
                    labelStyle: TextStyle(
                        fontFamily: "Lato - Bold",
                        fontSize: 18,
                        color: Colors.black),
                    unselectedLabelColor: Colors.grey,
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
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: TabBarView(children: []),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
