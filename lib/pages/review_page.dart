
import 'package:flutter/material.dart';
import 'package:kittkatflutterlibrary/lang/kkfl_lang.dart';
import 'package:kittkatflutterlibrary/widgets/src/aspect.dart';
import 'package:quizflip/models/card.dart';
import 'package:quizflip/widgets/card_widget.dart';

import '../models/cardlist.dart';

class ReviewPage extends StatefulWidget {
  final CardList list;
  const ReviewPage({super.key, required this.list});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {

  @override
  Widget build(BuildContext context) {
    Flashcard card = widget.list.getRandomCard();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(getLang('titleReview')),
      ),
      body: Aspect(
        child: Center(
          child: CardWidget(card: card),
        )
      ),
      floatingActionButton: IconButton(
        onPressed: () => setState(() => card = widget.list.getRandomCard()),
        icon: Icon(Icons.arrow_right)),
    );
  }
}
