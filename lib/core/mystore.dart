import 'package:velocity_x/velocity_x.dart';
import 'package:catlog_app_by_codepur_demo/models/cart.dart';
import 'package:catlog_app_by_codepur_demo/models/catlog.dart';

class MyStore extends VxStore {
  late CatlogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatlogModel();
    cart = CartModel();
     cart.catalog = catalog;
  }
}
