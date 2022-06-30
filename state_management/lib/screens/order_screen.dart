import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';
import '../providers/orders.dart' as ord;

class OrderScreen extends StatelessWidget {

  static const routName = '/order-screen';

  Widget build(BuildContext context) {
    final _ordersData = Provider.of<ord.Orders>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return OrderItem(_ordersData.orders[index]);
        },
        itemCount: _ordersData.orders.length,
      ),
    );
  }
}
