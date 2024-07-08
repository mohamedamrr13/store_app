import '../api/api.dart';
import '../models/ProductModel.dart';

class UpdateProductService {
  Future<ProductModel> updateproduct(
      {required int id,
      required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
      },
      token: null,
    );
    return ProductModel.fromJson(data);
  }
}
