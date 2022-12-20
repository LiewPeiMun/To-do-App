import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  var itemnameEditingController = TextEditingController();
  var itemplaceEditingController = TextEditingController();
  var itemdescriptionEditingController = TextEditingController();
  // const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new item"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              //TextField(decoration: InputDecoration(hintText: "Enter your name"), controller: nameEditingController,),
              TextField(decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Enter item name"),controller: itemnameEditingController,),
              SizedBox(height: 20),
              TextField(decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Enter item place"),controller: itemplaceEditingController,),
              SizedBox(height: 20),
              TextField(decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Enter item description"), controller: itemdescriptionEditingController, maxLines: 5,),
              SizedBox(height: 50),
              TextButton(onPressed:(){
                print("Item name is ${itemnameEditingController.text}");
                print("Item place is ${itemplaceEditingController.text}");
                print("Item description is ${itemdescriptionEditingController.text}");
                var newItem ={
                  "name": itemnameEditingController.text,
                  "place": itemplaceEditingController.text,
                  "description": itemdescriptionEditingController.text
                };
                //pass the data as second argument
                Navigator.pop(context, newItem);
              }, child: Text("Add"), style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.red, // Background Color
                minimumSize: const Size.fromHeight(50), // make the button full-width
           ),)

            ],
          ),
        ),
      ),
    );
  }
}
