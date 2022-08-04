import 'package:an_cake_app/utils/helper_widget.dart';
import 'package:an_cake_app/views/main_screen/components/cake_list_screen/widget/add_product_gallery_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../models/cake_list_gridviews.dart';
import '../../../../../theme/theme_manager.dart';
import '../../../../../translations/locale_keys.g.dart';
import 'cake_list_product_gridviews.dart';
import 'cake_list_product_widget.dart';
import 'image_gallery_provider.dart';
import 'image_slider_widget.dart';

class CakeListBody extends StatefulWidget {
  const CakeListBody({
    Key? key,
  }) : super(key: key);

  @override
  State<CakeListBody> createState() => _CakeListBodyState();
}

class _CakeListBodyState extends State<CakeListBody> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ImageGalleryProvider>(context, listen: true);
    var provider2 = Provider.of<CakeListGridView>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          // TextFormField(
          //   decoration: const InputDecoration(
          //     hintText: "Type of cakes...",
          //     suffixIcon: Icon(Icons.search),
          //     enabledBorder: OutlineInputBorder(
          //       borderSide: BorderSide(
          //         color: Colors.grey,
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: Column(
              children: [
                ImageSliderWidget(),
                const Divider(
                  color: Colors.transparent,
                ),
                SizedBox(
                  height: 120,
                  child: CakeListProductWidget(),
                ),
                const Divider(
                  color: Colors.red,
                  thickness: 2,
                ),
                Row(
                  children: [
                    Text(
                      LocaleKeys.cls_gallery_title.tr(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.deepOrange),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddProductGallery(),
                          ),
                        );
                        provider.imageGallery = null;
                        provider2.setName('');
                      },
                      icon: Icon(
                        Icons.add,
                        size: 30,
                        color: context.watch<ThemeManager>().themeDark
                            ? Colors.red
                            : Colors.blue,
                      ),
                    )
                  ],
                ),
                addDividerTrans(),
                Expanded(child: CakeListProductGridViews()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
