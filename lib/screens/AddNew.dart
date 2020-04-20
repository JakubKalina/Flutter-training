import 'package:flutter/material.dart';

class AddNew extends StatefulWidget {
  AddNew({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {

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
            Text(
              'Add New'
            )
          ],
        ),
      ),
    );
  }
}
