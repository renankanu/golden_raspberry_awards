class Urls {
  static const _baseUrl = 'https://tools.texoit.com/backend-java/api/';
  static const _movies = '${_baseUrl}movies?projection=';
  static const multipleWinner = '${_movies}years-with-multiple-winners';
  static const studioWins = '${_movies}studios-with-win-count';
  static const intervalVictory = '${_movies}max-min-win-interval-for-producers';
  static const winnerByYear = '$_baseUrl?winner=true&year=';
}
