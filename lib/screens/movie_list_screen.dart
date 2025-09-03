import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mkx/main.dart';
import 'package:mkx/screens/movie_detail_screen.dart';
import 'package:mkx/shared/silver_delegate.dart';
import 'package:mkx/models/movie.dart';
import 'package:mkx/data/movie_data.dart';
import 'package:shimmer/shimmer.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  List<Movie> movies = MovieData.movies;

  bool _isLoading = false;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<void> _refreshMovies() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      movies.shuffle();
      _isLoading = false;
    });
  }

  Widget _buildShimmerCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[800]!,
        highlightColor: Colors.grey[600]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              child: Container(
                width: double.infinity,
                height: 180,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(width: 100, height: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 5,
                    color: Colors.grey[700],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: double.infinity,
                    height: 5,
                    color: Colors.grey[700],
                  ),
                  const SizedBox(height: 4),
                  Container(width: 50, height: 5, color: Colors.grey[700]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movieflix'),
        actions: [
          IconButton(
            onPressed: () async {
              setState(() {
                isDarkMode = !isDarkMode;
              });
              // Save the preference
              await saveThemePreference(isDarkMode);
              // Update the app theme
              updateAppTheme();
            },
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _refreshMovies,
            color: Colors.red,
            backgroundColor: Colors.grey.shade800,
            strokeWidth: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _isLoading
                  ? GridView.builder(
                      itemCount: 8,
                      gridDelegate: SilverDelegate(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.62,
                      ),
                      itemBuilder: (context, index) => _buildShimmerCard(),
                    )
                  : GridView.builder(
                      itemCount: movies.length,
                      gridDelegate: SilverDelegate(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.62,
                      ),
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return GestureDetector(
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
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        movie.imageUrl,
                                        width: double.infinity,
                                        height: 180,
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Container(
                                                width: double.infinity,
                                                height: 180,
                                                color: Colors.grey.shade800,
                                                child: const Center(
                                                  child: CircularProgressIndicator(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              );
                                            },
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            width: double.infinity,
                                            height: 180,
                                            color: Colors.grey.shade800,
                                            child: const Icon(
                                              Icons.broken_image,
                                              color: Colors.white54,
                                              size: 40,
                                            ),
                                          );
                                        },
                                      ),
                                      // Rating badge
                                      Positioned(
                                        top: 8,
                                        right: 8,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.black.withValues(alpha: 0.7),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 12,
                                              ),
                                              const SizedBox(width: 2),
                                              Text(
                                                movie.rating.toString(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        movie.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Text(
                                            '${movie.year}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 6,
                                              vertical: 1,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              movie.genre,
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Theme.of(context).colorScheme.primary,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        movie.description,
                                        style: const TextStyle(fontSize: 13),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),

          // Overlay loading indicator when refreshing
        ],
      ),
    );
  }
}
