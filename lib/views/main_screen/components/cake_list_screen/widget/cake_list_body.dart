import 'package:flutter/material.dart';

import 'cake_list_product_gridviews.dart';
import 'cake_list_product_widget.dart';
import 'image_slider_widget.dart';

class CakeListBody extends StatelessWidget {
  const CakeListBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Type of cakes...",
              suffixIcon: Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const ImageSliderWidget(),
                const Divider(
                  color: Colors.transparent,
                ),
                const SizedBox(
                  height: 120,
                  child: CakeListProductWidget(),
                ),
                Row(
                  children: const [
                    Text(
                      "Cakes by Flavor",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                const Expanded(child: CakeListProductGridViews()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
