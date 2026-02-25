
import 'package:flutter/material.dart';
import 'package:kittkatflutterlibrary/lang/kkfl_lang.dart';
import 'package:kittkatflutterlibrary/widgets/src/aspect.dart';
import '../models/flashcard.dart';
import '/widgets/card_widget.dart';

import '../models/cardlist.dart';

class ReviewPage extends StatefulWidget {
  final CardList list;
  final bool weiver;
  const ReviewPage({super.key, required this.list, this.weiver = false});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  late Flashcard card;

  @override
  void initState() {
    card = widget.list.getRandomCard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CardWidget fcwidget = CardWidget(
      key: ValueKey(card),
      card: card,
      isFlipped: widget.weiver,);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(getLang('titleReview')),
      ),
      body: Aspect(
        child: Center(
          child: fcwidget,
        )
      ),
      floatingActionButton: IconButton(
        onPressed: () => setState(() {
          card = widget.list.getRandomCard(card);
        }),
        icon: Icon(Icons.arrow_right)),
    );
  }
}
