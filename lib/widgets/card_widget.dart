
import 'package:flutter/material.dart';

import '../models/card.dart';

class CardWidget extends StatefulWidget {
  final Flashcard card;

  const CardWidget({super.key, required this.card});
  
  @override
  State<StatefulWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool isFlipped = false;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: .all(1), child: OutlinedButton(
      onPressed: () => setState(() => isFlipped = !isFlipped),
      child: Column(
        children: [
          !isFlipped ? Text(widget.card.term) : Text(widget.card.definition),
          !isFlipped ? Text("--- TODO") : Text("TODO"),
        ],
      ),
    ));
  }

}