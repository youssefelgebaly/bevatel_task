import 'package:bevatel_task/view/resources/assets_manager.dart';
import 'package:bevatel_task/view/resources/color_manager.dart';
import 'package:bevatel_task/view/screens/details_screen/details_screen.dart';
import 'package:bevatel_task/view_model/cubit/home_bloc/home_cubit.dart';
import 'package:bevatel_task/view_model/cubit/home_bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/route.dart';
import '../../../widgets/section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SectionTitle(title: "Popular Products", press: () {}),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: 140,
                      child: GestureDetector(
                        onTap: () {
                          navigator(
                              context,
                              DetailsScreen(
                                id: cubit.products![index].id.toString(),
                              ));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 1.02,
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: ColorManager.secondaryColor
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.network(
                                    cubit.products![index].image.toString()),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              cubit.products![index].title.toString(),
                              style: TextStyle(color: ColorManager.black),
                              maxLines: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${cubit.products![index].price}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: ColorManager.primary,
                                  ),
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                      color: ColorManager.lightPrimary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                        ImageAssets.heartIcon,
                                        color: ColorManager.red),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: cubit.products!.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
