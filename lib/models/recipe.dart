class Recipe {
  final String recipeName;
  final List<String> emojiRatings;
  const Recipe({required this.recipeName, required this.emojiRatings});

  Map<String, int> emojiToValue() {
    return {"☹️": 1, "😐": 2, "🙂": 3, "😀": 4};
  }
}
