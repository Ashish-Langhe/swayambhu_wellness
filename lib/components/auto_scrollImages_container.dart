import 'dart:async';
import 'package:flutter/material.dart';

class AutoScrollImagesContainer extends StatefulWidget {
  @override
  _AutoScrollImagesContainerState createState() => _AutoScrollImagesContainerState();
}

class _AutoScrollImagesContainerState extends State<AutoScrollImagesContainer> {
  final PageController _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: <Widget>[
          _buildImageWidget('https://picsum.photos/id/1000/400/200'),
          _buildImageWidget('https://picsum.photos/id/1001/400/200'),
          _buildImageWidget('https://picsum.photos/id/1002/400/200'),
        ],
      ),
    );
  }

  Widget _buildImageWidget(String url) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
    );
  }
}
