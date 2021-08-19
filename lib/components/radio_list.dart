import 'package:flutter/material.dart';

class RadioList extends StatefulWidget {
  RadioList(
      {Key? key, required this.allValues, required this.selectionTitle})
      : super(key: key);
  final List<String> allValues;
  final String selectionTitle;
  @override
  RadioListState createState() => RadioListState();
}

class RadioListState extends State<RadioList> {
  var _site;
  bool firstTime = true;
  validate() {
    if (_site == null) {
      setState(() {
        firstTime = false;
      });
      return false;
    }
    return true;
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, int index) {
            return ListTile(
              leading: Text(widget.allValues[index]),
              trailing: Radio(
                activeColor: Colors.pink,
                value: widget.allValues[index],
                groupValue: _site,
                onChanged: (var value) {
                  setState(() {
                    _site = value!;
                  });
                },
              ),
            );
          },
          itemCount: widget.allValues.length,
        ),
        if (_site == null && firstTime == false)
          Text(
            'You have not selected a ${widget.selectionTitle}',
            style: TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}