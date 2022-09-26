
import 'package:animise_application/services/admin/banner_service.dart';
import 'package:animise_application/services/admin/product_service.dart';
import 'package:flutter/cupertino.dart';

class Notifier with ChangeNotifier {

  void deleteProductById(BuildContext context, int id) {
    ProductService service = new ProductService(context);

    service.deleteProduct(id);
  }

  void deleteBannerById(BuildContext context, int id) {
    BannerService service = new BannerService(context);

    service.deleteBanner(id);
  }

  void notify() {
    notifyListeners();
  }
}