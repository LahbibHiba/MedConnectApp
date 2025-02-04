class ArticleModel {
  final String? title;
  final String? description;
  final String? image;

  const ArticleModel({
    this.title,
    this.description,
    this.image,
  });
}

List<ArticleModel> listArticles = [
  const ArticleModel(
    title: "Electronic Blood Pressure Monitor",
    description:
        "A device used to measure blood pressure and monitor it at home.",
    image: "assets/articles/image1.png",
  ),
  const ArticleModel(
    title: "Glucometer",
    description:
        "A device that measures blood glucose levels for diabetic patients.",
    image: "assets/articles/image2.png",
  ),
  const ArticleModel(
    title: "Wheelchair",
    description:
        "An essential medical equipment for people with mobility difficulties.",
    image: "assets/articles/image3.png",
  ),
  const ArticleModel(
    title: "Pulse Oximeter",
    description:
        "A small device that measures blood oxygen saturation and heart rate.",
    image: "assets/articles/image4.png",
  ),
  const ArticleModel(
    title: "Infrared Thermometer",
    description:
        "A contactless thermometer that quickly measures body temperature.",
    image: "assets/articles/image5.png",
  ),
  const ArticleModel(
    title: "Nebulizer",
    description:
        "A medical device that converts liquid medication into a fine mist for easier inhalation.",
    image: "assets/articles/image6.png",
  ),
];
