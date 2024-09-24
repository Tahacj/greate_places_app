import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import '../providers/great_places.dart';
import '../widgets/image_input_dart.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = "/add-place";
  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
    // print("this is the picked image :$_pickedImage");
  }

  Void _savePlace() {
    // print("this is the picked image :$_pickedImage");
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return null;
    }
    // print("good");
    Provider.of<GreatPlaces>(context, listen: false).addPlace(
      _titleController.text,
      _pickedImage,
    );
    // print("good");
    Navigator.of(context).pop();
    // print("good");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new Place"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: "Title"),
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInputWideget(_selectImage),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 4.0,
                  color: Theme.of(context).accentColor,
                ),
              ),
              onPressed: () {
                _savePlace();
              },
              icon: Icon(Icons.add),
              label: Text("add Place"),
            ),
          )
        ],
      ),
    );
  }
}
