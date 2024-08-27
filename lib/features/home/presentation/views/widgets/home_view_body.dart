import 'package:bookly_app/features/home/presentation/views/widgets/custom_sized_box.dart';

import '../../../../../core/utils/stayles.dart';
import 'newest_books_list_view.dart';
import 'custom_appbar.dart';
import 'featured_books_list_view.dart';
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
          const CustomHomeAppBar(),
          const SliverToBoxAdapter(
            child: CustomSizedBox(precentage: .02),
          ),
          const SliverToBoxAdapter(
            child: FeaturedBooksListView(height: .28),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 35),
          ),
          SliverToBoxAdapter(
            child: Text('Newest books',
                style:
                    Styles.textStyle18.copyWith(fontWeight: FontWeight.w600)),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          const SliverFillRemaining(
            child: NewestBooksListView(),
          ),
        ],
      ),
    );
  }
}
