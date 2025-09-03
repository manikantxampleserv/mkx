import 'package:flutter/material.dart';
import '../data/movie_data.dart';
import 'movie_detail_screen.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get recent movies as "upcoming"
    final upcomingMovies = MovieData.getRecentMovies(limit: 8);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coming Soon'),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: upcomingMovies.length,
        itemBuilder: (context, index) {
          final movie = upcomingMovies[index];
          final isNew = movie.year >= 2022;
          
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 2,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(
                      title: movie.title,
                      imageUrl: movie.imageUrl,
                      description: movie.description,
                      rating: movie.rating,
                      genre: movie.genre,
                      year: movie.year,
                      director: movie.director,
                      cast: movie.cast,
                      duration: movie.duration,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Movie Poster
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            movie.imageUrl,
                            width: 100,
                            height: 150,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 100,
                                height: 150,
                                color: Colors.grey[300],
                                child: const Icon(Icons.movie, size: 40),
                              );
                            },
                          ),
                        ),
                        if (isNew)
                          Positioned(
                            top: 4,
                            left: 4,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'NEW',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    
                    // Movie Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  movie.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.notifications_outlined),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Reminder set for ${movie.title}'),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                movie.rating.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                '${movie.year}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  movie.genre,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            movie.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Director: ${movie.director}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 14,
                                color: Colors.grey[500],
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${movie.duration ~/ 60}h ${movie.duration % 60}m',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
