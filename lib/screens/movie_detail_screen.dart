import 'package:flutter/material.dart';
import 'player_screen.dart';

class MovieDetailScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final double rating;
  final String genre;
  final int year;
  final String director;
  final List<String> cast;
  final int duration;

  const MovieDetailScreen({
    super.key,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white70),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 450,
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                ),
                Container(
                  width: double.infinity,
                  height: 450,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.7),
                        Colors.black,
                      ],
                      stops: const [0.4, 0.8, 1.0],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 16,
                        runSpacing: 8,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          Text(
                            '$rating/10',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade800),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              genre,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          Text(
                            '${duration ~/ 60}h ${duration % 60}m',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    context,
                    Icons.play_arrow,
                    'Play',
                    Colors.red,
                    onTap: () {
                      // Sample video URL. Replace with your real movie URL if available.
                      openPlayerScreen(
                        context,
                        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                      );
                    },
                  ),
                  _buildActionButton(
                    context,
                    Icons.add,
                    'My List',
                    Colors.grey.shade800,
                  ),
                  _buildActionButton(
                    context,
                    Icons.thumb_up_outlined,
                    'Rate',
                    Colors.grey.shade800,
                  ),
                  _buildActionButton(
                    context,
                    Icons.share,
                    'Share',
                    Colors.grey.shade800,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Overview',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),

                  const SizedBox(height: 24),
                  _buildDetailRow('Director', director),
                  _buildDetailRow('Year', year.toString()),
                  _buildDetailRow('Cast', cast.join(', ')),
                  _buildDetailRow('Genre', genre),
                  _buildDetailRow(
                    'Duration',
                    '${duration ~/ 60}h ${duration % 60}m',
                  ),
                  const SizedBox(height: 32),

                  const Text(
                    'Similar Movies',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildSimilarMovieItem(
                          context,
                          'Inception',
                          'https://image.tmdb.org/t/p/w500/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg',
                          'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
                          8.8,
                          'Sci-Fi',
                          2010,
                          'Christopher Nolan',
                          ['Leonardo DiCaprio', 'Marion Cotillard'],
                          148,
                        ),
                        _buildSimilarMovieItem(
                          context,
                          'Tenet',
                          'https://image.tmdb.org/t/p/w500/k68nPLbIST6NP96JmTxmZijEvCA.jpg',
                          'Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage.',
                          7.3,
                          'Sci-Fi',
                          2020,
                          'Christopher Nolan',
                          ['John David Washington', 'Robert Pattinson'],
                          150,
                        ),
                        _buildSimilarMovieItem(
                          context,
                          'The Matrix',
                          'https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg',
                          'A computer hacker learns from mysterious rebels about the true nature of his reality.',
                          8.7,
                          'Sci-Fi',
                          1999,
                          'The Wachowskis',
                          ['Keanu Reeves', 'Laurence Fishburne'],
                          136,
                        ),
                        _buildSimilarMovieItem(
                          context,
                          'Avatar',
                          'https://image.tmdb.org/t/p/w500/jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg',
                          'A paraplegic Marine dispatched to the moon Pandora becomes torn between following orders and protecting an alien civilization.',
                          7.8,
                          'Sci-Fi',
                          2009,
                          'James Cameron',
                          ['Sam Worthington', 'Zoe Saldana'],
                          162,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    IconData icon,
    String label,
    Color color, {
    VoidCallback? onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            padding: const EdgeInsets.all(12),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildSimilarMovieItem(
    BuildContext context,
    String title,
    String imageUrl,
    String description,
    double rating,
    String genre,
    int year,
    String director,
    List<String> cast,
    int duration,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              title: title,
              imageUrl: imageUrl,
              description: description,
              rating: rating,
              genre: genre,
              year: year,
              director: director,
              cast: cast,
              duration: duration,
            ),
          ),
        );
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                height: 150,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
