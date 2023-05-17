import 'package:flutter/cupertino.dart';

class ReusableCard extends StatefulWidget {
  final Color colour;
  final Widget cardChild;
  final void Function() onPress;
  final Border? border;

  ReusableCard({
    required this.colour,
    required this.cardChild,
    required this.onPress,
    this.border,
  });

  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onPress,
      child: Container(
        child: widget.cardChild,
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: widget.colour,
          borderRadius: BorderRadius.circular(10.0),
          border: _isPressed ? widget.border : widget.border,
        ),
      ),
    );
  }
}
