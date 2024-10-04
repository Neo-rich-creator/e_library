import 'package:flutter/material.dart';
import 'constants.dart';

class DocumentCard extends StatefulWidget {
  final String assetImage;

  const DocumentCard({
    super.key,
    required this.assetImage, required String title, required String author,
  });

  @override
  _DocumentCardState createState() => _DocumentCardState();
}

class _DocumentCardState extends State<DocumentCard> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Row(
        children: [
          Container(
            height: cardHeight + 30,
            width: cardWidth + 20,
            padding: const EdgeInsets.all(paddingSize),
            decoration: BoxDecoration(
              gradient: _isSelected
                  ? const LinearGradient(
                      colors: [Colors.white, chocolateColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: _isSelected ? null : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, -10),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: cardHeight,
                  width: cardWidth,
                  child: ClipRRect(
                    child: Image.asset(
                      widget.assetImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DocumentCardList extends StatelessWidget {
  final List<DocumentCard> cards;

  const DocumentCardList({super.key, required this.cards});

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




