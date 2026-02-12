
import 'package:flutter/material.dart';
import 'package:kittkatflutterlibrary/kittkatflutterlibrary.dart';
import 'package:kittkatflutterlibrary/lang/kkfl_lang.dart';
import 'package:kittkatflutterlibrary/widgets/src/aspect.dart';
import 'package:quizflip/models/card.dart';
import 'package:quizflip/pages/review_page.dart';
import 'package:quizflip/widgets/card_widget.dart';

import '../models/cardlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    List<String> tags = CardList.getMaster().getTags();
    List<Widget> tagButtons = [];
    for (String t in tags) {
      tagButtons.add(Padding(padding: EdgeInsetsGeometry.all(1), child: TextButton(child: Text(t), onPressed: (){},)));
    }

    List<Flashcard> cards = CardList.getMaster().getCards();
    List<Widget> cardWidgets = [];
    for (Flashcard c in cards) {
      cardWidgets.add(CardWidget(card: c));
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(getLang('titleApp')),
      ),
      body: Aspect(
        child: Center(
          child: Column(
            children: [
              Row(children: [
                Expanded(child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    genRoute(ReviewPage(list: CardList.getMaster()))),
                  child: Text(getLang('btnReview')))),
                Expanded(child: ElevatedButton(
                  onPressed: (){},
                  child: Text(getLang('btnWeiver')))),
                Expanded(child: ElevatedButton(
                  onPressed: (){},
                  child: Text(getLang('btnAddCard'))))
              ]),
              Row(children: tagButtons),
              Column(
                mainAxisSize: .min,
                children: cardWidgets,
              ),
            ],
          ),
        )
      ),
    );
  }
}
