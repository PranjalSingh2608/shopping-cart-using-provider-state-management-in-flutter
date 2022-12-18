import 'package:expense_calculator/providers/orders.dart';
import 'package:expense_calculator/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart' as oi;

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderdata = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: orderdata.orders.length,
          itemBuilder: ((context, index) => oi.OrderItem(
                order: orderdata.orders[index],
              ))),
    );
  }
}
