import 'package:get/get.dart';

class DetailEventController extends GetxController {
  var currentSubtitle = ''.obs;
  var currentAudio = ''.obs;

  void changeSubtitle(String subtitle, String audio) {
    currentSubtitle.value = subtitle;
    currentAudio.value = audio;
  }
}
