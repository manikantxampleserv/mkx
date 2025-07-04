import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mkx/screens/movie_detail_screen.dart';
import 'package:mkx/shared/silver_delegate.dart';
import 'package:shimmer/shimmer.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final List<Map<String, String>> movies = [
    {
      'title': 'Interstellar',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg',
      'description':
          'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
    },
    {
      'title': 'The Dark Knight',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
      'description':
          'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
    },
    {
      'title': 'Joker',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg',
      'description':
          'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.',
    },
    {
      'title': 'Avengers: Endgame',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
      'description':
          'After the devastating events of Avengers: Infinity War, the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos\' actions and restore balance to the universe.',
    },
    {
      'title': 'Spider-Man: No Way Home',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
      'description':
          'With Spider-Man\'s identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.',
    },
    {
      'title': 'Dune',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg',
      'description':
          'Feature adaptation of Frank Herbert\'s science fiction novel, about the son of a noble family entrusted with the protection of the most valuable asset and most vital element in the galaxy.',
    },
    {
      'title': 'Black Panther',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/uxzzxijgPIY7slzFvMotPv8wjKA.jpg',
      'description':
          'T\'Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and must confront a challenger from his country\'s past.',
    },
    {
      'title': 'Guardians of the Galaxy',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/r7vmZjiyZw9rpJMQJdXpjgiCOk9.jpg',
      'description':
          'A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.',
    },
    {
      'title': 'Tenet',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/k68nPLbIST6NP96JmTxmZijEvCA.jpg',
      'description':
          'Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.',
    },
    {
      'title': 'Inception',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg',
      'description':
          'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
    },
    {
      'title': 'The Matrix',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg',
      'description':
          'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.',
    },
    {
      'title': 'Forrest Gump',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/saHP97rTPS5eLmrLQEcANmKrsFl.jpg',
      'description':
          'The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate and other historical events unfold through the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.',
    },
  ];

  bool _isLoading = false;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  // Simulates fetching data from an API
  Future<void> _refreshMovies() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Shuffle the movies list to simulate new data
    setState(() {
      movies.shuffle();
      _isLoading = false;
    });

    // Show a snackbar to indicate refresh is complete
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Movies refreshed!'),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _buildShimmerCard() {
    return Card(
      elevation: 0,
      color: Colors.white10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[800]!,
        highlightColor: Colors.grey[600]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
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
                    height: 12,
                    color: Colors.grey[700],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: double.infinity,
                    height: 12,
                    color: Colors.grey[700],
                  ),
                  const SizedBox(height: 4),
                  Container(width: 120, height: 12, color: Colors.grey[700]),
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
            icon: const Icon(Icons.refresh),
            onPressed: _isLoading
                ? null
                : () {
                    _refreshIndicatorKey.currentState?.show();
                  },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Main content with pull-to-refresh
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
                        childAspectRatio: 0.62,
                      ),
                      itemBuilder: (context, index) => _buildShimmerCard(),
                    )
                  : GridView.builder(
                      itemCount: movies.length,
                      gridDelegate: SilverDelegate(
                        crossAxisCount: 2,
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
                                  title: movie['title']!,
                                  imageUrl: movie['imageUrl']!,
                                  description: movie['description']!,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 0,
                            color: Colors.white10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                  child: Image.network(
                                    movie['imageUrl']!,
                                    width: double.infinity,
                                    height: 180,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
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
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Text(
                                    movie['title']!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Text(
                                    movie['description']!,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
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
          if (_isLoading)
            Container(
              color: Colors.black54,
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.red,
                      strokeWidth: 3,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Updating movies...',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
