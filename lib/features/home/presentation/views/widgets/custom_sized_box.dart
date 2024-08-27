import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({super.key, required this.precentage});
  final double precentage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height * precentage);
  }
}
