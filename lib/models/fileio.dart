import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import '/models/flashcard.dart';

Future<List<Flashcard>> importFromCSV() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv']
    );

    String fileString;

    if (result != null) {
        File file = File(result.files.single.path!);
        fileString = await file.readAsString();
    } else {
        // TODO User cancelled
        throw Exception("TODO"); // TODO
    }

    final List<List<dynamic>> decodedData = csv.decode(fileString);

    List<Flashcard> importedCards = [];
    for (List<dynamic> c in decodedData) {
        List<String> ct = List<String>.from(c);
        if (ct[0].toLowerCase() == "term") continue;
        importedCards.add(Flashcard.fromCSV(ct));
    }

    return importedCards;
}

void exportToCSV() {
  
}
