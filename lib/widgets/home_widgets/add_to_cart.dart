import 'package:catlog_app_by_codepur_demo/core/MyStore.dart';
import 'package:catlog_app_by_codepur_demo/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/catlog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddtoCart extends StatelessWidget {
  final Item catlog;
  const AddtoCart({
    super.key,
    required this.catlog,
  });

  // final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatlogModel _catlog = (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catlog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catlog);
        }
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(context.theme.primaryColorLight),
        shape: const MaterialStatePropertyAll(StadiumBorder()),
      ),
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
