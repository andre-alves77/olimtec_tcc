import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:olimtec_tcc/app/features/championship/service/game.service.dart';
import 'package:olimtec_tcc/app/shared/views/loading_page.dart';
import 'main_card.dart';

class CardCarousel extends ConsumerStatefulWidget {
  const CardCarousel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CardCarouselState();
}

class _CardCarouselState extends ConsumerState<CardCarousel> {
  int _currentIndex = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      if(list[i]!=null)
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    List cardList = [];
    final game = ref.watch(carouselStreamProvider).when(
          data: (data) {
            for (int x = 0; x < 3; x++) {
              if(data[x]!=null){

              cardList.add(MainCard(data[x]));
              }
            }
            ;
          },
          error: (Object error, StackTrace stackTrace) {},
          loading: () {},
        );

    if(cardList.length<3){

      return SizedBox();
    }if(ref.watch(carouselStreamProvider).isLoading){
      return LoadingPage();
    }
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
            if(card!=null) SizedBox();
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
