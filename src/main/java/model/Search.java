package model;

import api.YelpApi;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.scribe.builder.ServiceBuilder;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.oauth.OAuthService;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class Search {
    OAuthService service;
    Token accessToken;
    String consumerKey = "";
    String consumerSecret = "";
    String token = "";
    String tokenSecret = "";

    public Search() {
        this.service = new ServiceBuilder().provider(YelpApi.class).apiKey(consumerKey).apiSecret(consumerSecret).build();
        this.accessToken = new Token(token, tokenSecret);
    }


    public List<Business> businessSearch(String term, double latitude, double longitude) {
        OAuthRequest request = new OAuthRequest(Verb.GET, "http://api.yelp.com/v2/search");
        request.addQuerystringParameter("term", term);
        request.addQuerystringParameter("ll", latitude + "," + longitude);
        this.service.signRequest(this.accessToken, request);
        Response response = request.send();
        JSONObject json = (JSONObject) JSONSerializer.toJSON(response.getBody());
        JSONArray businessesJson = (JSONArray) json.get("businesses");
        List<Business> businesses = new ArrayList<Business>();

        for(Object businessObject:businessesJson){
            JSONObject businessJSON = (JSONObject) businessObject;
            Business business = new Business(businessJSON.getString("name"), businessJSON.getString("image_url"));
            businesses.add(business);
        }
        return businesses;
    }

    public List<String> userReviewSearch() throws MalformedURLException, DocumentException {
        return userReviewSearch("ujbLWpurrq1MQwMsn0n6wg");
    }
    public List<String> userReviewSearch(String userId) throws MalformedURLException, DocumentException {
        SAXReader reader = new SAXReader();
        URL url = new URL("http://www.yelp.com/syndicate/user/" + userId + "/rss.xml");
        Document document = reader.read(url);
        List<Element> reviews = document.selectNodes("/rss/channel/item");
        List<String> review_text = new ArrayList<String>();
        for (Element review : reviews){
            review_text.add(review.selectSingleNode("description").getText());
        }
        return review_text;
    }
}
