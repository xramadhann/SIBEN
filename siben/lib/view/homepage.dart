// ignore_for_file: unnecessary_import, unnecessary_const

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:siben/view/detailEvent.dart';
import 'package:siben/viewmodel/museumController.dart';

class Homepage extends StatelessWidget {
  final MuseumController _controller = Get.put(MuseumController());

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Column(
          children: <Widget>[
            Container(
              height: 210,
              decoration: BoxDecoration(
                color: Colors.orange[300],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  Container(
                    margin: const EdgeInsets.only(right: 80),
                    child: const Text(
                      "HI, Selamat datang di siben!",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
                    child: SearchBar(
                      hintText: "Search",
                      onChanged: _controller.searchMuseum,
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 15),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      leading: const Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 120,
              width: 500,
              child: Row(
                children: [
                  Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: Container(
                          margin: const EdgeInsets.all(35),
                        ),
                      ),
                      Text("data 1"),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: Container(
                          margin: const EdgeInsets.all(35),
                        ),
                      ),
                      Text("data 1"),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: Container(
                          margin: const EdgeInsets.all(35),
                        ),
                      ),
                      Text("data 1"),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: Container(
                          margin: const EdgeInsets.all(35),
                        ),
                      ),
                      Text("data 1"),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 13 / 16,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: _controller.museums.length,
                  itemBuilder: (context, index) {
                    final museum = _controller.museums[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailEvent(museum: museum),
                        ),
                      ),
                      child: Card(
                        elevation: 1,
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
                              padding: const EdgeInsets.all(10),
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
