import 'package:flutter/material.dart';

class ConverterCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Function onTap;

  const ConverterCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  _ConverterCardState createState() => _ConverterCardState();
}

class _ConverterCardState extends State<ConverterCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap(),
      onHover: (hovered) {
        setState(() {
          isHovered = hovered;
        });
      },
      child: Card(
        color: isHovered ? widget.color.withOpacity(0.9) : widget.color,
        elevation: isHovered ? 8.0 : 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(widget.icon, size: 64, color: Colors.white),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
