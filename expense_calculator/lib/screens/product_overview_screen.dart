import 'package:expense_calculator/providers/product.dart';
import 'package:expense_calculator/screens/cart_screen.dart';
import 'package:expense_calculator/widgets/badge.dart';
import 'package:expense_calculator/widgets/drawer.dart';
import 'package:expense_calculator/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/products_provider.dart';
import '../widgets/productsgrid.dart';

enum FilterOptions {
  Favourites,
  All,
}

var _showOnlyFavouritesData = false;

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: ((FilterOptions value) {
                setState(() {
                  if (value == FilterOptions.Favourites) {
                    _showOnlyFavouritesData = true;
                  } else {
                    _showOnlyFavouritesData = false;
                  }
                });
              }),
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                    PopupMenuItem(
                        child: Text('Only Favourites'),
                        value: FilterOptions.Favourites),
                    PopupMenuItem(
                        child: Text('Show All'), value: FilterOptions.All)
                  ]),
          Consumer<Cart>(
              builder: (context, value, child) => Badge(
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                  ),
                  value: value.itemCount.toString())),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(showData: _showOnlyFavouritesData),
    );
  }
}
