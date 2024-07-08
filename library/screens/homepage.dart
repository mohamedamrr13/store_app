import 'package:flutter/material.dart';
import '../models/ProductModel.dart';
import '../services/getallproducts.dart';
import '../widgets/customcard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.shopping_cart),
            ),
          ],
          backgroundColor: Colors.white,
          title: const Padding(
            padding: EdgeInsets.only(left: 45),
            child: Center(child: Text('Dashboard')),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16.0, top: 75),
            child: FutureBuilder<List<ProductModel>>(
              future: Allproducts.getallproducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel> products = snapshot.data!;
                  return GridView.builder(
                      itemCount: products.length,
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.3,
                              mainAxisSpacing: 100,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, i) {
                        return CustomCard(products[i]);
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )));
  }
}
