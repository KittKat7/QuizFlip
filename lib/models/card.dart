
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

	@override
	/// Override the == operator to compare card terms only
	bool operator ==(Object other) {
		return other is Card && other.term == term;
	}
	
	@override
	/// Override hashCode to get the terms hashCode
	int get hashCode => term.hashCode;
	
}

