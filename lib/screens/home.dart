import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Spacer(),
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
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Text(
                "Chat",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 40,
                    fontFamily: "Lato - Black"),
              )
            ],
          )
        ],
      ),
    );
  }
}
