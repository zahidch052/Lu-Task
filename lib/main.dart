import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio_object/components/radio_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyClass(),
    );
  }
}

GlobalKey<RadioListState> homeState = GlobalKey<RadioListState>();

class MyClass extends StatefulWidget {
  const MyClass({Key? key}) : super(key: key);

  @override
  _MyClassState createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {
  List<String> allValue = ['Male', 'Female', 'Other'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RadioList(
            key: homeState,
            allValues: allValue,
            selectionTitle: 'Gender',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bool num = homeState.currentState!.validate();
          if (num == true) {
            print('true');
          } else {
            print('false');
          }
        },
        child: Icon(Icons.done),
      ),
    );
  }
}


