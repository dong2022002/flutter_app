import 'package:flutter/material.dart';
import 'package:furniture_app/components/title_text.dart';
import 'package:furniture_app/models/categories.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/screens/components/categories.dart';
import 'package:furniture_app/screens/components/recommand_product.dart';
import 'package:furniture_app/services/fetch_categories.dart';
import 'package:furniture_app/services/fetch_products.dart';
import 'package:furniture_app/values/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(defaultSize! * 2),
              child: const TitleText(
                title: 'Browse by Categorise',
              ),
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: ((context, snapshot) {
                return snapshot.hasData
                    ? Categories(
                        categories: snapshot.data as List<Category>,
                      )
                    : Center(child: Image.asset('assets/ripple.gif'));
              }),
            ),
            const Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: const TitleText(title: 'Recommands For You'),
            ),
            FutureBuilder(
                future: fetchProduct(),
                builder: ((context, snapshot) {
                  return snapshot.hasData
                      ? RecommandProduct(
                          product: snapshot.data as List<Product>)
                      : Center(child: Image.asset('assets/ripple.gif'));
                }))
          ],
        ),
      ),
    );
  }
}
