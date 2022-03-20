import 'package:flutter/material.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/values/app_color.dart';
import 'package:furniture_app/values/size_config.dart';

class ProductDescriotion extends StatelessWidget {
  const ProductDescriotion({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);
  final VoidCallback press;

  final Product product;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;

    return Container(
      constraints: BoxConstraints(minHeight: defaultSize * 44),
      padding: EdgeInsets.only(
        top: defaultSize * 9,
        left: defaultSize * 2,
        right: defaultSize * 2,
      ),
      // height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(defaultSize * 1.2),
          topLeft: Radius.circular(defaultSize * 1.2),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.subTitle,
              style: TextStyle(
                fontSize: defaultSize * 1.8,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: defaultSize * 3),
            Text(
              product.description,
              style: TextStyle(
                color: AppColor.kTextColor.withOpacity(0.7),
                height: 1.5,
              ),
            ),
            SizedBox(height: defaultSize * 3),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColor.kPrimaryColor,
              ),
              child: TextButton(
                onPressed: press,
                child: const Text(
                  'Add to cart',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
