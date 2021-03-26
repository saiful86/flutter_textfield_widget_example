import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'TextField Widget Example',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Scaffold(
      appBar: AppBar(title: Text('TextField Widget Example'),),
      backgroundColor: Colors.grey[300],
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String text = '';

  bool _secure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
           decoration: InputDecoration(
             hintText: 'enter your name',
             labelText: 'Name',
             labelStyle: TextStyle(
               color: Colors.orange,
               fontSize: 18
             ),
             hintStyle:  TextStyle(
                 color: Colors.redAccent,
                 fontSize: 18
             ),
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(15),
             ),
             prefixIcon: Icon(Icons.account_circle),
             suffixIcon: IconButton(
                 icon:Icon(_secure?Icons.remove_red_eye:Icons.security),
                 onPressed: (){
                   setState(() {
                     _secure = !_secure;
                   });
                 },

             ),
             errorText: text.isEmpty?'Empty':null
           ),
            keyboardType: TextInputType.text,
            obscureText: _secure,
            obscuringCharacter: '*',
            maxLength: 10,
            //maxLines: 2,
            onChanged: (value){
              text = value;
            },
            onSubmitted: (value){
             setState(() {
               text = value;
             });

             print(value);
            },
          )
        ],
      ),
    );
  }
}
