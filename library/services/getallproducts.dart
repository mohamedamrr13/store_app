import '../api/api.dart';
import '../models/ProductModel.dart';

class Allproducts {
  static Future<List<ProductModel>> getallproducts() async {
    List data = await Api.get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> products = [];
    for (int i = 0; i < data.length; i++) {
      products.add(ProductModel.fromJson(data[i]));
    }
    return products;
  }
}
