import 'package:bevatel_task/view/resources/color_manager.dart';
import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 90,
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: ColorManager.discountColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  style: TextStyle(color: ColorManager.white),
                  children: const [
                    TextSpan(text: "A Summer Surpise\n"),
                    TextSpan(
                      text: "Cashback 20%",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 60,
          right: -20,
          child: CircleAvatar(
            radius: 90,
            backgroundColor: ColorManager.white.withOpacity(0.1),
          ),
        ),
        Positioned(
          top: 90,
          left: -20,
          child: CircleAvatar(
            radius: 150,
            backgroundColor: ColorManager.white.withOpacity(0.1),
          ),
        )
      ],
    );
  }
}
