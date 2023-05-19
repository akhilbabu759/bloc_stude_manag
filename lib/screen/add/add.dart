import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddScree extends StatelessWidget {
  const AddScree({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController te = TextEditingController();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 21, 21, 27),
            Color.fromARGB(255, 32, 103, 133),
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            TextFormField( cursorColor: Colors.white,
              controller: te,
            ),
            IconButton(
                onPressed: () {
                  if (te.text.isNotEmpty) {
                    FirebaseFirestore.instance
                        .collection('stud_manag')
                        .add({'name': te.text});
                    Navigator.of(context).pop();
                  }
                },
                icon: const Icon(Icons.upload))
          ]),
        ),
      ),
    );
  }
}
