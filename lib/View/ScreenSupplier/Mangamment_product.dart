import 'package:flutter/material.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/Static/ColorNam.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:gas_app/View/ScreenSupplier/Edit_Product.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Controllers/Supplier_controller.dart';
import '../../Static/TextNames.dart';
import '../../Widgets/Counter.dart';
import '../../model/iteam_list.dart';
import 'Addprodcut.dart';
class ManageProductsPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final quantityController = TextEditingController();
  static bool b = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xfff6f6f8),
      appBar: AppBar(
        title: Text('ادارة منتجات',style: TextStyle(fontSize: 25,color: Colors.white),),
        backgroundColor: Color(0xff528fbc), 
        centerTitle: true,
      ),
      floatingActionButton:FloatingActionButton(
        backgroundColor: Color(0xff528fbc),
        
        onPressed: (){
           Get.to(AddProductPage());
        },child: Icon(Icons.add,size: 30,color: Colors.white,),
        
        ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<ProductController>(
              
              builder: ((controller){
                if(productController.statusRequest == StatusRequest.lodaing){
                    return Center(child: Card(
                      elevation: 25,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      child: CircularProgressIndicator(
                        color: ColorName.colorblue,
                      ),
                    ),);
                }
                
                else if(productController.statusRequest == StatusRequest.faliure){
                  return Center(child: Icon(Icons.filter_list_outlined),);
                }else{
                return ListView.builder(
                itemCount:productController.listProducts.length,
                itemBuilder: (context, index) {
                  
                  return Padding(
                    padding: const EdgeInsets.all(9),
                    child: Card(
                      elevation:20,
                      color:Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),                    
                      child: Row(children: [
                    Container(child:  productController.listProducts[index].image != null? Image.asset("Assets/imagess/12.png",width: 100,height: 120,fit: BoxFit.fill,) :Icon(Icons.production_quantity_limits),),
                     Expanded(
                        flex: 2,  
                        child:Row(
                          children: [
                             
                            Expanded(
                              flex: 2,
                              child: ListTile(
                                title:Text("${productController.listProducts[index].name}",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                                
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                   
                                        Text("${productController.listProducts[index].description}",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                                     
                                    Row(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                          
                                         
                                          Text(TextNames.quantityname,style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                                           Text("${productController.listProducts[index].quantity}",style: TextStyle(fontSize: 22,color: Colors.black),),
                                        ],
                                        ),
                                        
                                      ],
                                    ),
                                    SingleChildScrollView(
                                      ///scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                        Row(children: [
                                          
                                           
                                            Text(TextNames.pricename,style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
                                            Text("${productController.listProducts[index].price}",style: TextStyle(fontSize: 20,color: Colors.black),),
                                        ],
                                        ),
                                        
                                      ],
                                      ),
                                    )
                                
                                  ],
                                ),
                            
                              ),
                            ),
                          ],
                        )
                        ),
                        Expanded(flex: 0,child: 
                        
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              GestureDetector(onTap: () {
                                EditProductPage.indexProduct = index;
                                Get.to(EditProductPage());
                                ManageProductsPage.b = true;
                              },child: Icon(Icons.edit)),
                              GestureDetector(onTap: () {
                                EditProductPage.indexProduct = index;
                                productController.deleteProduct(productController.listProducts[index].id.toString(),);
                                
                              },child: Icon(Icons.delete,color: Colors.red,)),
                            ],
                          ),
                        )),
                      ],
                      ),
                      
                    ),
                  );
                },
              );}}),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: ElevatedButton(
          //     child: Text('Add Product'),
          //     onPressed: () {
          //      Get.to(AddProductPage());
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}