import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:user_notes/screens/Edit.dart';
import 'package:user_notes/userNote.dart';

import '../constants.dart';

class GetAll extends StatefulWidget {
  GetAll({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GetAllState createState() => _GetAllState();
}

class _GetAllState extends State<GetAll> {

    List<UserNote> allNotes;

    @override
    void initState() {
      super.initState();
      this.getAllNotes();
    }

    // Get all notes from API
    Future<void> getAllNotes() async {
      Response response = await get(apiAddress + '/getAll');
      Map data = jsonDecode(response.body);

      setState(() {
        allNotes=(data['All notes'] as List).map((i) =>
                    UserNote.fromJson(i)).toList();
      });
    }

    // Remove note by Id
    Future<void> deleteNote(int noteId) async {
      final url = '$apiAddress/delete';

      Map<String, String> headers = {"Content-type": "application/json", "id": "${noteId}"};

      final response = await delete(url, headers: headers);
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
              Expanded(
                              child: ListView.builder(
                  //scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: allNotes == null ? 0 : allNotes.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.note),
                            title: Text('Id: ' + allNotes[index].id.toString() + ' należy do: ' + allNotes[index].username),
                            subtitle: Text(allNotes[index].note),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: Text('Edytuj'),
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Edit(noteId: allNotes[index].id,)));
                                },
                              ),
                              FlatButton(
                                child: Text('Usuń'),
                                onPressed: () {
                                  deleteNote(allNotes[index].id).then((e) {
                                    this.getAllNotes();
                                  });                              
                                },
                              )
                            ],
                          )
                        ],
                      )
                    );
                  }
                ),
              ),
          ],
        ),
      ),
    );
  }
}
