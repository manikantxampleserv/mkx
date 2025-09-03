class Movie {
  final String title;
  final String imageUrl;
  final String description;
  final double rating;
  final String genre;
  final int year;
  final String director;
  final List<String> cast;
  final int duration; // in minutes

  Movie({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.genre,
    required this.year,
    required this.director,
    required this.cast,
    required this.duration,
  });

  // Convert movie to map for easy filtering
  Map<String, dynamic> toMap() {
    return {
      'title': title.toLowerCase(),
      'description': description.toLowerCase(),
      'genre': genre.toLowerCase(),
      'director': director.toLowerCase(),
      'cast': cast.map((actor) => actor.toLowerCase()).toList(),
    };
  }

  // Check if movie matches search query
  bool matchesSearch(String query) {
    final searchTerm = query.toLowerCase();
    final movieData = toMap();
    
    return movieData['title'].contains(searchTerm) ||
           movieData['description'].contains(searchTerm) ||
           movieData['genre'].contains(searchTerm) ||
           movieData['director'].contains(searchTerm) ||
           movieData['cast'].any((actor) => actor.contains(searchTerm));
  }
}