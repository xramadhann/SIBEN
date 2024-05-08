// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:siben/detailEvent.dart';
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
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    2, // Ubah sesuai dengan jumlah kolom yang Anda inginkan
                crossAxisSpacing:
                    10, // Spasi antar item di dalam grid secara horizontal
                mainAxisSpacing:
                    10, // Spasi antar item di dalam grid secara vertikal
              ),
              itemCount: museums.length,
              itemBuilder: (context, index) {
                final museum = museums[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailEvent(museum: museum),
                    ),
                  ),
                  child: Card(
                    elevation: 3, // Elevasi kartu
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            museum.assetImagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            museum.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
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
