import 'package:flutter/material.dart';
import 'package:siben/detailEvent.dart';
import 'package:siben/viewmodels/museumTitle.dart';
import 'package:number_pagination/number_pagination.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final controller = TextEditingController();

  List<Museum> museums = allMuseums;
  int itemsPerPage = 10; // Jumlah museum per halaman
  int currentPage = 1;
  int get numberOfPages => (museums.length / itemsPerPage).ceil();

  @override
  Widget build(BuildContext context) {
    var startIndex = (currentPage - 1) * itemsPerPage;
    var endIndex = startIndex + itemsPerPage;
    endIndex = endIndex > museums.length ? museums.length : endIndex;

    // Pastikan terdapat setidaknya satu item yang ditampilkan
    if (startIndex >= museums.length) {
      startIndex = museums.length - 1;
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Museum Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.amber),
                ),
              ),
              onChanged: searchMuseum,
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final museumIndex = startIndex + index;
                      final museum = museums[museumIndex];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailEvent(museum: museum),
                          ),
                        ),
                        child: Card(
                          elevation: 3,
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
                                  style: const TextStyle(
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
                    childCount: endIndex - startIndex,
                  ),
                ),
              ],
            ),
          ),
          NumberPagination(
            pageTotal: numberOfPages,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            pageInit: currentPage,
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
    setState(() {
      museums = suggestions;
      currentPage = 1; // Kembali ke halaman pertama setiap kali mencari
    });
  }
}
