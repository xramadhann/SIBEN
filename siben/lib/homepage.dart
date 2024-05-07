// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:siben/viewmodels/museumTitle.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final controller = TextEditingController();

  List<Museum> museums = allMuseums;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Museum Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.amber),
                ),
              ),
              onChanged: searchMuseum,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: museums.length,
              itemBuilder: (context, index) {
                final museum = museums[index];
                return ListTile(
                  leading: Image.network(
                    museum.urlImage,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(museum.title),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void searchMuseum(String query) {
    final suggestions = allMuseums.where((museum) {
      final museumTitle = museum.title.toLowerCase();
      final input = query.toLowerCase();
      return museumTitle.contains(input);
    }).toList();
    setState(() => museums = suggestions);
  }
}
