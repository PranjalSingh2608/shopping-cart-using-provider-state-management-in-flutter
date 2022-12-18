import 'package:expense_calculator/providers/cart.dart';
import 'package:expense_calculator/providers/orders.dart';
import 'package:expense_calculator/providers/products_provider.dart';
import 'package:expense_calculator/screens/cart_screen.dart';
import 'package:expense_calculator/screens/order_screen.dart';
import 'package:expense_calculator/screens/product_detail.dart';
import 'package:expense_calculator/screens/product_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override 
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => Products()),
        ChangeNotifierProvider(create:(context) => Cart()),
        ChangeNotifierProvider(create: ((context) => Orders())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName:((context) => ProductDetailScreen()),
          CartScreen.routeName:(context) => CartScreen(),
          OrderScreen.routeName:(context) => OrderScreen(),
        },
      ),
    );
  }
}
