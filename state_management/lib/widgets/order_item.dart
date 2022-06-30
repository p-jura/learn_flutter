import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem orderItemData;

  // ignore: use_key_in_widget_constructors
  const OrderItem(this.orderItemData);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$ ${widget.orderItemData.amount}'),
            subtitle: Text(
              DateFormat('dd.MM.yyyy').format(widget.orderItemData.dateTime),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.all(10),
              height: min(widget.orderItemData.products.length * 20 + 100, 180),
              child: ListView(
                children: widget.orderItemData.products
                    .map(
                      (element) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            element.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '${element.quantity} x\$ ${element.price}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
