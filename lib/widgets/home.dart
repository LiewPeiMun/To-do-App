import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todos/widgets/add.dart';
import 'package:todos/widgets/detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //[] list / array
  var todos = [
    // {
    //   "name": "Learn Listview",
    //   "place": "Traning room",
    //   "description": "Learn listview, listtile, etc"
    // },
    // {
    //   "name": "Tea / Dinner",
    //   "place": "Nuin Cafe",
    //   "description": "Specialize teh tarik"
    // },
    // {
    //   "name": "Chapter 2 & 3",
    //   "place": "Home",
    //   "description": "Data type & OOP"
    // },
    // {
    //   "name": "Video record",
    //   "place": "Home",
    //   "description": "Record video for app"
    // }
  ];

  //inherit the function from State<HomePage>
  @override
  //when the app is loaded
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  //when the app is loaded
  void loadData() async {
    final prefs = await SharedPreferences.getInstance();
    //in dart, there will be datatype that can accept value of null, or cannot accept it
    //String name = null; (this is wrong),
    //Normal string cannot accept null value
    //String? name;<-can be null or a String (optional)
    String? todoString = prefs.getString("todos");
    if (todoString != null) {
      setState(() {
        //change from String to List of Map
        todos = jsonDecode(todoString);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do app"),
        //action is something like trailing, add the element at appbar
        actions: [
          //find the nearest curly braces to put "async"
          IconButton(
              onPressed: () async {
                //waiting new item from add.dart
                final newItem = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddPage()));
                todos.add(newItem);

                // Obtain shared preferences ("file manager")
                final prefs = await SharedPreferences.getInstance();

                //jsonEncode will transform list of map to String
                //because sharedPreference only can only can store string,boolean or int
                //the first 'todos' is the filename
                prefs.setString("todos", jsonEncode(todos));

                setState(() {
                  todos;
                });
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(todos[index]["name"]!),
                subtitle: Text(todos[index]["place"]!),
                trailing: Icon(Icons.chevron_right),
                leading: Icon(Icons.tab),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                item: todos[index],
                              )));
                }, //the name should be the same as detail.dart constructor, index is the row(array concept)
              ),
            );
          }),
    );
  }
}
