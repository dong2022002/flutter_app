import 'package:flutter/material.dart';
import 'package:furniture_app/components/title_text.dart';
import 'package:furniture_app/models/categories.dart';
import 'package:furniture_app/values/app_color.dart';
import 'package:furniture_app/values/size_config.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  final Category? category;

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;

    return Padding(
      padding: EdgeInsets.all(defaultSize! * 2),
      child: SizedBox(
        width: defaultSize * 20.5,
        child: AspectRatio(
          aspectRatio: 0.83,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipPath(
                clipper: CategoryCustomShape(),
                child: AspectRatio(
                  aspectRatio: 1.025,
                  child: Container(
                    padding: EdgeInsets.all(defaultSize * 2),
                    color: AppColor.kSecondaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TitleText(title: category!.title),
                        SizedBox(height: defaultSize),
                        Text(
                          '${category!.numOfProducts}+ Products',
                          style: TextStyle(
                            color: AppColor.kTextColor.withOpacity(0.6),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AspectRatio(
                  aspectRatio: 1.15,
                  child: FadeInImage.assetNetwork(
                      placeholder: 'assets/spinner.gif',
                      image: category!.image),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double heigth = size.height;
    double width = size.width;
    double cornerSize = 30;

    path.lineTo(0, heigth - cornerSize);
    path.quadraticBezierTo(0, heigth, cornerSize, heigth);
    path.lineTo(width - cornerSize, heigth);
    path.quadraticBezierTo(width, heigth, width, heigth - cornerSize);
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);
    path.lineTo(cornerSize, cornerSize * 0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
