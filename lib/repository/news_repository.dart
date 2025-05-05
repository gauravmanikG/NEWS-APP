import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/categories_news_model.dart';
import 'package:newsapp/models/news_channel_headlines_model.dart';

class NewsRepository{
  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadLinesApi(String channelName)async{
    String url = 'https://newsapi.org/v2/top-headlines?sources=${channelName}&apiKey=d198757c84e447bd92c291fd546d6893';

    final response =await http.get(Uri.parse(url));
    if(response.statusCode ==200){
      final body = jsonDecode(response.body);
      return NewsChannelHeadlinesModel.fromJson(body);

    }
    throw Exception('Eror');

  }


  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category)async{
    String url = 'https://newsapi.org/v2/everything?q=${category}&apiKey=d198757c84e447bd92c291fd546d6893';

    final response =await http.get(Uri.parse(url));
    if(response.statusCode ==200){
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);

    }
    throw Exception('Eror');

  }
}