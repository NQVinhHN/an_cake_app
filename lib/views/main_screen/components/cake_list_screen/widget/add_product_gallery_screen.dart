import 'dart:io';

import 'package:an_cake_app/models/cake_list_gridviews.dart';
import 'package:an_cake_app/utils/helper_widget.dart';
import 'package:an_cake_app/views/main_screen/components/cake_list_screen/widget/image_gallery_provider.dart';
import 'package:an_cake_app/views/main_screen/main_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductGallery extends StatelessWidget {
  const AddProductGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CakeListGridView>(context, listen: false);
    var provider2 = Provider.of<ImageGalleryProvider>(context, listen: true);
    TextEditingController _nameCake =
        TextEditingController(text: provider.addName);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Thêm bánh",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: _nameCake,
                        onChanged: provider.setName,
                        decoration: InputDecoration(
                          hintText: 'Thêm tên bánh',
                          hintStyle: TextStyle(color: Colors.purple),
                          fillColor: Colors.grey[400],
                          filled: true,
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.purple, fontSize: 25),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => provider2.pickImage(),
                  child: Container(
                    height: 150,
                    width: 150,
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:
                          context.watch<ImageGalleryProvider>().imageGallery ==
                                  null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: 50,
                                    ),
                                    addDividerTrans(),
                                    Text(
                                      "Thêm ảnh của bánh",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                )
                              : Image.file(
                                  context
                                      .watch<ImageGalleryProvider>()
                                      .imageGallery!,
                                  fit: BoxFit.cover,
                                ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.teal),
                  onPressed: () {
                    provider.addToGallery(
                        provider.addName,
                        FileImage(File(provider2.imageGallery!.path))
                            as ImageProvider);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainBottomNavBar(),
                      ),
                    );
                  },
                  child: Text(
                    "Thêm",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 20),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        const Size(60, 40),
                      ),
                      maximumSize: MaterialStateProperty.all(
                        const Size(60, 40),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<CircleBorder>(
                        const CircleBorder(),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.navigate_before,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
