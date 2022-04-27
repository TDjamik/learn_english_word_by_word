class Note {
  late String word;
  late String translation;
  late String time;

  Note({required this.word, required this.translation}) {
    time = DateTime.now().toString();
  }

  Note.fromJson(Map<String, dynamic> json) {
    word = json["word"];
    translation = json["translation"];
    time = json["time"];
  }

  Map<String, dynamic> toJson() => {
    'word': word,
    'translation': translation,
    'time': time,
  };

  @override
  String toString() {
    return "Word: $word\nTranslation: $translation";
  }
}