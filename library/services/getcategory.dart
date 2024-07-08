import '../api/api.dart';
import '../models/ProductModel.dart';

class GetCategory {
  Future<List<ProductModel>> getcategory({required String categoryName}) async {
    List<dynamic> data = await Api.get(
        url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> productList = [];
    for (int i in data) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
