class CakeListGridView {
  final String name;
  final String img;
  CakeListGridView({required this.name, required this.img});
}

final List<CakeListGridView> cakeListGridView = [
  CakeListGridView(
      name: "Black Forest", img: "cake_list_gridview/black_forest_cake.jpg"),
  CakeListGridView(
      name: "Chocolate Peanut", img: "cake_list_gridview/chocolate_peanut.jpg"),
  CakeListGridView(
      name: "Fullerton Heritage",
      img: "cake_list_gridview/fullerton_heritage.jpg"),
  CakeListGridView(
      name: "Luxurious Vegan Chocolate",
      img: "cake_list_gridview/luxurious_vegan_chocolate.jpg"),
  CakeListGridView(name: "Opera", img: "cake_list_gridview/opera_cake.jpg"),
  CakeListGridView(
      name: "Momofuku Milk", img: "cake_list_gridview/momofuku_milk_bar.jpg"),
];
