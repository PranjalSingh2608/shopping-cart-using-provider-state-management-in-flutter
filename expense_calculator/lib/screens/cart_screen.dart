import 'package:expense_calculator/providers/cart.dart';
import 'package:expense_calculator/providers/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total',
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      Chip(
                        label: Text('\$${cartData.totalAmount}'),
                        backgroundColor: Colors.purple,
                      ),
                      TextButton(
                        child: Text('Order Now',
                            style: TextStyle(color: Colors.purple)),
                        onPressed: () {
                          Provider.of<Orders>(context, listen: false).addOrder(
                              cartData.items.values.toList(),
                              cartData.totalAmount);
                          cartData.clear();
                        },
                      ),
                    ],
                  ))),
          Expanded(
              child: ListView.builder(
            itemCount: cartData.itemCount,
            itemBuilder: (context, index) => ci.CartItem(
                id: cartData.items.values.toList()[index].id.toString(),
                title: cartData.items.values.toList()[index].title.toString(),
                productId: cartData.items.values.toList()[index].toString(),
                quantity:
                    cartData.items.values.toList()[index].quantity.toInt(),
                price: cartData.items.values.toList()[index].price.toDouble()),
          ))
        ],
      ),
    );
  }
}
