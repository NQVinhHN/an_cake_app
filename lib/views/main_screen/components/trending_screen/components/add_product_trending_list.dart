import 'dart:io';

import 'package:an_cake_app/models/trending_screen_list_gridviews_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/helper_widget.dart';
import '../../../main_bottom_nav_bar.dart';
import 'add_product_image_provider.dart';

class AddProductTrendingList extends StatefulWidget {
  const AddProductTrendingList({Key? key}) : super(key: key);

  @override
  State<AddProductTrendingList> createState() => _AddProductTrendingListState();
}

class _AddProductTrendingListState extends State<AddProductTrendingList> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductList>(context, listen: false);
    var provider2 =
        Provider.of<AddProductImageProvider>(context, listen: false);
    TextEditingController _name =
        TextEditingController(text: provider.addNameProduct);
    TextEditingController _price =
        TextEditingController(text: provider.addPriceProduct);
    TextEditingController _rating =
        TextEditingController(text: provider.addRatingProduct);
    TextEditingController _shippingStatus =
        TextEditingController(text: provider.addShippingProduct);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Add Product',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold),
                    ),
                    setNameCake(_name, provider),
                    setPriceCake(_price, provider),
                    setRatingCake(_rating, provider),
                    setShippingDays(_shippingStatus, provider),
                    setDiscountType(provider),
                    setImageCake(provider2, context),
                    addButton(provider, provider2, context),
                  ],
                ),
              ),
              backButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding backButton(BuildContext context) {
    return Padding(
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
    );
  }

  ElevatedButton addButton(ProductList provider,
      AddProductImageProvider provider2, BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(backgroundColor: Colors.teal),
      onPressed: () {
        provider.addToProduct(
            discountType: provider.addDiscountProduct,
            name: provider.addNameProduct,
            price: double.parse(provider.addPriceProduct),
            rating: double.parse(provider.addRatingProduct),
            shipping: int.parse(provider.addShippingProduct),
            img: FileImage(
              File(provider2.imageProduct!.path),
            ) as ImageProvider);
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
    );
  }

  GestureDetector setImageCake(
      AddProductImageProvider provider2, BuildContext context) {
    return GestureDetector(
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
          child: context.watch<AddProductImageProvider>().imageProduct == null
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
                  context.watch<AddProductImageProvider>().imageProduct!,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  Row setDiscountType(ProductList provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(provider.addDiscountProduct),
        addHorizontalSpace(10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PopupMenuButton<String>(
            icon: const Icon(Icons.more_horiz_outlined),
            itemBuilder: (BuildContext context) {
              return provider.choices.map((String choice) {
                return PopupMenuItem<String>(
                  onTap: () {
                    setState(() {
                      provider.setDiscountProduct(choice);
                    });
                  },
                  value: choice,
                  child: Text(choice, style: const TextStyle(fontSize: 20)),
                );
              }).toList();
            },
          ),
        ),
      ],
    );
  }

  Row setShippingDays(
      TextEditingController _shippingStatus, ProductList provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: TextFormField(
            controller: _shippingStatus,
            onChanged: provider.setShippingProduct,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter shipping days of the cake',
              hintStyle: TextStyle(color: Colors.purple),
              fillColor: Colors.grey[400],
              filled: true,
              enabledBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              border: InputBorder.none,
            ),
            style: TextStyle(color: Colors.purple, fontSize: 15),
          ),
        ),
      ],
    );
  }

  Row setRatingCake(TextEditingController _rating, ProductList provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: TextFormField(
            controller: _rating,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onChanged: provider.setRatingProduct,
            decoration: InputDecoration(
              hintText: 'Enter rating of the cake',
              hintStyle: TextStyle(color: Colors.purple),
              fillColor: Colors.grey[400],
              filled: true,
              enabledBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              border: InputBorder.none,
            ),
            style: TextStyle(color: Colors.purple, fontSize: 15),
          ),
        ),
      ],
    );
  }

  Row setPriceCake(TextEditingController _price, ProductList provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: TextFormField(
            controller: _price,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onChanged: provider.setPriceProduct,
            decoration: InputDecoration(
              hintText: 'Enter price of the cake',
              hintStyle: TextStyle(color: Colors.purple),
              fillColor: Colors.grey[400],
              filled: true,
              enabledBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              border: InputBorder.none,
            ),
            style: TextStyle(color: Colors.purple, fontSize: 15),
          ),
        ),
      ],
    );
  }

  Row setNameCake(TextEditingController _name, ProductList provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: TextFormField(
            controller: _name,
            onChanged: provider.setNameProduct,
            decoration: InputDecoration(
              hintText: 'Enter name of the cake',
              hintStyle: TextStyle(color: Colors.purple),
              fillColor: Colors.grey[400],
              filled: true,
              enabledBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              border: InputBorder.none,
            ),
            style: TextStyle(color: Colors.purple, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
