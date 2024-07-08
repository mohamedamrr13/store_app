import '../api/api.dart';

class GetAllCategories {
  Future<List<String>> getallcategories() async {
    List<String> data =
        await Api.get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
