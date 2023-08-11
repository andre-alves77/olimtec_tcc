import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'main_card.dart';

class CardCarousel extends StatefulWidget {
  const CardCarousel({super.key});

  @override
  State<CardCarousel> createState() => _CardCarouselState();
}

int _currentIndex = 0;

List cardList=[
  MainCard('09:15 - BASQUETE MASCULINO', 'Quadra 01', 'assets/images/LOGO_3EAA_EXAMPLE.png', 'assets/images/LOGO_1EAA_EXAMPLE.png', '3ºEAA', '1ºEAB'),
  MainCard('09:15 - HANDBALL MASCULINO', 'Quadra 01', 'assets/images/LOGO_3EAA_EXAMPLE.png', 'assets/images/LOGO_1EAA_EXAMPLE.png', '3ºEAA', '1ºEAB'),
  MainCard('09:15 - VOLEI MASCULINO', 'Quadra 01', 'assets/images/LOGO_3EAA_EXAMPLE.png', 'assets/images/LOGO_1EAA_EXAMPLE.png', '3ºEAA', '1ºEAB'),
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

  var size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            height: size.height * 0.3,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: cardList.map((card){
                return Builder(
                  builder:(BuildContext context){
                    return Container(
                      height: MediaQuery.of(context).size.height*0.30,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Card(
                        color: Theme.of(context).colorScheme.primary,
                        child: card,
                      ),
                    );
                  }
                );
              }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget> (cardList, (index, url) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Theme.of(context).colorScheme.primary: Colors.grey,
              ),
            );
          }),  
        )
      ],
    );
  }
}