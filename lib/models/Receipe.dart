class Receipe {
  String receipeId;
  String title;
  String description;
  String ingredient;
  Receipe(this.receipeId, this.title, this.description, this.ingredient);
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'ingredient': ingredient
    };
  }

  factory Receipe.fromMap(String id, Map<String, dynamic> data) {
    return Receipe(id, data['title'], data['description'], data['ingredient']);
  }
}
