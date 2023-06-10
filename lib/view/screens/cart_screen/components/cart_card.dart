import 'package:bevatel_task/model/carts_model.dart';
import 'package:bevatel_task/view/resources/assets_manager.dart';
import 'package:bevatel_task/view/resources/color_manager.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  CartCard({Key? key, required this.cartsModel}) : super(key: key);
  Products cartsModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorManager.secondaryColor.withOpacity(.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                ImageAssets.bannerImage,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'product title',
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$234",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: ColorManager.primary),
                children: [
                  TextSpan(
                      text: "  x",
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: "${cartsModel.quantity}",
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
