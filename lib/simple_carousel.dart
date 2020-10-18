library simple_carousel;

import 'package:flutter/material.dart';

class SimpleCarousel extends StatefulWidget {
  const SimpleCarousel({
    Key key,
    this.numberPages,
    this.children,
    this.colorIconCircleBarActive,
    this.colorIconCircleBar,
  }) : super(key: key);

  final int numberPages;
  final List<Widget> children;
  final Color colorIconCircleBarActive;
  final Color colorIconCircleBar;

  @override
  _SimpleCarousel createState() => _SimpleCarousel();
}

class _SimpleCarousel extends State<SimpleCarousel> {
  PageController _controller;
  int indexPage = 0;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: PageView(
            children: widget.children,
            physics: ClampingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                indexPage = index;
              });
            },
          ),
        ),
        _buildPageIndicator(
          colorIconCircleBar: widget.colorIconCircleBar ?? Colors.grey,
          colorIconCircleBarActive:
              widget.colorIconCircleBarActive ?? Colors.grey[700],
          itemCount: widget.numberPages,
          currentPageValue: indexPage,
        )
      ],
    );
  }

  Widget _buildPageIndicator({
    final int currentPageValue,
    final int itemCount,
    final Color colorIconCircleBarActive,
    final Color colorIconCircleBar,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < itemCount; i++)
          if (i == currentPageValue) ...[_circleBar(isActive: true)] else
            _circleBar(
              isActive: false,
              colorIconCircleBar: colorIconCircleBar,
              colorIconCircleBarActive: colorIconCircleBarActive,
            ),
      ],
    );
  }

  Widget _circleBar({
    bool isActive,
    Color colorIconCircleBarActive,
    Color colorIconCircleBar,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? colorIconCircleBarActive : colorIconCircleBar,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
