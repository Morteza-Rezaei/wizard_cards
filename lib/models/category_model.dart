class Category {
  final String title;
  final String description;
  final String imagePath;

  const Category({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

final List<Category> categories = [
  Category(
    title: "All Characters",
    description: "",
    imagePath: "assets/images/characters.jpg",
  ),
  Category(
    title: "Hogwarts Students",
    description: "",
    imagePath: "assets/images/students.jpg",
  ),
  Category(
    title: "School Staff",
    description: "",
    imagePath: "assets/images/staffs.jpg",
  ),
  Category(
    title: "Spells & Charms",
    description: "",
    imagePath: "assets/images/spells.jpg",
  ),
];
