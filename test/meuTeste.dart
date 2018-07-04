import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

printDailyNewsDigest() async {
  String news = await gatherNewsReports();
  print(news);
}

main() {
  Intl.defaultLocale = 'pt_BR';
DateTime data = DateTime.parse("2018-06-18T10:52:41");
  var formatter = new DateFormat('yyyy-MM-dd');
  String formatted = formatter.format(now);
  print(formatted); // something like 2013-04-20
print(data);

}

printWinningLotteryNumbers() {
  print('Winning lotto numbers: [23, 63, 87, 26, 2]');
}

printWeatherForecast() {
  print("Tomorrow's forecast: 70F, sunny.");
}

printBaseballScore() {
  print('Baseball score: Red Sox 10, Yankees 0');
}

// Imagine that this function is more complex and slow. :)
Future gatherNewsReports() {

  var duracao = new Duration(seconds: 5);

  print('Loading news....');

  final newsStream = new Stream.periodic(duracao, (_) => printReviews() );

  return newsStream.first;
}

// Alternatively, you can get news from a server using features
// from either dart:io or dart:html. For example:
//

printReviews() {
  String url =
      'https://www.corridaurbana.com.br/wp-json/wp/v2/posts?_embed&fields=title,link,_embedded.wp:featuredmedia&tags=66';
  //String file = 'assets/jsons/reviews.json';

  String posts = '';
  http.get(url).then((responseHttp) {

    posts = responseHttp.body;
      print(posts);
  });


}
