import 'package:flutter/material.dart';

typedef ProduceOrderCountCallback = void Function(int orderCount);

class ProductOrderCount extends StatefulWidget {
  final ProduceOrderCountCallback callback;
  const ProductOrderCount({super.key, required this.callback});

  @override
  State<ProductOrderCount> createState() => _ProductOrderCountState();
}

class _ProductOrderCountState extends State<ProductOrderCount> {
  int _orderCount = 1;

  void _increaseOrder() {
    setState(() {
      _orderCount++;
      widget.callback(_orderCount);
    });
  }

  void _decreaseOrder() {
    setState(() {
      if (_orderCount > 1) {
        _orderCount--;
      }

      widget.callback(_orderCount);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: Colors.green),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RoundedIconButton(icon: Icons.remove, onPressed: _decreaseOrder, iconSize: 20),
          Text('$_orderCount', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
          RoundedIconButton(icon: Icons.add, onPressed: _increaseOrder, iconSize: 20)
        ],
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      required this.iconSize});

  final IconData icon;
  final Function() onPressed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: iconSize, height: iconSize),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(iconSize * 0.1)),
      fillColor: Colors.blueAccent,
      onPressed: onPressed,
      child: Icon(icon, size: iconSize * 0.8,),
    );
  }
}
