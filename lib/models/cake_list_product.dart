class CakeList {
  final String name;
  final String img;
  CakeList({required this.name, required this.img});
}

final List<CakeList> cakeList = [
  CakeList(name: "Birthday", img: "cake_list/birthday_cake_list.jpg"),
  CakeList(name: "Lunar", img: "cake_list/lunar_cakes_list.jpg"),
  CakeList(name: "Special", img: "cake_list/special_cake.jpg"),
  CakeList(name: "Eggless", img: "cake_list/eggless_cake.jpg"),
  CakeList(name: "Valentine", img: "cake_list/valentine_cake.jpg"),
];
