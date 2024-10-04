import 'package:flutter/material.dart';
import 'constants.dart';

class TabCard extends StatefulWidget {
  final IconData assetIcon;
  final String assetName;

  const TabCard({
    super.key,
    required this.assetIcon,
    required this.assetName,
  });

  @override
  _TabCardState createState() => _TabCardState();
}

class _TabCardState extends State<TabCard> {
  get tabHeight async => null;

  get tabWidth async => null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add any onTap functionality here
      },
      child: Container(
        height: tabHeight,
        width: tabWidth,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.amber[400],
          border: Border.all(
            width: 1,
            color: Colors.amber[200]!, // Border color
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, 4), // Shadow effect beneath the card
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              widget.assetIcon,
              color: chocolateColor,
              size: 30,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                widget.assetName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                  fontFamily: 'Lora',
                  // letterSpacing: 0.5,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabCardList extends StatelessWidget {
  final List<TabCard> cards;

  const TabCardList({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: cards
            .map((card) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: card,
                ))
            .toList(),
      ),
    );
  }
}
