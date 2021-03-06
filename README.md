# simple_carousel

A simple carousel package.

[PubDev](https://pub.dev/packages/simple_carousel)

## Instalation

Add `simple_carousel: 0.0.1` in your `pubspec.yaml`.

## Motivation

This simple widget that will improve with time. If your collaborate please access [github project](https://github.com/FabioFiuza/simple-carousel) project and send a pull request.

## How to use

The parent widget should have a size.

```
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
```

[![example](https://i.postimg.cc/nz5XZzG7/Captura-de-Tela-2020-10-18-a-s-14-36-32.png)](https://postimg.cc/476fQXMN)
