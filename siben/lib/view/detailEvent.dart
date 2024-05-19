import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:siben/models/museumTitle.dart';
import 'package:siben/view/widget/audioControler.dart';
import 'package:siben/viewmodel/detailEventController.dart';

class DetailEvent extends StatefulWidget {
  const DetailEvent({Key? key, required this.museum}) : super(key: key);
  final Museum museum;

  @override
  State<DetailEvent> createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
  bool isControlsVisible = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailEventController>(
      init: DetailEventController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.museum.title,
              style: const TextStyle(fontSize: 14),
            ),
            actions: [
              SpeedDial(
                direction: SpeedDialDirection.down,
                backgroundColor: Colors.transparent,
                elevation: 0,
                buttonSize: const Size(50, 50),
                spacing: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                children: [
                  SpeedDialChild(
                    child: Image.asset(
                      "assets/images/indonesia.png",
                      height: 50,
                    ),
                    label: 'Indonesian',
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    labelStyle: const TextStyle(fontSize: 14),
                    onTap: () => controller.changeSubtitle(
                      widget.museum.subtitle,
                      widget.museum.assetAudioPath,
                    ),
                  ),
                  SpeedDialChild(
                    child: Image.asset(
                      "assets/images/united-kingdom.png",
                      height: 40,
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    label: 'English',
                    labelStyle: const TextStyle(fontSize: 14),
                    onTap: () => controller.changeSubtitle(
                      widget.museum.subtitle2,
                      widget.museum.assetAudioPath2,
                    ),
                  ),
                  SpeedDialChild(
                    child: Image.asset(
                      "assets/images/china.png",
                      height: 50,
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    label: 'Mandarin',
                    labelStyle: const TextStyle(fontSize: 14),
                    onTap: () => controller.changeSubtitle(
                      widget.museum.subtitle3,
                      widget.museum.assetAudioPath3,
                    ),
                  ),
                ],
                child: const Row(
                  children: [
                    Icon(Icons.translate, color: Color(0xffFEB52B)),
                    Icon(Icons.arrow_drop_down_outlined,
                        color: Color(0xffFEB52B)),
                  ],
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  widget.museum.assetImagePath,
                  height: 250,
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    height: 600,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(25),
                    child: Obx(
                      () => Text(
                        controller.currentSubtitle.value.isNotEmpty
                            ? controller.currentSubtitle.value
                            : widget.museum.subtitle,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ),
                // Add other content here
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                isControlsVisible = !isControlsVisible;
              });
            },
            child: const Icon(Icons.volume_up),
          ),
          bottomNavigationBar: isControlsVisible
              ? Obx(
                  () => AudioControls(
                      audioPath: controller.currentAudio.value.isNotEmpty
                          ? controller.currentAudio.value
                          : widget.museum.assetAudioPath),
                )
              : null,
        );
      },
    );
  }
}
