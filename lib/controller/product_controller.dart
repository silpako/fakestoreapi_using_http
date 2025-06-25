import 'package:fakestoreapi_using_http/service/httpservice.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool isLoading = true.obs; // observable value
  var productList = [].obs;

  @override
  void onInit() {
    readProducts();
    super.onInit();
  }

  void readProducts() async {
    try {
      isLoading(true);
      var product = await HttpService.fetchProduct();
      productList.value = product;
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
