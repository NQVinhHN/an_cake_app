import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../models/image_list_slider.dart';

class ImageSliderWidget extends StatelessWidget {
  ImageSliderWidget({Key? key}) : super(key: key);
  final imgList = ImageListSlider().imgList;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2,
        enlargeCenterPage: true,
      ),
      items: imgList
          .map((item) => Container(
                margin: const EdgeInsets.only(
                  top: 15.0,
                  left: 1,
                  right: 1,
                ),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          item,
                          fit: BoxFit.fill,
                          width: 1000.0,
                        ),
                      ],
                    )),
              ))
          .toList(),
    );
  }
}
