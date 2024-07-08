import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtom extends StatelessWidget {
  CustomButtom({required this.onTap, super.key});
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text('Update',
                style: TextStyle(fontSize: 20, color: Colors.white))),
        height: 50,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.blue.shade400,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
