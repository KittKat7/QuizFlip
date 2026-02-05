
// Can be formatted in CSV as
// | Term | Definition | Tags
// | a    | b          | #a #d

/// A flashcard
class Card {
	/// The term for the card
	String term;
	/// The definition for the card
	String definition;
	/// The tags that apply to the card
	List<String> tags;

	/// Constructor
	Card({required this.term, required this.definition, required this.tags});
}

