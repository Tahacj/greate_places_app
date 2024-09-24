import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/great_places.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: <Widget>[
          IconButton(
            onPressed: (() {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            }),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        builder: (context, places, ch) => places.items.length <= 0
            ? ch
            : ListView.builder(
                itemCount: places.items.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(places.items[index].image),
                  ),
                  title: Text(places.items[index].title),
                  onTap: () {
                    null;
                  },
                ),
              ),
        child: Text("got no placses yet!\n start adding some"),
      ),
    );
  }
}
