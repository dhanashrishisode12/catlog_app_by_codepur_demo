import 'package:catlog_app_by_codepur_demo/models/catlog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/MyStore.dart';

class CartModel {
  // this lines use for singleton object
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;
  // singleton last line

  // catalog field
  late CatlogModel _catalog;

//Collectoin of IDs - store ID's of each items
  final List<int> _itemIds = [];

//get catalog
  CatlogModel get catalog => _catalog;

// set catalog
  set catalog(CatlogModel newCatalog) {
    // assert(newCatalog != null);
    _catalog = newCatalog;
  }

// get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

// get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // remove item
//   void remove(Item item) {
//     _itemIds.remove(item.id);
//   }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
    //  store.cart._itemIds.add(item.id);
  }
}


class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }

}
