import 'package:flutter/material.dart';
import 'package:gas_app/Static/ColorNam.dart';
import 'package:get/get.dart';

import '../Controllers/Search_controller.dart';


class SearchBarDelegate extends SearchDelegate<String> {
  final SearchController searchController;

  SearchBarDelegate(this.searchController);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Obx(() {
      if (searchController.isSearching.value) {
        return Center(child: CircularProgressIndicator());
      } else if (searchController.searchResults.isEmpty) {
        return Center(child: Text('No results found'));
      } else {
        return ListView.builder(
          itemCount: searchController.searchResults.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(searchController.searchResults[index]),
              onTap: () {
                close(context, searchController.searchResults[index]);
              },
            );
          },
        );
      }
    }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(

      color: ColorName.colobeginBackgraoundLogin,
    );
  }
}