import '../../../../../core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomBooksDetailsAppBar extends StatelessWidget {
  const CustomBooksDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Close',
          icon: const Icon(
            Icons.close_sharp,
            size: 28,
          ),
        ),
        IconButton(
          onPressed: () {},
          tooltip: 'Add To Cart',
          icon: Image.asset(AssetsData.cartIcon),
        ),
      ],
    );
  }
}
