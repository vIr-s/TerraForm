package model;

import java.util.HashMap;
import java.util.Map;

public class Location {
    double latitude, longitude;

    public Location(double latitude, double longitude){
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public double getLatitude(){
        return this.latitude;
    }

    public double getLongitude(){
        return this.longitude;
    }

    public static final Map<String, Location> getDefaultLocations(){
        Map<String, Location> locations = new HashMap<String, Location>();
        locations.put("atlanta", new Location(33.777889, -84.408485));
        locations.put("new_york", new Location(40.748328, -73.985560));
        locations.put("san_francisco", new Location(37.774929, -122.419416));
        locations.put("los_angels", new Location(34.052234, -118.243685));
        locations.put("washington_dc", new Location(38.907231, -77.036464));
        locations.put("austin", new Location(30.267153, -97.743061));
        locations.put("seattle", new Location(47.606209, -122.332071));
        locations.put("miami", new Location(25.788969, -80.226439));
        locations.put("new_orleans", new Location(29.951066, -90.071532));
        locations.put("portland", new Location(45.523452, -122.676207));
        locations.put("london", new Location(51.511214, -0.119824));
        return locations;
    }
}
