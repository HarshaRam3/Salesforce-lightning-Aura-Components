public with sharing class GetNewsHeadlines {
private static final String URL = 'https://newsapi.org/v2/top-headlines?country=in&apiKey=13415a3258eb40cb95bec0c001cdd11e';
 //   public List<NewsWrapper> newsData {get;set;}
@AuraEnabled
public static List<NewsWrapper.Articles> getNews() {
List<NewsWrapper.Articles> newsData = new List<NewsWrapper.Articles>();
try {
Http httpCallout = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint(URL);
request.setMethod('GET');
HttpResponse response = httpCallout.send(request);
String result = response.getBody();
NewsWrapper myNewsWrapper = NewsWrapper.parse(result);
//List<NewsWrapper.Articles> newsData = new List<NewsWrapper.Articles>();

for (NewsWrapper.Articles data : myNewsWrapper.Articles)
    {
        System.debug('1-------------------------------------');
        System.debug('data'+data);
        System.debug('2-------------------------------------');

        /*NewsWrapper.Articles news = new NewWrapper.Articles();
        news.author = data.author;
        news.title = data.title;
        news.description = data.description;
        news.url = data.url;
        news.urlToImage = data.urlToImage;
        news.publishedAt = data.publishedAt;
        news.content = data.content;
        System.debug('News-----------'+news);
        newsData.add(news);
        System.debug('List of news-------'+newsData);

        String title = data.title;
        System.debug('title: '+title);
        System.debug('-=-=---=--=-=---=====---');
        newsData.add(data);
        System.debug('NEWS DATA LIST:-----'+newsData);
        System.debug('-------------------------------------');*/
    }
System.debug('-=-=-=-=-=-=-'+newsData);
//System.debug('========='+myNewsWrapper);

} catch (Exception e) {
    System.debug('exception'+e);
} 
return newsData;
}
}