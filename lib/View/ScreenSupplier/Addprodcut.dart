import 'package:flutter/material.dart';
import 'package:gas_app/Model/CURD.dart';
import 'package:gas_app/Model/iteam.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/Static/ColorNam.dart';
import 'package:gas_app/Widgets/Dailog.dart';
import 'package:gas_app/model/iteam.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Controllers/Supplier_controller.dart';
import '../../RepatFunction/ScreenSizes.dart';
import '../../Static/TextNames.dart';
import '../../Widgets/Counter.dart';
import '../../Widgets/TextFiled1.dart';
import 'Mangamment_product.dart';

class AddProductPage extends StatelessWidget {
  ProductController productController = Get.put(ProductController());
  final idController = TextEditingController();
  final productnnamecontroller = TextEditingController();
  final descriptionController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();
  final imageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f8),
      appBar: AppBar(
        title: Text('اضافة منتج',style: TextStyle(color: Colors.white),),
        backgroundColor: ColorName.colorblue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: perWidth(context, whidth:8,)
              ),
            child: Column(
              children: [
                InkWell(onTap: () {
                  productController.getImage1(ImageSource.camera, context);
                }, child: GetBuilder<ProductController>(
                  builder: (controller) {
                    return Container(
                      width: 200,
                      height: 200,
                      color: Colors.white,
                        child: productController.imageFile == null
                            ? Icon(Icons.camera_alt)
                            : Image.file(productController.imageFile!));
                  },
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Textfiled(
                    filedControl: productnnamecontroller,
                    obsText: false,
                    inputType: TextInputType.text,
                    labelText: TextNames.productName,
                    valid: ((p0) {}),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Textfiled(
                    filedControl: descriptionController,
                    obsText: false,
                    inputType: TextInputType.streetAddress,
                    labelText: TextNames.descriptionProduct,
                    valid: ((p0) {}),
                  ),
                ),
               
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Textfiled(
                    filedControl: priceController,
                    obsText: false,
                    inputType: TextInputType.number,
                    labelText: TextNames.pricename,
                    valid: (p0) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Counter(
                      isCounter: false,
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    elevation: 15,
                    padding: EdgeInsets.symmetric(horizontal: 150,vertical: 10),
                    color: ColorName.colorblue,
                    shape:RoundedRectangleBorder( borderRadius: BorderRadius.circular(25),),
                    child: Text('اضافة',style: TextStyle(fontSize: 22,color: Colors.white),),
                    onPressed: () async {
                      
                      final Curd mycurd = Get.find();
                      if(productController.filedControl.value == 0){
                        return AlertDialog1(content: "يرجى اضافة الكمية");
                      }
                      if (productController.imageFile != null) {
                        var x =  await mycurd.postimagefile(
                            AddProductApi,
                            {
                              "productName": productnnamecontroller.text,
                              "description": descriptionController.text,
                              "price": priceController.text,
                              "quntity": productController.filedControl.value.toString(),
                              "suppId":  "1"
                            },
                            productController.imageFile!,
                            "productImage");
                        
                        if (x) {
                          productnnamecontroller.clear();
                          priceController.clear();
                          descriptionController.clear();
                          productController.clearImage();
                          productController.filedControl.value = 0;
                          productController.getDataProducts("1");
                          AlertDialog1(title: "تم اضافة منتج بنجاح",content: "", iconData: Icons.check_sharp,);
                          
                          //كتب اي رسالة او تنقل الى صفحه ثانية
                          await Future.delayed(Duration(seconds: 2));
                          Navigator.pop(context);
      
                          Get.offNamed("/ManageProductsPage");
                        }
                      } else {
                        AlertDialog1(title: "",content: "لاتوجد صورة");
                       
                      }
                      //Get.back();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
