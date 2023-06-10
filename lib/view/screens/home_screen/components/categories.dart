import 'package:bevatel_task/view/resources/assets_manager.dart';
import 'package:bevatel_task/view/resources/color_manager.dart';
import 'package:bevatel_task/view_model/cubit/home_bloc/home_cubit.dart';
import 'package:bevatel_task/view_model/cubit/home_bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Categorie extends StatelessWidget {
  const Categorie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Container(
          margin: const EdgeInsets.only(left: 12),
          height: 100,
          width: double.infinity,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: 18,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 70,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: ColorManager.lightPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(ImageAssets.shopIcon),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      cubit.categories[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(color: ColorManager.darkGrey),
                    )
                  ],
                ),
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: cubit.categories.length,
          ),
        );
      },
    );
  }
}
