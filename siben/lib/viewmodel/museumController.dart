import 'package:get/get.dart';
import 'package:siben/models/museumTitle.dart';

class MuseumController extends GetxController {
  final searchText = ''.obs;
  final museums = allMuseums.obs;
  RxString selectedCategory = ''.obs;

  void searchMuseum(String query) {
    searchText.value = query;
    final suggestions = allMuseums.where((museum) {
      final museumTitle = museum.title.toLowerCase();
      final input = query.toLowerCase();
      return museumTitle.contains(input);
    }).toList();
    museums.value = suggestions;
  }

  void filterByCategory(String category) {
    if (selectedCategory.value == category) {
      selectedCategory.value = '';
      museums.value = allMuseums;
    } else {
      selectedCategory.value = category;
      final filteredMuseums = allMuseums.where((museum) {
        return museum.category.toLowerCase().contains(category.toLowerCase());
      }).toList();
      museums.value = filteredMuseums;
    }
  }
}
