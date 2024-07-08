import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../models/ProductModel.dart';
import '../services/addproduct.dart';
import '../services/updateproduct.dart';
import '../widgets/custombutton.dart';
import '../widgets/customtextfield.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage({super.key});
  static String id = 'updatepage';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? title;

  String? desc;

  String? price;

  String? img;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text(
              'Update Product',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              CustomTextField(
                onChanged: (data) {
                  title = data;
                },
                hintText: 'Title',
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                onChanged: (data) {
                  desc = data;
                },
                hintText: 'Descreption',
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                onChanged: (data) {
                  price = data;
                },
                hintText: 'Price',
                type: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                onChanged: (data) {
                  img = data;
                },
                hintText: 'image',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButtom(
                onTap: () async {
                  isLoading = true;
                  setState(() {});

                  try {
                    await updateProduct(product);
                    await addproduct(product);
                    print('success');
                  } catch (e) {
                    print(e);
                  }
                  isLoading = false;
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateproduct(
        id: product.id,
        title: title == null ? product.title : title!,
        price: price == null ? product.price.toString() : price!,
        description: desc == null ? product.description : desc!,
        image: img == null ? product.image : img!,
        category: product.category);
  }

  Future<void> addproduct(ProductModel product) async {
    await AddProductService().addproduct(
        title: title == null ? product.title : title!,
        price: price == null ? product.price.toString() : price!,
        description: desc == null ? product.description : desc!,
        image: img == null ? product.image : img!,
        category: product.category);
  }
}
