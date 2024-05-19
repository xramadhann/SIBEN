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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 210,
              decoration: const BoxDecoration(
                color: const Color(0xffFEB52B),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  Container(
                    margin: const EdgeInsets.only(right: 80, left: 20),
                    child: const Text(
                      "HI, Selamat datang di SiBen!",
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
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: Container(
                          height: 30,
                          margin: const EdgeInsets.all(20),
                          child: Image.asset(
                            "assets/images/filter/clothes.png",
                          ),
                        ),
                      ),
                      const Text("Pakaian"),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: Container(
                          height: 30,
                          margin: const EdgeInsets.all(20),
                          child: Image.asset(
                            "assets/images/filter/sunglasses.png",
                          ),
                        ),
                      ),
                      const Text("Aksesoris"),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: Container(
                          height: 30,
                          margin: const EdgeInsets.all(20),
                          child: Image.asset(
                            "assets/images/filter/award.png",
                          ),
                        ),
                      ),
                      const Text("Penghargaan"),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: Container(
                          height: 30,
                          margin: const EdgeInsets.all(20),
                          child: Image.asset(
                            "assets/images/filter/image-galery.png",
                          ),
                        ),
                      ),
                      const Text("Media"),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: Container(
                          height: 30,
                          margin: const EdgeInsets.all(20),
                          child: Image.asset(
                            "assets/images/filter/application.png",
                          ),
                        ),
                      ),
                      const Text("Lainnya"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                museum.assetImagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              museum.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
