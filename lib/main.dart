import 'package:flutter/material.dart';
import 'package:mkx/shared/bottom_bar.dart';
import 'package:mkx/shared/silver_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MKX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      home: const MovieHomePage(title: 'MKX Movies'),
    );
  }
}

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key, required this.title});

  final String title;

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black12,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: GridView(
          gridDelegate: SilverDelegate(crossAxisCount: 3),
          children: const [
            MovieCard(
              title: 'Interstellar',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg',
            ),
            MovieCard(
              title: 'The Dark Knight',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
            ),
            MovieCard(
              title: 'Joker',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg',
            ),
            MovieCard(
              title: 'Avengers: Endgame',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
            ),
            MovieCard(
              title: 'Spider-Man: No Way Home',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
            ),
            MovieCard(
              title: 'Dune',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg',
            ),
            MovieCard(
              title: 'Black Panther',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/uxzzxijgPIY7slzFvMotPv8wjKA.jpg',
            ),
            MovieCard(
              title: 'Guardians of the Galaxy',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/r7vmZjiyZw9rpJMQJdXpjgiCOk9.jpg',
            ),
            MovieCard(
              title: 'Tenet',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/k68nPLbIST6NP96JmTxmZijEvCA.jpg',
            ),
            MovieCard(
              title: 'Inception',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg',
            ),
            MovieCard(
              title: 'The Matrix',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg',
            ),

            MovieCard(
              title: 'Forrest Gump',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/saHP97rTPS5eLmrLQEcANmKrsFl.jpg',
            ),
            MovieCard(
              title: 'The Shawshank Redemption',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg',
            ),
            MovieCard(
              title: 'Fight Club',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/bptfVGEQuv6vDTIMVCHjJ9Dz8PX.jpg',
            ),
            MovieCard(
              title: 'The Godfather',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
            ),
            MovieCard(
              title: 'The Lord of the Rings: The Fellowship of the Ring',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg',
            ),
            MovieCard(
              title: 'Star Wars: Episode IV - A New Hope',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg',
            ),
            MovieCard(
              title: 'The Lion King',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/sKCr78MXSLixwmZ8DyJLrpMsd15.jpg',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentPageIndex: _selectedIndex,
        handleChangeNav: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  const MovieCard({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            backgroundColor: Colors.black87,
            title: Text(title, style: const TextStyle(color: Colors.white)),
            content: Image.network(imageUrl, fit: BoxFit.cover),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Image.network(imageUrl, fit: BoxFit.cover)),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
