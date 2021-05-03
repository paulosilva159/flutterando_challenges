class Video {
  Video({
    required this.imagePathUrl,
    this.title,
    this.author,
    this.type = 'Live',
    this.progress = 0.0,
  });

  final String imagePathUrl;
  final String? title;
  final String? author;
  final String? type;
  final double progress;
}
