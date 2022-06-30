import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../widgets/cart_Item.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Spacer(),
                  Chip(
                    backgroundColor: Colors.purple,
                    label: Text('\$ ${cart.totalAmmount.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.headline5),
                  ),
                  FlatButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(), cart.totalAmmount);
                      cart.clear();    
                    },
                    child: Text(
                      'ORDER NOW',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, count) {
                return CartItemList(
                  cartItemId: cart.items.values.toList()[count].id,
                  productId: cart.items.keys.toList()[count],
                  price: cart.items.values.toList()[count].price,
                  quantity: cart.items.values.toList()[count].quantity,
                  title: cart.items.values.toList()[count].title,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
