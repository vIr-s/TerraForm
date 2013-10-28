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
        locations.put("newyork", new Location(40.748328, -73.985560));
        locations.put("sanfrancisco", new Location(37.774929, -122.419416));
        return locations;
    }
}
