import 'package:flutter/material.dart';

import '../../../../../models/cake_list_product.dart';

class CakeListProductWidget extends StatelessWidget {
  const CakeListProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      children: List.generate(
        cakeList.length,
        (index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    cakeList[index].img,
                    fit: BoxFit.fill,
                    width: 100,
                    height: 80,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                cakeList[index].name,
              )
            ],
          );
        },
      ),
    );
  }
}
