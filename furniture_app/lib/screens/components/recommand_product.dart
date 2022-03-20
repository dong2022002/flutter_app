import 'package:flutter/material.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/screens/components/product_card.dart';
import 'package:furniture_app/screens/details/details_screen.dart';
import 'package:furniture_app/values/size_config.dart';

class RecommandProduct extends StatelessWidget {
  const RecommandProduct({Key? key, required this.product}) : super(key: key);

  final List<Product> product;
  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;

    return Padding(
      padding: EdgeInsets.all(defaultSize! * 2),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: product.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                SizeConfig.orientation == Orientation.portrait ? 2 : 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) => ProductCard(
              product: product[index],
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(product: product[index]),
                  ),
                );
              })),
    );
  }
}
