import '../../../../../constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/assets.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsData.logo,
            width: 75.sp,
            height: 16.1.sp,
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, searchView);
              },
              tooltip: 'Search',
              icon: const Icon(FontAwesomeIcons.magnifyingGlass))
        ],
      ),
    );
  }
}
