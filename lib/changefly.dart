import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:changefly_coding_challenge/logo/changefly_animation.dart';
import 'package:changefly_coding_challenge/logo2/changefly_animation2.dart';

class Changefly extends StatefulWidget {
  @override
  _ChangeflyState createState() => _ChangeflyState();
}

class _ChangeflyState extends State<Changefly> with SingleTickerProviderStateMixin{

  // Controller for the animation.
  AnimationController _controller;

  // Animation duration control
  // Default duration is 1.1s(You can change it if you want)
  // 0.6s duration for the cube animation
  // 0.5s delay, and then 0.6s duration header animation
  int animationDuration = 1100;

  // PageController to show different logo concept
  PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // Animation related
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: animationDuration));
    _controller.forward();

    // PageController setup
    _pageController = PageController();

  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// Changefly animations
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _buildAnimationPageView(),
          _buildPageViewIndicator(),
        ],
      ),

      /// Repeat animation button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF50cbdf),
        child: Icon(Icons.refresh,),
        onPressed: () {
          _controller.reset();
          _controller.forward();
        },
      ),
    );
  }

  Widget _buildAnimationPageView() {
    // Actual animation stack
    return PageView(
      controller: _pageController,
      physics: ClampingScrollPhysics(),
      onPageChanged: (index) {
        setState(() {_currentIndex = index;});
      },
      children: <Widget>[

        /// [TickerMode] stops the animation of pages not showing
        /// [Center] centers the widget

        // Initial part of challenge
        Center(
          child: TickerMode(
            enabled: _currentIndex == 0,
            child: ChangeflyAnimation(controller: _controller,),
          ),
        ),

        /// BONUS LOGO CONCEPT
        Center(
          child: TickerMode(
            enabled: _currentIndex == 1,
            child: ChangeflyAnimation2(controller: _controller),
          ),
        ),

      ],
    );
  }

  Widget _buildPageViewIndicator() {
    /// Indicates which animation is currently being shown
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: DotsIndicator(
          numberOfDot: 2,
          position: _currentIndex,
          dotColor: Colors.blueGrey,
          dotActiveColor: Color(0xFF50cbdf),
        ),
      ),
    );
  }

}
