class Flower {
  String name;
  String imageUrl;
  int price;
  int sold;

  Flower({this.name, this.imageUrl, this.price, this.sold});
}

final List<Flower> newFlower = [
  Flower(
    name: 'Tulip Blossom',
    imageUrl: 'images/tulip.jpg',
    price: 60,
  ),
  Flower(
    name: 'Sunflower',
    imageUrl: 'images/sunflower.jpg',
    price: 50,
  ),
  Flower(
    name: 'Succelent',
    imageUrl: 'images/succelent.jpg',
    price: 40,
  ),
  Flower(
    name: 'Burro\'s tail',
    imageUrl: 'images/burros-tail.jpg',
    price: 30,
  ),
  Flower(
    name: 'Rose',
    imageUrl: 'images/rose.jpg',
    price: 20,
  ),
  Flower(
    name: 'Orchid',
    imageUrl: 'images/white-orchid.jpg',
    price: 10,
  ),
];

final List<Flower> popularFlower = [
  Flower(
    name: 'Sunflower',
    imageUrl: 'images/sunflower.jpg',
    price: 10,
    sold: 40,
  ),
  Flower(
    name: 'Tulip Blossom',
    imageUrl: 'images/tulip.jpg',
    price: 20,
    sold: 40,
  ),
  Flower(
    name: 'Burro\'s tail',
    imageUrl: 'images/burros-tail.jpg',
    price: 30,
    sold: 40,
  ),
  Flower(
    name: 'Rose',
    imageUrl: 'images/rose.jpg',
    price: 40,
    sold: 40,
  ),
  Flower(
    name: 'Orchid',
    imageUrl: 'images/white-orchid.jpg',
    price: 50,
    sold: 40,
  ),
  Flower(
    name: 'Succelent',
    imageUrl: 'images/succelent.jpg',
    price: 60,
    sold: 40,
  ),
];

final List<Flower> decorationFlower = [
  Flower(
    imageUrl: 'images/tulip.jpg',
  ),
  Flower(
    imageUrl: 'images/sunflower.jpg',
  ),
  Flower(
    imageUrl: 'images/succelent.jpg',
  ),
  Flower(
    imageUrl: 'images/burros-tail.jpg',
  ),
  Flower(
    imageUrl: 'images/rose.jpg',
  ),
  Flower(
    imageUrl: 'images/white-orchid.jpg',
  ),
];
