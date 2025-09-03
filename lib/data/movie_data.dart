import '../models/movie.dart';

class MovieData {
  static final List<Movie> movies = [
    Movie(
      title: 'Interstellar',
      imageUrl: 'https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg',
      description: 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
      rating: 8.6,
      genre: 'Sci-Fi',
      year: 2014,
      director: 'Christopher Nolan',
      cast: ['Matthew McConaughey', 'Anne Hathaway', 'Jessica Chastain'],
      duration: 169,
    ),
    Movie(
      title: 'The Dark Knight',
      imageUrl: 'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
      description: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
      rating: 9.0,
      genre: 'Action',
      year: 2008,
      director: 'Christopher Nolan',
      cast: ['Christian Bale', 'Heath Ledger', 'Aaron Eckhart'],
      duration: 152,
    ),
    Movie(
      title: 'Joker',
      imageUrl: 'https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg',
      description: 'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime.',
      rating: 8.4,
      genre: 'Drama',
      year: 2019,
      director: 'Todd Phillips',
      cast: ['Joaquin Phoenix', 'Robert De Niro', 'Zazie Beetz'],
      duration: 122,
    ),
    Movie(
      title: 'Avengers: Endgame',
      imageUrl: 'https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
      description: 'After the devastating events of Avengers: Infinity War, the universe is in ruins. With the help of remaining allies, the Avengers assemble once more.',
      rating: 8.4,
      genre: 'Action',
      year: 2019,
      director: 'Anthony Russo',
      cast: ['Robert Downey Jr.', 'Chris Evans', 'Mark Ruffalo'],
      duration: 181,
    ),
    Movie(
      title: 'Spider-Man: No Way Home',
      imageUrl: 'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
      description: 'With Spider-Man\'s identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear.',
      rating: 8.2,
      genre: 'Action',
      year: 2021,
      director: 'Jon Watts',
      cast: ['Tom Holland', 'Zendaya', 'Benedict Cumberbatch'],
      duration: 148,
    ),
    Movie(
      title: 'Dune',
      imageUrl: 'https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg',
      description: 'Feature adaptation of Frank Herbert\'s science fiction novel, about the son of a noble family entrusted with the protection of the most valuable asset in the galaxy.',
      rating: 8.0,
      genre: 'Sci-Fi',
      year: 2021,
      director: 'Denis Villeneuve',
      cast: ['Timothée Chalamet', 'Rebecca Ferguson', 'Oscar Isaac'],
      duration: 155,
    ),
    Movie(
      title: 'Black Panther',
      imageUrl: 'https://image.tmdb.org/t/p/w500/uxzzxijgPIY7slzFvMotPv8wjKA.jpg',
      description: 'T\'Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and confront a challenger from his country\'s past.',
      rating: 7.3,
      genre: 'Action',
      year: 2018,
      director: 'Ryan Coogler',
      cast: ['Chadwick Boseman', 'Michael B. Jordan', 'Lupita Nyong\'o'],
      duration: 134,
    ),
    Movie(
      title: 'Guardians of the Galaxy',
      imageUrl: 'https://image.tmdb.org/t/p/w500/r7vmZjiyZw9rpJMQJdXpjgiCOk9.jpg',
      description: 'A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.',
      rating: 8.0,
      genre: 'Action',
      year: 2014,
      director: 'James Gunn',
      cast: ['Chris Pratt', 'Zoe Saldana', 'Dave Bautista'],
      duration: 121,
    ),
    Movie(
      title: 'Tenet',
      imageUrl: 'https://image.tmdb.org/t/p/w500/k68nPLbIST6NP96JmTxmZijEvCA.jpg',
      description: 'Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage.',
      rating: 7.3,
      genre: 'Sci-Fi',
      year: 2020,
      director: 'Christopher Nolan',
      cast: ['John David Washington', 'Robert Pattinson', 'Elizabeth Debicki'],
      duration: 150,
    ),
    Movie(
      title: 'Inception',
      imageUrl: 'https://image.tmdb.org/t/p/w500/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg',
      description: 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
      rating: 8.8,
      genre: 'Sci-Fi',
      year: 2010,
      director: 'Christopher Nolan',
      cast: ['Leonardo DiCaprio', 'Marion Cotillard', 'Tom Hardy'],
      duration: 148,
    ),
    Movie(
      title: 'The Matrix',
      imageUrl: 'https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg',
      description: 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.',
      rating: 8.7,
      genre: 'Sci-Fi',
      year: 1999,
      director: 'The Wachowskis',
      cast: ['Keanu Reeves', 'Laurence Fishburne', 'Carrie-Anne Moss'],
      duration: 136,
    ),
    Movie(
      title: 'Forrest Gump',
      imageUrl: 'https://image.tmdb.org/t/p/w500/saHP97rTPS5eLmrLQEcANmKrsFl.jpg',
      description: 'The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate and other historical events unfold through the perspective of an Alabama man with an IQ of 75.',
      rating: 8.8,
      genre: 'Drama',
      year: 1994,
      director: 'Robert Zemeckis',
      cast: ['Tom Hanks', 'Robin Wright', 'Gary Sinise'],
      duration: 142,
    ),
    // Adding more diverse movies
    Movie(
      title: 'Parasite',
      imageUrl: 'https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg',
      description: 'A poor family schemes to become employed by a wealthy family by infiltrating their household and posing as unrelated, highly qualified individuals.',
      rating: 8.6,
      genre: 'Thriller',
      year: 2019,
      director: 'Bong Joon-ho',
      cast: ['Song Kang-ho', 'Lee Sun-kyun', 'Cho Yeo-jeong'],
      duration: 132,
    ),
    Movie(
      title: 'The Godfather',
      imageUrl: 'https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
      description: 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.',
      rating: 9.2,
      genre: 'Crime',
      year: 1972,
      director: 'Francis Ford Coppola',
      cast: ['Marlon Brando', 'Al Pacino', 'James Caan'],
      duration: 175,
    ),
    Movie(
      title: 'Pulp Fiction',
      imageUrl: 'https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg',
      description: 'The lives of two mob hitmen, a boxer, a gangster and his wife intertwine in four tales of violence and redemption.',
      rating: 8.9,
      genre: 'Crime',
      year: 1994,
      director: 'Quentin Tarantino',
      cast: ['John Travolta', 'Uma Thurman', 'Samuel L. Jackson'],
      duration: 154,
    ),
    Movie(
      title: 'The Shawshank Redemption',
      imageUrl: 'https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg',
      description: 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
      rating: 9.3,
      genre: 'Drama',
      year: 1994,
      director: 'Frank Darabont',
      cast: ['Tim Robbins', 'Morgan Freeman', 'Bob Gunton'],
      duration: 142,
    ),
    Movie(
      title: 'Avatar',
      imageUrl: 'https://image.tmdb.org/t/p/w500/jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg',
      description: 'A paraplegic Marine dispatched to the moon Pandora on a unique mission becomes torn between following orders and protecting an alien civilization.',
      rating: 7.8,
      genre: 'Sci-Fi',
      year: 2009,
      director: 'James Cameron',
      cast: ['Sam Worthington', 'Zoe Saldana', 'Sigourney Weaver'],
      duration: 162,
    ),
    Movie(
      title: 'Top Gun: Maverick',
      imageUrl: 'https://image.tmdb.org/t/p/w500/62HCnUTziyWcpDaBO2i1DX17ljH.jpg',
      description: 'After thirty years, Maverick is still pushing the envelope as a top naval aviator, but must confront ghosts of his past when he leads TOP GUN\'s elite graduates on a mission.',
      rating: 8.3,
      genre: 'Action',
      year: 2022,
      director: 'Joseph Kosinski',
      cast: ['Tom Cruise', 'Miles Teller', 'Jennifer Connelly'],
      duration: 130,
    ),
    Movie(
      title: 'Oppenheimer',
      imageUrl: 'https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
      description: 'The story of American scientist J. Robert Oppenheimer and his role in the development of the atomic bomb.',
      rating: 8.4,
      genre: 'Biography',
      year: 2023,
      director: 'Christopher Nolan',
      cast: ['Cillian Murphy', 'Emily Blunt', 'Robert Downey Jr.'],
      duration: 180,
    ),
    Movie(
      title: 'Barbie',
      imageUrl: 'https://image.tmdb.org/t/p/w500/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg',
      description: 'Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.',
      rating: 6.9,
      genre: 'Comedy',
      year: 2023,
      director: 'Greta Gerwig',
      cast: ['Margot Robbie', 'Ryan Gosling', 'America Ferrera'],
      duration: 114,
    ),
    Movie(
      title: 'Everything Everywhere All at Once',
      imageUrl: 'https://image.tmdb.org/t/p/w500/w3LxiVYdWWRvEVdn5RYq6jIqkb1.jpg',
      description: 'An aging Chinese immigrant is swept up in an insane adventure, where she alone can save what\'s important to her by connecting with the lives she could have led.',
      rating: 7.8,
      genre: 'Adventure',
      year: 2022,
      director: 'Daniels',
      cast: ['Michelle Yeoh', 'Stephanie Hsu', 'Ke Huy Quan'],
      duration: 139,
    ),
    Movie(
      title: 'Wednesday',
      imageUrl: 'https://image.tmdb.org/t/p/w500/9PFonBhy4cQy7Jz20NpMygczOkv.jpg',
      description: 'Smart, sarcastic and a little dead inside, Wednesday Addams investigates a murder spree while navigating her years at Nevermore Academy.',
      rating: 8.1,
      genre: 'Horror',
      year: 2022,
      director: 'Tim Burton',
      cast: ['Jenna Ortega', 'Hunter Doohan', 'Percy Hynes White'],
      duration: 45, // per episode
    ),
    Movie(
      title: 'Stranger Things',
      imageUrl: 'https://image.tmdb.org/t/p/w500/49WJfeN0moxb9IPfGn8AIqMGskD.jpg',
      description: 'When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back.',
      rating: 8.7,
      genre: 'Horror',
      year: 2016,
      director: 'The Duffer Brothers',
      cast: ['Millie Bobby Brown', 'Finn Wolfhard', 'Winona Ryder'],
      duration: 50, // per episode
    ),
    Movie(
      title: 'The Queen\'s Gambit',
      imageUrl: 'https://image.tmdb.org/t/p/w500/zU0htwkhNvBQdVSIKB9s6hgVeFK.jpg',
      description: 'In a 1950s orphanage, a young girl reveals an astonishing talent for chess and begins an unlikely journey to stardom while grappling with addiction.',
      rating: 8.5,
      genre: 'Drama',
      year: 2020,
      director: 'Scott Frank',
      cast: ['Anya Taylor-Joy', 'Bill Camp', 'Marielle Heller'],
      duration: 60, // per episode
    ),
    Movie(
      title: 'Black Mirror',
      imageUrl: 'https://image.tmdb.org/t/p/w500/5UaYsGZOFhjFDwQh6GuLjjA5WNE.jpg',
      description: 'An anthology series exploring a twisted, high-tech multiverse where humanity\'s greatest innovations and darkest instincts collide.',
      rating: 8.8,
      genre: 'Sci-Fi',
      year: 2011,
      director: 'Charlie Brooker',
      cast: ['Various', 'Anthology Cast', 'Different Episodes'],
      duration: 60, // per episode
    ),
    Movie(
      title: 'The Witcher',
      imageUrl: 'https://image.tmdb.org/t/p/w500/7vjaCdMw15FEbXyLQTVa04URsPm.jpg',
      description: 'Geralt of Rivia, a solitary monster hunter, struggles to find his place in a world where people often prove more wicked than beasts.',
      rating: 8.2,
      genre: 'Fantasy',
      year: 2019,
      director: 'Lauren Schmidt Hissrich',
      cast: ['Henry Cavill', 'Anya Chalotra', 'Freya Allan'],
      duration: 60, // per episode
    ),
    Movie(
      title: 'John Wick',
      imageUrl: 'https://image.tmdb.org/t/p/w500/fZPSd91yGE9fCcCe6OoQr6E3Bev.jpg',
      description: 'An ex-hit-man comes out of retirement to track down the gangsters that took everything from him.',
      rating: 7.4,
      genre: 'Action',
      year: 2014,
      director: 'Chad Stahelski',
      cast: ['Keanu Reeves', 'Michael Nyqvist', 'Alfie Allen'],
      duration: 101,
    ),
    Movie(
      title: 'Mad Max: Fury Road',
      imageUrl: 'https://image.tmdb.org/t/p/w500/hA2ple9q4qnwxp3hKVNhroipsir.jpg',
      description: 'An apocalyptic story set in the furthest reaches of our planet, in a stark desert landscape where humanity is broken.',
      rating: 8.1,
      genre: 'Action',
      year: 2015,
      director: 'George Miller',
      cast: ['Tom Hardy', 'Charlize Theron', 'Nicholas Hoult'],
      duration: 120,
    ),
    Movie(
      title: 'La La Land',
      imageUrl: 'https://image.tmdb.org/t/p/w500/uDO8zWDhfWwoFdKS4fzkUJt0Rf0.jpg',
      description: 'While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations for the future.',
      rating: 8.0,
      genre: 'Romance',
      year: 2016,
      director: 'Damien Chazelle',
      cast: ['Ryan Gosling', 'Emma Stone', 'John Legend'],
      duration: 128,
    ),
    Movie(
      title: 'Get Out',
      imageUrl: 'https://image.tmdb.org/t/p/w500/tFXcEccSQMf3lfhfXKSU9iRBpa3.jpg',
      description: 'A young African-American visits his white girlfriend\'s parents for the weekend, where his simmering uneasiness about their reception of him eventually reaches a boiling point.',
      rating: 7.7,
      genre: 'Horror',
      year: 2017,
      director: 'Jordan Peele',
      cast: ['Daniel Kaluuya', 'Allison Williams', 'Bradley Whitford'],
      duration: 104,
    ),
  ];

  // Get movies by genre
  static List<Movie> getMoviesByGenre(String genre) {
    return movies.where((movie) => movie.genre.toLowerCase() == genre.toLowerCase()).toList();
  }

  // Get top rated movies
  static List<Movie> getTopRatedMovies({int limit = 10}) {
    final sortedMovies = List<Movie>.from(movies);
    sortedMovies.sort((a, b) => b.rating.compareTo(a.rating));
    return sortedMovies.take(limit).toList();
  }

  // Get recent movies
  static List<Movie> getRecentMovies({int limit = 10}) {
    final sortedMovies = List<Movie>.from(movies);
    sortedMovies.sort((a, b) => b.year.compareTo(a.year));
    return sortedMovies.take(limit).toList();
  }

  // Search movies
  static List<Movie> searchMovies(String query) {
    if (query.isEmpty) return movies;
    return movies.where((movie) => movie.matchesSearch(query)).toList();
  }

  // Get all genres
  static List<String> getAllGenres() {
    final genres = movies.map((movie) => movie.genre).toSet().toList();
    genres.sort();
    return genres;
  }
}
