import 'package:get/get.dart';

class DetailEventController extends GetxController {
  var currentSubtitle = ''.obs;

  void changeSubtitle(String subtitle) {
    currentSubtitle.value = subtitle;
  }
}
