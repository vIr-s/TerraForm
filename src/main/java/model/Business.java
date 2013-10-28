package model;

public class Business {
    String name;
    String picUrl;
    String yelpUrl;
    String ratingUrl;

    public Business(String name, String picUrl, String yelpUrl, String ratingUrl){
        this.name = name;
        this.picUrl = picUrl;
        this.yelpUrl = yelpUrl;
        this.ratingUrl = ratingUrl;
    }

    public String getName(){
        return this.name;
    }

    public String getPicUrl(){
        return this.picUrl;
    }

    public String getYelpUrl(){
        return this.yelpUrl;
    }

    public String getRatingUrl(){
        return this.ratingUrl;
    }
}
