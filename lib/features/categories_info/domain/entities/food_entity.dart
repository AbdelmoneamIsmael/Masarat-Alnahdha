class FoodEntity {
  final String title; // meal name
  final double rating; // rating score
  final String description; // description text
  final int hours; // preparation time (hours)
  final int minutes; // preparation time (minutes)
  final int seconds; // preparation time (seconds)
  final String dishImage,smallImage,fullImage; // dish image

  FoodEntity({
    required this.title,
    required this.rating,
    required this.description,
    this.hours = 0,
    this.minutes = 0,
    this.seconds = 0,
    required this.dishImage,
    required this.smallImage,
    required this.fullImage,
  });
}
