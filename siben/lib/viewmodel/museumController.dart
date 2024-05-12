import 'package:get/get.dart';
import 'package:siben/models/museumTitle.dart';

class MuseumController extends GetxController {
  final searchText = ''.obs;
  final museums = allMuseums.obs;

  void searchMuseum(String query) {
    searchText.value = query;
    final suggestions = allMuseums.where((museum) {
      final museumTitle = museum.title.toLowerCase();
      final input = query.toLowerCase();
      return museumTitle.contains(input);
    }).toList();
    museums.value = suggestions;
  }
}
