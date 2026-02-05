import 'card.dart';

/// A list of flashcards
class CardList {
	/// The cards in the list
	final List<Card> _cards;
	/// A map of the tags to their corosponding cards
	final Map<String, List<Card>> _tagMap;

	/// Constructor
	CardList({required List<Card> cards}) : _cards = [], _tagMap = {} {
		// For every card in the passed list, add it to this list
		for (Card c in cards) {
			addCard(c);
		}
	}

	/// Add [card] to the list
	void addCard(Card card) {
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

	/// Remove [card] from the list
	void removeCard(Card card) {
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

}

/// A singleton [CardList] to act as the complete list of all loaded cards
/// regardless of whether they have been filtered out or not.
class MasterList {
	/// The singleton [CardList]
	static CardList? _masterlist;

	/// Get the singleton [CardList]
	static CardList get() {
		_masterlist??=CardList(cards: []);
		return _masterlist!;
	}

	/// Set the singleton [CardList]
	static CardList set(CardList masterList) {
		_masterlist = masterList;
		return _masterlist!;
	}

}
