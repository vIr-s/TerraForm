package model;

import api.YelpApi;
import net.sf.json.JSONArray;
import net.sf.json.JSONException;
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
import terraform.common.Constants;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Search {
    OAuthService service;
    Token accessToken;
    String consumerKey = "mcLZtONBvmsM77PNiw94RQ";
    String consumerSecret = "rmL7-sStT4Fz5k3QMXyUXErCNdg";
    String token = "3NYqSbHFSutjilq4xC71f9AXVn_jNpms";
    String tokenSecret = "h_Deb-JvIjxXR0b4_DC_wrFb1O4";
    double currentLat, currentLong;

    public Search(String city) {
        this.service = new ServiceBuilder().provider(YelpApi.class).apiKey(consumerKey).apiSecret(consumerSecret).build();
        this.accessToken = new Token(token, tokenSecret);
        this.currentLat = Location.getDefaultLocations().get(city).getLatitude();
        this.currentLong = Location.getDefaultLocations().get(city).getLongitude();
    }


    public JSONObject termSearch(String term, double latitude, double longitude) {
        OAuthRequest request = new OAuthRequest(Verb.GET, "http://api.yelp.com/v2/search");
        request.addQuerystringParameter("term", term);
        request.addQuerystringParameter("ll", latitude + "," + longitude);
        this.service.signRequest(this.accessToken, request);
        Response response = request.send();
        return (JSONObject) JSONSerializer.toJSON(response.getBody());
    }

    public List<Business> search(List<String> terms) {
        List<Business> businesses = new ArrayList<Business>();
        for (String term : terms) {
            JSONObject json = termSearch(term, currentLat, currentLong);
            JSONObject businessJSON = ((JSONArray) json.get("businesses")).getJSONObject(0);
            String imageUrl;
            try {
                imageUrl = businessJSON.getString("image_url");
            } catch (JSONException e) {
                imageUrl = Constants.URL.DEFAULT_IMAGE_URL;
            }
            Business business = new Business(businessJSON.getString("name"), imageUrl);
            businesses.add(business);
        }
        return businesses;
    }

    public List<String> getCategories(String businessName, double latitude, double longitude) {
        JSONObject json = termSearch(businessName, latitude, longitude);
        JSONObject business = ((JSONArray) json.get("businesses")).getJSONObject(0);
        JSONArray categoriesJson = business.getJSONArray("categories");
        List<String> categories = new ArrayList<String>();
        for (Object category : categoriesJson) {
            JSONArray caseVariations = (JSONArray) category;
            categories.add((String) caseVariations.get(0));
        }
        return categories;
    }

    public List<String> userReviewFavorites() throws MalformedURLException, DocumentException {
        return userReviewFavorites("ujbLWpurrq1MQwMsn0n6wg");
    }


    public List<String> userReviewFavorites(String userId) throws MalformedURLException, DocumentException {
        List<Element> reviews = getUserReviews(userId);
        Set<String> categories = new HashSet<String>();
        for (Element review : reviews) {
            String title = review.selectSingleNode("title").getText();
            int index = title.indexOf("(");
            int rating = Integer.parseInt(title.substring(index + 1, index + 2));
            double latitude = Double.parseDouble(review.selectSingleNode("geo:lat").getText());
            double longitude = Double.parseDouble(review.selectSingleNode("geo:long").getText());
            if (rating > 3) {
                String businessName = title.substring(0, index - 1);
                categories.addAll(getCategories(businessName, latitude, longitude));
                if(categories.size() >= 5)
                    break;
            }
        }
        return (new ArrayList<String>(categories)).subList(0,5);
    }

    public List<Element> getUserReviews(String userId) throws MalformedURLException, DocumentException {
        SAXReader reader = new SAXReader();
        URL url = new URL("http://www.yelp.com/syndicate/user/" + userId + "/rss.xml");
        Document document = reader.read(url);
        return document.selectNodes("/rss/channel/item");
    }
}
