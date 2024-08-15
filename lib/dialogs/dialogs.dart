import 'package:chat__application/main.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static Future<void> errorDialogs(
      BuildContext context, String title, msg, VoidCallback btn) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              elevation: 10,
              backgroundColor: lightColor,
              title: Text(
                title,
                style: const TextStyle(
                    color: Colors.black, fontFamily: "Lato - Bold"),
              ),
              content: Text(
                msg,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: "Lato - Regular"),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Lato - Bold",
                        ))),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: btn,
                    child: Text(
                      "OK",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Lato - Bold",
                      ),
                    ))
              ],
            ));
  }
}
