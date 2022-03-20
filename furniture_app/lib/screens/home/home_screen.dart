import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/screens/components/body.dart';
import 'package:furniture_app/values/app_color.dart';
import 'package:furniture_app/values/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Khoi Tao Ui reponsive
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/icons/menu.svg',
          height: SizeConfig.defaultSize! * 2,
        ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: (() {}),
          icon: SvgPicture.asset(
            'assets/icons/scan.svg',
            height: SizeConfig.defaultSize! * 2.4,
          ),
        ),
        const Center(
          child: Text(
            'Scan',
            style: TextStyle(
                color: AppColor.kTextColor, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: SizeConfig.defaultSize,
        )
      ],
    );
  }
}
