import 'dart:math';

import 'card.dart';

/// A list of flashcards
class CardList {
  /// The cards in the list
  final List<Flashcard> _cards;
  /// A map of the tags to their corosponding cards
  final Map<String, List<Flashcard>> _tagMap;

  /// A singleton instance of a card list, used as an unfiltered list of all
  /// cards
  static CardList? _master;

  /// Constructor
  CardList({required List<Flashcard> cards}) : _cards = [], _tagMap = {} {
    // For every card in the passed list, add it to this list
    for (Flashcard c in cards) {
      addCard(c);
    }
  }

  /// Get the master [CardList]
  static CardList getMaster() {
    _master ??= CardList(cards: []);
    return _master!;
  }

  /// Get the master list, but load it with test cards
  static CardList getMasterTest() {
    CardList ml = getMaster();

    Flashcard t1 = Flashcard(term: "Test Card 1", definition: "A definition", tags: ["testing"]);
    Flashcard t2 = Flashcard(term: "Test Card 2", definition: "B definition", tags: ["testing", "atag"]);
    Flashcard t3 = Flashcard(term: "Test Card 3", definition: "C definition", tags: ["testing/tag2", "atag"]);

    ml.addCards([t1, t2, t3]);

    return ml;
  }

  /// Returns a list of all available tags
  List<String> getTags() {
    return _tagMap.keys.toList();
  }

  /// Returns a list of all available cards
  List<Flashcard> getCards() {
    return _cards.toList();
  }

  /// Add [card] to the list
  void addCard(Flashcard card) {
    // If the card is already added, dont add it again
    if (_cards.contains(card)) return;
    // Add the card to the card list
    _cards.add(card);
    // Associate the card with all its tags in the tag map
    for (String t in card.tags) {
      // If the tag exists, add the card to that tag
      if (_tagMap.containsKey(t)) {
        _tagMap[t]!.add(card);
      }
      // Else add the tag and the card to the tag
      else {
        _tagMap[t] = [card];
      }
    }
  }

  /// Add multiple cards to the list
  void addCards(List<Flashcard> cards) {
    for (Flashcard c in cards) {
      addCard(c);
    }
  }

  /// Remove [card] from the list
  void removeCard(Flashcard card) {
    // Skip if the card is not contained
    if (!_cards.contains(card)) return;
    // Remove the card from the list
    _cards.remove(card);
    // Remove from associated tags
    for (String t in card.tags) {
      // Remove the card from a tag
      _tagMap[t]!.remove(card);
      // If there are no more cards with that tag, remove the tag
      if (_tagMap[t]!.isEmpty) {
        _tagMap.remove(t);
      }
    }
  }

  /// Filters the list by a list of tags and return the new filtered list
  CardList filterList(List<String> tagList) {
    CardList cl = CardList(cards: []);
    // For every tag in the filter list, if these is a tag in this list that
    // starts with the filter tag, add all the cards from that filter tag to
    // the new list
    for (String ft in tagList) {
      for (String lt in _tagMap.keys) {
        // For every matching card, add it to the new list
        if (lt.startsWith(ft)) {
          for (Flashcard c in _tagMap[lt]!) {
            cl.addCard(c);
          }
        }
      }
    }

    return cl;
  }

  /// Gets a card with the matching term. Throws an [Exception] if the card is
  /// not found.
  Flashcard getCard(String term) {
    for (Flashcard c in _cards) {
      if (c.term == term) return c;
    }
    throw Exception("Card Not Found!");
  }

  /// Get a random card from the list. Throws an exception if the list is empty.
  Flashcard getRandomCard() {
    int i = Random().nextInt(_cards.length);
    return _cards[i];
  }

}


