
// Can be formatted in CSV as
// | Term | Definition | Tags
// | a    | b          | #a #d

/// A flashcard
class Flashcard {
  /// The term for the card
  String term;
  /// The definition for the card
  String definition;
  /// The tags that apply to the card
  List<String> tags;

  /// Constructor
  Flashcard({required this.term, required this.definition, required this.tags});

  /// Get the tabs as a space separated string
  String getTagsString() {
    String ts = '';
    for (String t in tags) {
      ts += '$t ';
    }
    return ts.trim();
  }

  /// Takes data from a CSV (IE List<String>, length of 3) and returns a
  /// flashcard.
  factory Flashcard.fromCSV(List<String> csv) {
    /// If the length is not long enough, discard
    if (csv.length < 3) throw Exception("TODO"); // TODO

    // Set up card fields
    String term = csv[0];
    String definition = csv[1];
    List<String> tags = [];

    // Format tags
    String tagsStr = csv[2].toLowerCase();
    tagsStr.replaceAll(' ', '');
    List<String> tagsTmp = tagsStr.split('#');

    for (String t in tagsTmp) {
      // Replace trailing '/'
      t = t.trim();
      t.replaceAll(r'/$', '');
      t.replaceAll(r'^#', '');
      t = t.trim();
      if (t.isEmpty) continue;
      t = '#$t';
      if (!tags.contains(t)) tags.add(t);
    }

    // Return the flashcard
    return Flashcard(term: term, definition: definition, tags: tags);
  }

  List<String> toCSV() {
    return [term, definition, tags.join()];
  }

  @override
  /// Override the == operator to compare card terms only
  bool operator ==(Object other) {
    return other is Flashcard && other.term == term;
  }
  
  @override
  /// Override hashCode to get the terms hashCode
  int get hashCode => term.hashCode;
  
}

