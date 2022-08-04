import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../models/cake_list_gridviews.dart';
import '../../../../../utils/helper_widget.dart';

class CakeListProductGridViews extends StatelessWidget {
  CakeListProductGridViews({
    Key? key,
  }) : super(key: key);
  final cakeListGridView = CakeListGridView().cakeListGridView;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CakeListGridView>(context, listen: true);
    return Consumer<CakeListGridView>(builder: (context, value, child) {
      final cakeGalleryList = value.cakeListGridView;
      return GridView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          mainAxisExtent: 250,
        ),
        children: List.generate(
          cakeGalleryList.length,
          (index) {
            var cakeGalleryItem = provider.cakeListGridView[index];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: cakeGalleryItem.img,
                      fit: BoxFit.fill,
                      width: 200,
                      height: 190,
                    ),
                  ),
                ),
                addVerticalSpace(10),
                Text(
                  cakeGalleryItem.name,
                  style: const TextStyle(color: Colors.teal, fontSize: 18),
                  textAlign: TextAlign.center,
                )
              ],
            );
          },
        ),
      );
    });
  }
}
