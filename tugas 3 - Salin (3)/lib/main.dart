import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Communication Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CommunicationDemo(),
    );
  }
}

class CommunicationDemo extends StatefulWidget {
  @override
  _CommunicationDemoState createState() => _CommunicationDemoState();
}

class _CommunicationDemoState extends State<CommunicationDemo> {
  TextEditingController _textFieldController = TextEditingController();
  String _webLabel = "nice to meet you";
  String _mobileLabel = "hello world";

  void _updateMobileLabel(String text) {
    setState(() {
      _mobileLabel = text;
    });
  }

  Future<void> _fetchWebLabel() async {
    final response = await http.get(Uri.parse('http://localhost:3000/web/index.php')); // Ganti URL dengan URL web Anda

    if (response.statusCode == 200) {
      setState(() {
        _webLabel = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load web label');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Communication Demo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(_mobileLabel, style: TextStyle(fontSize: 20.0)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(labelText: 'Enter text'),
            ),
          ),
          SizedBox(height: 20.0),
         
         
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {
               _updateMobileLabel('hello world ' + _textFieldController.text);
                _fetchWebLabel();
              },
              child: Text('Update Labels'),
            ),
          ),
          SizedBox(height: 20.0),
         
         
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(_webLabel, style: TextStyle(fontSize: 20.0)),
          ),
        ],
      ),
    );
  }
}
