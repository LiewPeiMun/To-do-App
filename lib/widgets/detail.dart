import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  // const DetailPage({Key? key}) : super(key: key);
  final item;

  //constructor to pass object
  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail"),),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(item["name"]),
            SizedBox(height: 20),
            Text(item["description"]),
            SizedBox(height: 20),
            Text(item["place"])
          ],
        ),
      ),
    );
  }
}
