import 'package:bookly_app/core/utils/stayles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/horizontal_list_view_of_books_item.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CustomAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ),
          const HorizontalListViewOfBooksItem(),
          const SliverToBoxAdapter(child: SizedBox(height: 49)),
          SliverToBoxAdapter(
            child: Text('Best Seller',
                style:
                    Styles.textStyle18.copyWith(fontWeight: FontWeight.w600)),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          const BestSellerListView()
        ],
      ),
    );
  }
}
