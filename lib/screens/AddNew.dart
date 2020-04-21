import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../constants.dart';

class AddNew extends StatefulWidget {
  AddNew({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {

  int inputId;
  String inputUsername, inputNote;

  void addNewNote() {
    this._addNewNote();
  }

  _addNewNote() async {

    final url = '$apiAddress/addNew';

    final body = jsonEncode({"id": "${this.inputId}","username":"${this.inputUsername}","note":"${this.inputNote}"});

    Map<String, String> headers = {"Content-type": "application/json"};

    print(body);
    final response = await post(url, headers: headers, body: body);
    print(response.body);
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/AddNew');
        },
        child: Icon(Icons.add, size: 40,),
        backgroundColor: Colors.greenAccent[700],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text('Cześć',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.greenAccent[700],
              ),
            ),

            SizedBox(
              height: 40,
            ),

            InkWell(
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Wszystkie notatki',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                  ],
                ),
                onTap: () => {
                  Navigator.pushReplacementNamed(context, '/GetAll')
                },
            ),

            SizedBox(
              height: 40,
            ),

            InkWell(
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Dodaj nową',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                onTap: () => {
                  Navigator.pushReplacementNamed(context, '/AddNew')
                },
            ),

          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Center(
          child: Text(
            'Team Notes',
            style: TextStyle(

            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Id'
              ),
              onChanged: (text) => inputId = int.parse(text),
            ),

            TextFormField(
              decoration: InputDecoration(
                labelText: 'Imię'
              ),
              onChanged: (text) => inputUsername = text,
            ),

            TextFormField(
              decoration: InputDecoration(
                labelText: 'Notatka'
              ),
              onChanged: (text) => inputNote = text,
            ),

            SizedBox(height: 20,),

            OutlineButton(
              onPressed: () {
                this.addNewNote();
              },
              child: Text('Dodaj'),    
            ),

          ],
        ),
      ),
    );
  }
}
