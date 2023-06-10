import 'package:bevatel_task/view/resources/assets_manager.dart';
import 'package:bevatel_task/view/resources/color_manager.dart';
import 'package:bevatel_task/view_model/cubit/home_bloc/home_cubit.dart';
import 'package:bevatel_task/view_model/cubit/home_bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/categories.dart';
import 'components/discount_banner.dart';
import 'components/header.dart';
import 'components/popular_product.dart';
import 'components/special_offers.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getCategoriesData()
        ..getProductiesData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            body: cubit.categories.isNotEmpty
                ? SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          const Header(),
                          const SizedBox(height: 10),
                          const DiscountBanner(),
                          const Categorie(),
                          const SizedBox(height: 10),
                          const SpecialOffers(),
                          const SizedBox(height: 30),
                          PopularProducts(),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child:
                        CircularProgressIndicator(color: ColorManager.primary),
                  ),
            bottomNavigationBar: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, -15),
                      blurRadius: 20,
                      color: Colors.grey[300]!.withOpacity(0.5),
                    ),
                  ],
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(ImageAssets.shopIcon),
                            point()
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(ImageAssets.heartIcon),
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(ImageAssets.chatBubbleIcon),
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(ImageAssets.userIcon),
                        ],
                      ),
                    ])),
          );
        },
      ),
    );
  }

  Widget point() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: CircleAvatar(
        backgroundColor: ColorManager.primary,
        radius: 2,
      ),
    );
  }
}
