import 'package:shopex/core/api/product.api.dart';
import 'package:shopex/meta/views/home_view/home.exports.dart';

class ProductNotifier extends ChangeNotifier {
  final ProductAPI _productAPI = new ProductAPI();

  Future getProducts() async {
    try {
      var products = await _productAPI.getProducts();
      return products;
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  Future loadProductDetails({@required dynamic productID}) async {
    try {
      var products = await _productAPI.loadProductDetails(productID: productID);
      print(products);
      return products;
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }
}
