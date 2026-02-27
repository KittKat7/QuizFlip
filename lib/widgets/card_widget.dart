
import 'package:flutter/material.dart';

import '../models/flashcard.dart';

class CardWidget extends StatefulWidget {
  final Flashcard card;
  final bool isFlipped;

  const CardWidget({super.key, required this.card, this.isFlipped = false});
  
  @override
  State<StatefulWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  late bool isFlipped;

  @override
  initState() {
    isFlipped = widget.isFlipped;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: .all(7), child: SizedBox(
      width: .infinity,
      child: OutlinedButton(
        style: ButtonStyle(
          shape: .all(RoundedRectangleBorder(borderRadius: .circular(10)))),
        onPressed: () => setState(() => isFlipped = !isFlipped),
        child: Padding(padding: .all(7), child: Column(
          mainAxisSize: .min,
          children: [
            !isFlipped ? Text(widget.card.term) : Text(widget.card.definition),
            Divider(height: 1,),
            Text(widget.card.getTagsString()),
          ],
        )),
      )
    ));
  }

}