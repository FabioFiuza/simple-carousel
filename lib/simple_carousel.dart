library simple_carousel;

import 'package:flutter/material.dart';

/// Import that the parent widget has a size.
class SimpleCarousel extends StatefulWidget {
  const SimpleCarousel({
    Key key,
    @required this.numberPages,
    @required this.children,
    this.colorIconCircleBarActive,
    this.colorIconCircleBar,
  })  : assert(numberPages != null),
        assert(children != null),
        super(key: key);

  final int numberPages;

  final List<Widget> children;

  /// Default color is [Colors.grey[700]].
  final Color colorIconCircleBarActive;

  /// Default color is [Colors.grey].
  final Color colorIconCircleBar;

  @override
  _SimpleCarousel createState() => _SimpleCarousel();
}

class _SimpleCarousel extends State<SimpleCarousel> {
  PageController _controller;
  int _indexPage = 0;

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
            key: ValueKey('PageViewKey'),
            children: widget.children,
            physics: ClampingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _indexPage = index;
              });
            },
          ),
        ),
        SizedBox(
          height: 8,
        ),
        _buildPageIndicator(
          colorIconCircleBar: widget.colorIconCircleBar ?? Colors.grey,
          colorIconCircleBarActive:
              widget.colorIconCircleBarActive ?? Colors.grey[700],
          itemCount: widget.numberPages,
          currentPageValue: _indexPage,
        ),
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
          if (i == currentPageValue) ...[
            _circleBar(
              key: ValueKey('circleBar$i'),
              isActive: true,
              colorIconCircleBar: colorIconCircleBar,
              colorIconCircleBarActive: colorIconCircleBarActive,
            )
          ] else
            _circleBar(
              key: ValueKey('circleBar$i'),
              isActive: false,
              colorIconCircleBar: colorIconCircleBar,
              colorIconCircleBarActive: colorIconCircleBarActive,
            ),
      ],
    );
  }

  Widget _circleBar({
    Key key,
    bool isActive,
    Color colorIconCircleBarActive,
    Color colorIconCircleBar,
  }) {
    return AnimatedContainer(
      key: key,
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
