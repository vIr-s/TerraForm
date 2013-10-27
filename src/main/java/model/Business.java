package model;

public class Business {
    String name;
    String picUrl;

    public Business(String name, String picUrl){
        this.name = name;
        this.picUrl = picUrl;
    }

    public String getName(){
        return this.name;
    }

    public String getPicUrl(){
        return this.picUrl;
    }
}
