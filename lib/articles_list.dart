class ArticleList {
  String status;
  int totalResults;
  List<Articles> articles;

  ArticleList({this.status, this.totalResults, this.articles});

  ArticleList.fromJson(Map<String, dynamic> newsData) {
    status = newsData['status'];
    totalResults = newsData['totalResults'];
    if (newsData['articles'] != null) {
      articles = new List<Articles>();
      newsData['articles'].forEach((v) {
        articles.add(new Articles.fromJson(v));
      });
    }
  }
}

class Articles {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  String fillerDesc = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  Articles(
      {this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content});

  Articles.fromJson(Map<String, dynamic> newsList) {
    source = newsList['source'] != null ? new Source.fromJson(newsList['source']) : "Unidentified Source";
    author = newsList["author"] == null ? "Unidentified Author" : newsList['author'];
    title = newsList['title'];
    description = newsList["description"] == null ? "$fillerDesc" : newsList['description'];
    url = newsList['url'];
    urlToImage = newsList["urlToImage"] == null? "https://via.placeholder.com/700x500.jpg?text=Image+Not+Found" : newsList["urlToImage"] ;
    publishedAt = newsList['publishedAt'];
    content = newsList['content'] == null? newsList["description"] : newsList['content'];
  }

}

class Source {
  String id;
  String name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> source) {
    id = source['id'];
    name = source['name'];
  }

}