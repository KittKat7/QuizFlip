
import 'package:flutter/material.dart';
import 'package:kittkatflutterlibrary/kittkatflutterlibrary.dart';
import '/models/card.dart';
import '/pages/review_page.dart';
import '/widgets/card_widget.dart';

import '../models/cardlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late CardList list;

  @override
  void initState() {
    list = CardList.getMaster();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<String> tags = list.getFilteredTags();
    List<Widget> tagButtons = [
      // TODO Make this go up a level instead of just reseting the tag filter
      IconButton(
        onPressed: () => setState(() => list.popFilter() ),
        icon: Icon(Icons.arrow_upward_rounded))
    ];
    if (list.filter.isNotEmpty) {
      tagButtons.add(Padding(
        padding: EdgeInsetsGeometry.all(1),
        child: TextButton(child: Text('[${list.filter}]'),
        onPressed: () => setState(() {
          // list = list.filterList(t);
          // tags = list.getFilteredTags();
        }),)
      ));
    }
    for (String t in tags) {
      if (t == list.filter) continue;
      tagButtons.add(Padding(
        padding: EdgeInsetsGeometry.all(1),
        child: TextButton(child: Text(t),
        onPressed: () => setState(() {
          list = list.filterList(t);
          tags = list.getFilteredTags();
        }),)
      ));
    }

    List<Flashcard> cards = list.getFilteredCards();
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
                    genRoute(ReviewPage(list: list))),
                  child: Text(getLang('btnReview')))),
                Expanded(child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    genRoute(ReviewPage(list: list, weiver: true,))),
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
