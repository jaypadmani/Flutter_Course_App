class Story {
  late String storyText, choice_1, choice_2;

  Story({String? storyTitle, String? choice1, String? choice2}) {
    storyText = storyTitle!;
    choice_1 = choice1!;
    choice_2 = choice2!;
  }
}
