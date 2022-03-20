import 'package:flutter/material.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/screens/details/components/product_description.dart';
import 'package:furniture_app/screens/details/components/product_info.dart';
import 'package:furniture_app/values/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight! - AppBar().preferredSize.height,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductInfo(product: product),
            Positioned(
              top: defaultSize * 30.5,
              left: 0,
              right: 0,
              child: ProductDescriotion(press: (() {}), product: product),
            ),
            Positioned(
                top: defaultSize * 9.5,
                right: -defaultSize * 4.5,
                child: Hero(
                  tag: product.id,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                    height: defaultSize * 35.8,
                    width: defaultSize * 33.4,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
