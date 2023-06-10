import 'package:bevatel_task/view/screens/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../widgets/icon_btn_with_counter.dart';
import '../../../widgets/route.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 210,
            decoration: BoxDecoration(
              color: ColorManager.secondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const TextField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  border: InputBorder.none,
                  hintText: "Search product",
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          IconBtnWithCounter(
            svgSrc: ImageAssets.cartIcon,
            press: () => navigator(context, const CartScreen()),
          ),
          IconBtnWithCounter(
            svgSrc: ImageAssets.bell,
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
