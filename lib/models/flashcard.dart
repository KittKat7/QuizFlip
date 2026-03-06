
// Can be formatted in CSV as
// | Term | Definition | Tags
// | a    | b          | #a #d

import 'package:kittkatflutterlibrary/lang/kkfl_lang.dart';

/// A flashcard
class Flashcard {

  static final Flashcard example1 = Flashcard(term: getLang('txtHelpCard1t'), definition: getLang('txtHelpCard1d'), tags: ["#qf-example"]);
  static final Flashcard example2 = Flashcard(term: getLang('txtHelpCard2t'), definition: getLang('txtHelpCard2d'), tags: ["#qf-example"]);
  static final Flashcard example3 = Flashcard(term: getLang('txtHelpCard3t'), definition: getLang('txtHelpCard3d'), tags: ["#qf-example"]);
  static final Flashcard example4 = Flashcard(term: getLang('txtHelpCard4t'), definition: getLang('txtHelpCard4d'), tags: ["#qf-example"]);
  static final List<Flashcard> exampleList = [
    example1,
    example2,
    example3,
    example4,
  ];


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

