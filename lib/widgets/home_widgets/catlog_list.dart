import 'package:catlog_app_by_codepur_demo/pages/home_page_detail.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catlog.dart';
import '../themes.dart';
import 'add_to_cart.dart';
import 'catlog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatlogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatlogModel.items[index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePageDetail(catalog: catalog),
              ),
            ),
            child: CatlogItem(catalog: catalog),
          );
        });
  }
}

class CatlogItem extends StatelessWidget {
  final Item catalog;

  const CatlogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatlogImage(image: catalog.image),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                catalog.name.text.lg
                    .color(MyThemes.darkBluisColor)
                    .bold
                    .make()
                    .p16(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    AddtoCart(catlog: catalog),
                  ],
                ).pOnly(right: 8.0)
              ],
            ),
          ),
        ],
      ),
    )
        .color(context.theme.cardColor)
        .rounded
        .square(150)
        .make()
        .py12()
        .wHalf(context);
  }
}


