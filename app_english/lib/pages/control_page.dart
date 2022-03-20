import 'package:app_english/values/app_colors.dart';
import 'package:app_english/values/share_key.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../values/app_assets.dart';
import '../values/app_styles.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  double silderValue = 5;
  // ignore: prefer_typing_uninitialized_variables
  late final prefs;
  @override
  void initState() {
    initValueControl();
    super.initState();
  }

  initValueControl() async {
    prefs = await SharedPreferences.getInstance();
    int value = prefs.getInt(Sharekey.counter) ?? 5;
    setState(() {
      silderValue = value.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
          backgroundColor: AppColors.secondColor,
          elevation: 0,
          title: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 52),
            child: Text('Your control',
                style: AppStyles.h3
                    .copyWith(color: AppColors.textColor, fontSize: 32)),
          ),
          leading: InkWell(
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setInt(Sharekey.counter, silderValue.toInt());
              Navigator.pop(context);
            },
            child: Image.asset(AppAssets.leftArrow),
          )),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Spacer(),
            Text('How much a number word at once',
                style: AppStyles.h4
                    .copyWith(color: AppColors.lightGrey, fontSize: 18)),
            const Spacer(),
            Text('${silderValue.toInt()}',
                style: AppStyles.h1.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 150,
                    fontWeight: FontWeight.bold)),
            Slider(
                value: silderValue,
                min: 5,
                max: 100,
                divisions: 95,
                onChanged: (value) {
                  setState(() {
                    silderValue = value;
                  });
                }),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text('slide to set',
                  style: AppStyles.h5.copyWith(color: AppColors.textColor)),
            ),
            const Spacer(),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
