public with sharing class newsWrapperFullClass {
        private static final String URL = 'https://newsapi.org/v2/top-headlines?country=in&apiKey=13415a3258eb40cb95bec0c001cdd11e';
         //   public List<NewsWrapper> newsData {get;set;}
        @AuraEnabled
        public static NewsWrapper getNews() {
        NewsWrapper newsData = new NewsWrapper();
        try {
        Http httpCallout = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(URL);
        request.setMethod('GET');
        HttpResponse response = httpCallout.send(request);
        String result = response.getBody();
        NewsWrapper myNewsWrapper = NewsWrapper.parse(result);
        //List<NewsWrapper.Articles> newsData = new List<NewsWrapper.Articles>(); 
        newsData = myNewsWrapper;  
        } catch (Exception e) {
            System.debug('exception'+e);
        } 
        System.debug('newsData======='+newsData);
        return newsData;
        }
        }