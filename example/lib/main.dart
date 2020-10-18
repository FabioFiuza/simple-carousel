import 'package:flutter/material.dart';
import 'package:simple_carousel/simple_carousel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit carousel',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FruitCarouselPage(),
    );
  }
}

class FruitCarouselPage extends StatelessWidget {
  FruitCarouselPage({Key key}) : super(key: key);

  final fruits = <String>['orange', 'apple', 'banana', 'strawberry'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruit Carousel'),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        height: 150,
        child: SimpleCarousel(
          colorIconCircleBar: Colors.orange[100],
          colorIconCircleBarActive: Colors.orange,
          numberPages: fruits.length,
          children: fruits
              .map(
                (fruit) => FruitCarouselItem(
                  fruitName: fruit,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class FruitCarouselItem extends StatelessWidget {
  const FruitCarouselItem({Key key, this.fruitName}) : super(key: key);

  final String fruitName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: Center(
        child: Text(
          fruitName.toUpperCase(),
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
