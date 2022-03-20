import 'dart:math';

import 'package:app_english/models/english_today.dart';
import 'package:app_english/packages/quote/quote.dart';
import 'package:app_english/pages/all_words_page.dart';
import 'package:app_english/pages/control_page.dart';
import 'package:app_english/values/app_assets.dart';
import 'package:app_english/values/app_colors.dart';
import 'package:app_english/values/app_styles.dart';
import 'package:app_english/values/share_key.dart';
import 'package:app_english/widgets/app_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../packages/quote/qoute_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  String quote = Quotes().getRandom().content!;

  List<EnglishToday> words = [];
  //random
  List<int> fixedListRandom({int len = 1, int max = 120, int min = 1}) {
    if (len > max || len < min) {
      return [];
    }

    List<int> newList = [];

    Random random = Random();
    int count = 1;
    while (count <= len) {
      int val = random.nextInt(max);
      if (newList.contains(val)) {
        continue;
      } else {
        newList.add(val);
        count++;
      }
    }
    return newList;
  }

  getEngLishToDay() async {
    List<String> newList = [];
    final prefs = await SharedPreferences.getInstance();
    int len = prefs.getInt(Sharekey.counter) ?? 5;
    List<int> rans = fixedListRandom(len: len, max: nouns.length);
    // ignore: avoid_function_literals_in_foreach_calls
    rans.forEach((e) {
      newList.add(nouns[e]);
    });
    setState(() {
      words = newList.map((e) => getQuote(e)).toList();
    });
  }

  EnglishToday getQuote(String noun) {
    Quote? quote;
    quote = Quotes().getByWord(noun);
    return EnglishToday(noun: noun, quote: quote?.content, id: quote?.id);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    super.initState();
    getEngLishToDay();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
          backgroundColor: AppColors.secondColor,
          elevation: 0,
          title: Text('English today',
              style: AppStyles.h3
                  .copyWith(color: AppColors.textColor, fontSize: 32)),
          leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Image.asset(AppAssets.menu),
          )),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: size.height * 1 / 10,
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: '"$quote"',
                  style: AppStyles.h5
                      .copyWith(fontSize: 15, color: AppColors.textColor),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 2 / 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: words.length >= 5 ? 6 : words.length,
                itemBuilder: (context, index) {
                  String firstLetter =
                      words[index].noun != null ? words[index].noun! : '';
                  firstLetter = firstLetter.substring(0, 1);
                  String leftLetter =
                      words[index].noun != null ? words[index].noun! : '';
                  leftLetter = leftLetter.substring(1, leftLetter.length);
                  String quote = words[index].quote != null
                      ? words[index].quote!
                      : 'Think of all the beauty still left around you and be happy';

                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                            color: AppColors.primaryColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(3, 8),
                                  blurRadius: 6)
                            ]),
                        padding: const EdgeInsets.all(16),
                        child: index >= 5
                            ? InkWell(
                                splashColor: Colors.transparent,
                                onTap: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              AllWordsPage(words: words)));
                                }),
                                child: Center(
                                  child: Text('Show more...',
                                      style: AppStyles.h3.copyWith(
                                        shadows: [
                                          const BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(3, 6),
                                              blurRadius: 6)
                                        ],
                                      )),
                                ),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Container(
                                  //     alignment: Alignment.centerRight,
                                  //     child: Image.asset(AppAssets.heart,
                                  //         color: words[index].isFavorite
                                  //             ? Colors.red
                                  //             : Colors.white)),
                                  LikeButton(
                                    onTap: (bool isLiked) async {
                                      setState(() {
                                        words[index].isFavorite =
                                            !words[index].isFavorite;
                                      });
                                      return words[index].isFavorite;
                                    },
                                    isLiked: words[index].isFavorite,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    size: 42,
                                    circleColor: const CircleColor(
                                        start: Color(0xff00ddff),
                                        end: Color(0xff0099cc)),
                                    bubblesColor: const BubblesColor(
                                      dotPrimaryColor: Color(0xff33b5e5),
                                      dotSecondaryColor: Color(0xff0099cc),
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return ImageIcon(
                                        AssetImage(AppAssets.heart),
                                        color:
                                            isLiked ? Colors.red : Colors.white,
                                      );
                                    },
                                  ),
                                  RichText(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                        text: firstLetter,
                                        style: const TextStyle(
                                            fontFamily: FontFamily.sen,
                                            fontSize: 92,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              BoxShadow(
                                                  color: Colors.black38,
                                                  offset: Offset(3, 6),
                                                  blurRadius: 6),
                                            ]),
                                        children: [
                                          TextSpan(
                                            text: leftLetter,
                                            style: const TextStyle(
                                                fontFamily: FontFamily.sen,
                                                fontSize: 62,
                                                fontWeight: FontWeight.bold,
                                                shadows: [
                                                  BoxShadow(
                                                      color: Colors.black38,
                                                      offset: Offset(3, 6),
                                                      blurRadius: 6),
                                                ]),
                                          ),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 24, right: 10, left: 10),
                                    child: AutoSizeText('"$quote"',
                                        maxLines: 8,
                                        maxFontSize: 28,
                                        style: AppStyles.h4.copyWith(
                                          letterSpacing: 1,
                                          color: AppColors.textColor,
                                        )),
                                  ),
                                ],
                              )),
                  );
                },
              ),
            ),
            // _currentIndex >= 5
            //     ? buildShowMore():
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: size.height * 1 / 12,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return buildIndicator(index == _currentIndex, size);
                    }),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          setState(() {
            getEngLishToDay();
          });
        },
        child: Image.asset(AppAssets.exchange),
      ),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.lightBlue,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 28, left: 18),
              child: Text('Your mind',
                  style: AppStyles.h3.copyWith(color: AppColors.textColor)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: AppButton(
                  label: 'Favorites',
                  onTap: () {
                    // ignore: avoid_print
                    print('favorites');
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: AppButton(
                  label: 'Your control',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const ControlPage()));
                  }),
            )
          ]),
        ),
      ),
    );
  }

  Widget buildIndicator(bool isActive, Size size) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceInOut,
      margin: const EdgeInsets.symmetric(horizontal: 18),
      width: isActive ? size.width * 1 / 5 : 24,
      decoration: BoxDecoration(
          color: isActive ? AppColors.lightBlue : AppColors.greyText,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
          ]),
    );
  }

  // // Widget buildShowMore() {
  //   return Container(
  //     alignment: Alignment.centerLeft,
  //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  //     child: Material(
  //       borderRadius: const BorderRadius.all(Radius.circular(8)),
  //       color: AppColors.primaryColor,
  //       elevation: 4,
  //       child: InkWell(
  //         splashColor: Colors.black38,
  //         borderRadius: const BorderRadius.all(Radius.circular(8)),
  //         onTap: (() {
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (_) => AllWordsPage(words: words)));
  //         }),
  //         child: Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
  //           child: Text('Show more', style: AppStyles.h5),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
