
import 'package:animise_application/services/admin/product_service.dart';
import 'package:flutter/cupertino.dart';

class Notifier with ChangeNotifier {

  void deleteProductById(BuildContext context, int id) {
    ProductService service = new ProductService(context);
    service.deleteProduct(id);
  }

  void notify() {
    notifyListeners();
  }
}