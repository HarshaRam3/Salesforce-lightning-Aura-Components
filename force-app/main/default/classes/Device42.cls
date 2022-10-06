public class Device42 {
    //@future(callout=true)
    public static void parseJSONResponse() {        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://myendpointtestingfree.free.beeceptor.com');
        req.setMethod('GET');
        
        // Because we didn't set the endpoint as a named credential, 
        // our code has to specify:
        // - The required username and password to access the endpoint
        // - The header and header information
        String username = 'admin';
        String password = 'adm!nd42';
        
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
        System.debug(authorizationHeader);      
        req.setHeader('Authorization', authorizationHeader);
        
        // Create a new http object to send the request object
        // A response object is generated as a result of the request  
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());
        
    }   
}