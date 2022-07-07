import 'package:flutter/material.dart';

import '../../../../../models/cake_list_gridviews.dart';

class CakeListProductGridViews extends StatelessWidget {
  const CakeListProductGridViews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 1.0,
      ),
      children: List.generate(
        cakeListGridView.length,
        (index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    cakeListGridView[index].img,
                    fit: BoxFit.fill,
                    width: 200,
                    height: 190,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                cakeListGridView[index].name,
              )
            ],
          );
        },
      ),
    );
  }
}
