import 'dart:convert';

import 'package:catlog_app_by_codepur_demo/core/MyStore.dart';
import 'package:catlog_app_by_codepur_demo/models/cart.dart';
import 'package:catlog_app_by_codepur_demo/models/catlog.dart';
import 'package:catlog_app_by_codepur_demo/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catlog_header.dart';
import '../widgets/home_widgets/catlog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  final int days = 30;
  final String name = "codepur";
  //Called when this object is inserted into the tree.
  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  loadJsonData() async {
    await Future.delayed(const Duration(seconds: 2));

    var catalogJson = await rootBundle.loadString("assets/files/catlog.json");
    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;

    final decodedData = jsonDecode(catalogJson);
    var products = decodedData["products"];
    CatlogModel.items = List.from(products)
        .map<Item>((product) => Item.fromMap(product))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // final dummyList = List.generate(20, (index) => CatlogModel.items[0]);
    return Scaffold(
      // velocity use kel asel tr as use kru shkto
      backgroundColor: context.canvasColor,

      // jr velocityX use nahi kel tr  backgroundColor as anta yeil
      // backgroundColor: Theme.of(context).cardColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, _, _HomePageState) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.primaryColorLight,
          // backgroundColor: context.theme.buttonColor,
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Vx.red500,
            size: 20,
            count: _cart.items.length,
            // count: _cart.items.length,
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, color: Vx.black)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatlogHeader(),
              (CatlogModel.items.isNotEmpty)
                  ? const CatalogList().expand()
                  : const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
