import 'package:bookly_app/features/home/business_logic/cubit/cubit/book_cubit.dart';
import 'package:bookly_app/features/home/data/api_services/api_services.dart';
import 'package:bookly_app/features/home/data/repository/home_repo_implementation.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) =>
              BookCubit(HomeRepoImplementation(ApiServices(Dio()))),
          child: const HomeViewBody(),
        ),
      ),
    );
  }
}
