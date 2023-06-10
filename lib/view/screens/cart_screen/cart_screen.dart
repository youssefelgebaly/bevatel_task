import 'package:bevatel_task/view/resources/color_manager.dart';
import 'package:bevatel_task/view_model/cubit/home_bloc/home_cubit.dart';
import 'package:bevatel_task/view_model/cubit/home_bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import 'components/cart_card.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: ColorManager.darkGrey,
            )),
        backgroundColor: ThemeData().scaffoldBackgroundColor,
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "4 items",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => HomeCubit()..getCartsData(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return cubit.cartsModel != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      itemCount: cubit.cartsModel!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Dismissible(
                          key: const Key('1'),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {},
                          background: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: ColorManager.lightPrimary.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                const Spacer(),
                                SvgPicture.asset(ImageAssets.trash),
                              ],
                            ),
                          ),
                          child: CartCard(
                              cartsModel:
                                  cubit.cartsModel![index].products![index]),
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  );
          },
        ),
      ),
      bottomNavigationBar: const CheckoutCard(),
    );
  }
}
