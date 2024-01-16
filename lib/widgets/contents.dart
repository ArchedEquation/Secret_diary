class UnbordingContent {
  String image;
  String title;
  String description;

  UnbordingContent(
      {required this.image, required this.title, required this.description});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Write down your frustation',
      image: 'assets/images/arch-cat.png',
      description:
          "Vent out your frustation , or write down your  best moments of the day  "
          "all in one spot only , Write anything , anywhere and store your notes like a virtual diary "
          "NO NEED TO HESITATE "),
  UnbordingContent(
      title: 'Random Quote Generator',
      image: 'assets/images/quote-cat.png',
      description: "No need to feel low anymore "
          "USe our random quote generator to keep moving through your day "
          "our carefully selected funny and positive quotes are what you require the most "),
  UnbordingContent(
      title: 'Undecided feature',
      image: 'assets/images/user-cat.png',
      description:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
];
