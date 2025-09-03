import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../data/movie_data.dart';
import 'movie_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Movie> _searchResults = [];
  bool _isSearching = false;
  String _selectedGenre = 'All';

  @override
  void initState() {
    super.initState();
    _searchResults = MovieData.movies; // Show all movies initially
  }

  void _performSearch(String query) {
    setState(() {
      _isSearching = true;
    });

    // Simulate search delay for better UX
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        if (query.isEmpty) {
          _searchResults = _selectedGenre == 'All'
              ? MovieData.movies
              : MovieData.getMoviesByGenre(_selectedGenre);
        } else {
          _searchResults = MovieData.searchMovies(query);
          if (_selectedGenre != 'All') {
            _searchResults = _searchResults
                .where(
                  (movie) =>
                      movie.genre.toLowerCase() == _selectedGenre.toLowerCase(),
                )
                .toList();
          }
        }
        _isSearching = false;
      });
    });
  }

  void _filterByGenre(String genre) {
    setState(() {
      _selectedGenre = genre;
    });
    _performSearch(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final genres = ['All', ...MovieData.getAllGenres()];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movies'),
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _performSearch,
              decoration: InputDecoration(
                hintText: 'Search movies, actors, directors...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _performSearch('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: theme.cardColor,
              ),
            ),
          ),

          // Genre Filter
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: genres.length,
              itemBuilder: (context, index) {
                final genre = genres[index];
                final isSelected = genre == _selectedGenre;

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(genre),
                    selected: isSelected,
                    onSelected: (_) => _filterByGenre(genre),
                    backgroundColor: theme.cardColor,
                    selectedColor: theme.colorScheme.primary.withValues(
                      alpha: 0.2,
                    ),
                    checkmarkColor: theme.colorScheme.primary,
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // Search Results
          Expanded(
            child: _isSearching
                ? const Center(child: CircularProgressIndicator())
                : _searchResults.isEmpty
                ? _buildEmptyState()
                : _buildSearchResults(),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No movies found',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            'Try searching with different keywords',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final movie = _searchResults[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      movie.imageUrl,
                      width: 80,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 80,
                          height: 120,
                          color: Colors.grey[300],
                          child: const Icon(Icons.movie, size: 40),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Movie Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primary.withValues(alpha: 0.1),
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
                            fontSize: 13,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
