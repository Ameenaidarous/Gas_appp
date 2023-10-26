import 'package:get/get.dart';


class SearchController extends GetxController {
  var isSearching = false.obs;
  var searchResults = <String>[].obs;

  void search(String query) async {
    isSearching.value = true;
    await Future.delayed(Duration(seconds: 1)); // لتمثيل البحث

    // قم بإجراء عملية البحث هنا وتحديث searchResults
    searchResults.assignAll(['Result 1', 'Result 2', 'Result 3']);

    isSearching.value = false;
  }
}