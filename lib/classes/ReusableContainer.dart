import 'package:flutter/material.dart';

class ReusableContainer extends StatefulWidget {
  ReusableContainer(this.cor, this.cardChild, this.item, this.email);
  Color cor;
  final Widget cardChild;
  final int item;
  final String email;
  @override
  _ReusableContainerState createState() => _ReusableContainerState();
}

class _ReusableContainerState extends State<ReusableContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: widget.cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: widget.cor, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
