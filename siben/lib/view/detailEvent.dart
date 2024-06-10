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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: Colors.white,
            title: Text(
              widget.museum.title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            actions: [
              SpeedDial(
                childMargin: const EdgeInsets.only(left: 200),
                direction: SpeedDialDirection.down,
                backgroundColor: Colors.transparent,
                elevation: 0,
                buttonSize: const Size(50, 50),
                spacing: 4,
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
                      height: 50,
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
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Color(0xffFEB52B),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      child: ClipRRect(
                        child: Image.asset(
                          widget.museum.assetImagePath,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(top: 580),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.only(
                        top: 30,
                        left: 20,
                        right: 20,
                        bottom: 100,
                      ),
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
                ),
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
                        : widget.museum.assetAudioPath,
                  ),
                )
              : null,
        );
      },
    );
  }
}
