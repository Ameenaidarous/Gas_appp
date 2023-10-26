
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/EditAccountController.dart';
import '../../Controllers/counsumerController.dart';
import '../../Static/Applink.dart';

class EditAccount extends StatelessWidget {
  final cardController = Get.put(AccountController());
  ControllerCounsumer counsumer = Get.put(ControllerCounsumer());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f8),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              color: Color(0xff0b1b32),
              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage("$imageDocLink/${counsumer.coustmerModel!.imageProfle}"),
                      
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Change Profile Picture'),
                              // Add more content here as needed
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    // Handle the action, e.g. by closing the dialog
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Save'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 110, left: 70),
                          child: CircleAvatar(  radius:40,backgroundColor: Colors.red, child: Icon(Icons.camera_alt, size: 30, color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350, left: 5, right: 5),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Obx(() => Text(cardController.data.value)),
                      leading: Icon(Icons.person, size: 20),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          cardController.changeData();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                      title: Obx(() => Text(cardController.data1.value)
                      ),
                      leading: Icon(Icons.phone, size: 20),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          cardController.changeData();
                        },
                      ),
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                      title: Obx(() => Text(cardController.data2.value)),
                      leading: Icon(Icons.location_on, size: 20),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          cardController.changeData();
                        },
                      ),
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}