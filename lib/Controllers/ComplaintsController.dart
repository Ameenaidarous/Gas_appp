import 'package:flutter/material.dart';
import 'package:gas_app/model/iteam.dart';
import 'package:get/get.dart';



class ComplaintsController extends GetxController {
  var isLoading = true.obs;
  var complaints = <Complaint>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchComplaints();
  }

  void fetchComplaints() async {
    try {
      isLoading.value = true;
      //TODO: قم بجلب الشكاوي من الخادم هنا

      // هذا مثال بسيط على كيفية جلب البيانات من الخادم
      await Future.delayed(Duration(seconds: 2));

      complaints.assignAll([
        Complaint(
          'شكوى رقم 1',
          'وصف الشكوى رقم 1',
        ),
        Complaint(
          'شكوى رقم 2',
          'وصف الشكوى رقم 2',
        ),
        Complaint(
          'شكوى رقم 3',
          'وصف الشكوى رقم 3',
        ),
        Complaint(
          'شكوى رقم 4',
          'وصف الشكوى رقم 4', 
        ),
      ]);
    } finally {
      isLoading.value = false;
    }
  }

  void deleteComplaint(Complaint complaint) {
    complaints.remove(complaint);
  }
}


class MyController extends GetxController {
  final scrollController = ScrollController().obs;
  final currentPage = 0.obs;
  final itemsPerPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    itemsPerPage.value = 10;
    scrollController.value.addListener(() {
      final newPageIndex =
          (scrollController.value.offset / (100 / itemsPerPage.value)).floor();
      if (newPageIndex != currentPage.value) {
        currentPage.value = newPageIndex;
      }
    });
  }
}