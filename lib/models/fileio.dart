import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';

import 'package:shared_preferences/shared_preferences.dart';
// import 'package:idb_shim/idb_io.dart';   // io

// import 'dart:';
import '/models/flashcard.dart';
import 'cardlist.dart';

late final SharedPreferences prefs;

Future<void> initializeFileStorage() async {
    prefs = await SharedPreferences.getInstance();
}

List<Flashcard> parseFromCSV(String cardsCSV) {
    final List<List<dynamic>> decodedData = csv.decode(cardsCSV);
    List<Flashcard> parsed = [];
    for (List<dynamic> c in decodedData) {
        List<String> ct = List<String>.from(c);
        if (ct[0].toLowerCase() == "term") continue;
        parsed.add(Flashcard.fromCSV(ct));
    }
    return parsed;
}

List<Flashcard> loadFlashcards() {
    String? cardsStr = prefs.getString('cardsCSV');
    if (cardsStr == null) return Flashcard.exampleList;
    return parseFromCSV(cardsStr);
}

Future<void> saveFlashcards(List<Flashcard> cards) async {
    List<List<String>> decodedData = [];
    for (Flashcard c in cards) {
      decodedData.add(c.toCSV());
    }
    String cardsCSV = csv.encode(decodedData);
    await prefs.setString('cardsCSV', cardsCSV);
}


Future<void> importFromCSV() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv']
    );

    String fileString;

    if (result != null) {
        Uint8List fileBytes = result.files.first.bytes!;
        fileString = String.fromCharCodes(fileBytes);
    } else {
        // TODO User cancelled
        throw Exception("TODO"); // TODO
    }

    CardList.getMaster().addCards(parseFromCSV(fileString));
    await saveFlashcards(CardList.getMaster().getAllCards());
}

void exportToCSV() {
    
}
