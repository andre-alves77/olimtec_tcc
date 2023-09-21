import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'main_card.dart';

class CardCarousel extends StatefulWidget {
  const CardCarousel({super.key});

  @override
  State<CardCarousel> createState() => _CardCarouselState();
}

int _currentIndex = 0;

List cardList = [
  MainCard(gametest),
  MainCard(gametest),
  MainCard(gametest),
];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class _CardCarouselState extends State<CardCarousel> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            aspectRatio: 1.7,
            clipBehavior: Clip.none,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: cardList.map((card) {
            return Builder(builder: (BuildContext context) {
              return AspectRatio(
                aspectRatio: 1.7,
                child: Container(
                  child: card,
                ),
              );
            });
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(cardList, (index, url) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
              ),
            );
          }),
        )
      ],
    );
  }
}
