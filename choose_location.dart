import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sitravel_app/colors.dart';
import 'package:sitravel_app/event/main_event.dart';
import 'package:sitravel_app/widgets/big_text.dart';
import 'package:sitravel_app/widgets/icon_text_widget.dart';
import 'package:sitravel_app/widgets/small_text.dart';

import '../widgets/menu_card.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        foregroundColor: Colors.white,
        title: BigText(
          text: "Pilih Lokasi",
          color: Colors.white,
        ),
        actions: [],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: BigText(text: "Pilih lokasi terlebih dahulu.."),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: .90,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14.0),
                      child: Container(
                        // padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/jakarta.png"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 15),
                              blurRadius: 17,
                              spreadRadius: -24,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        child: Container(
                          color: Colors.transparent,
                          child: InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: <Widget>[
                                    Spacer(),
                                    Spacer(),
                                    Text(
                                      "Jakarta",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                      // style: Theme.of(context).textTheme.titleLarge,
                                      // selectionColor: kTextColor,
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            new MainEventPage()));
                              }),
                        ),
                      ),
                    ),
                    MenuCard(
                      title: "Wisata",
                      svgSrc: "assets/icons/wisata.png",
                      press: () {},
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14.0),
                      child: Container(
                        // padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/concert1.jpg"),
                              fit: BoxFit.cover),
                        ),
                        child: Container(
                          color: Colors.transparent,
                          child: InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: <Widget>[
                                    Spacer(),
                                    Spacer(),
                                    Text(
                                      "Bali",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                      // style: Theme.of(context).textTheme.titleLarge,
                                      // selectionColor: kTextColor,
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            new ChooseLocation()));
                              }),
                        ),
                      ),
                    ),
                    MenuCard(
                      title: "Malang",
                      svgSrc: "assets/icons/kuliner.png",
                      press: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xFF69CFBF) : Color(0xFF9294CC),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/travel1.jpg"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFE8E8E8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "Labuan Bajo",
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: AppColors.mainColor,
                                    size: 14,
                                  )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(
                          text: "5",
                          color: Colors.black54,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconTextWidget(
                          icon: Icons.location_on,
                          text: "Gelora Bung Karno",
                          color: Colors.black38,
                          iconColor: AppColors.mainColor,
                        ),
                        IconTextWidget(
                          icon: Icons.price_change_rounded,
                          text: "200.000",
                          color: Colors.black38,
                          iconColor: AppColors.mainColor,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
