import 'package:fakestoreapi_using_http/model/product_model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<List<ProductModel>> fetchProduct() async {
    var response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),   // read all the product from api
    );
    if (response.statusCode == 200) {
      var data = response.body;
      return productModelFromJson(data);
    } else {
      throw Exception();
    }
  }
}
