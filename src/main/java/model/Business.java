package model;

public class Business {
    String name;
    String picUrl;
    String yelpUrl;

    public Business(String name, String picUrl, String yelpUrl){
        this.name = name;
        this.picUrl = picUrl;
        this.yelpUrl = yelpUrl;
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
}
