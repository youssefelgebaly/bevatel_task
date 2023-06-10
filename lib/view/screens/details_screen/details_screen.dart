import 'package:bevatel_task/view/resources/color_manager.dart';
import 'package:bevatel_task/view_model/cubit/home_bloc/home_cubit.dart';
import 'package:bevatel_task/view_model/cubit/home_bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/default_button.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/rounded_container.dart';
import 'components/color_cards.dart';
import 'components/product_description.dart';
import 'components/product_images.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.id});

  String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getSingleProductiesData(id: id),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            backgroundColor: ColorManager.lightGray,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(AppBar().preferredSize.height),
                child: cubit.productsModel != null
                    ? CustomAppBar(rating: cubit.productsModel!.rating!.rate)
                    : const SizedBox()),
            body: cubit.productsModel != null
                ? ListView(
                    children: [
                      ProductImages(product: cubit.productsModel!),
                      RoundedContainer(
                        color: Colors.white,
                        child: Column(
                          children: [
                            ProductDescription(
                              product: cubit.productsModel!,
                            ),
                            RoundedContainer(
                              color: const Color(0xFFF6F7F9),
                              child: Column(
                                children: const [
                                  ColorCards(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Center(
                    child:
                        CircularProgressIndicator(color: ColorManager.primary),
                  ),
            bottomNavigationBar: Container(
              margin: const EdgeInsets.only(top: 0),
              padding: const EdgeInsets.only(top: 15),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: DefaultButton(
                  text: "Add To Cart",
                  press: () {},
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
