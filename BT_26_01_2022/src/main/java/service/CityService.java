package service;

import model.City;

import java.util.ArrayList;

public class CityService {
    private static final ArrayList<City> citys;

    static{
        citys = new ArrayList<>();
        citys.add(new City(1, "Ha Noi", 360, 1000000, 10200, "VN"));
        citys.add(new City(2, "LonDon", 222, 55555, 22222, "ENG"));
        citys.add(new City(3, "BKK", 360, 10000000, 22200, "TQ"));
    }
//
//    private ArrayList<City> getCityList() {
//        return citys;
//    }

    public City getCity(int id){
        for(City city : citys){
            if (city.getId() == id){
                return city;
            }
        }
        return null;
    }

    public void addCity(City city){
        citys.add(city);
    }

    public void deleteCity(City city){
        citys.remove(city);
    }

    public void editCity(int id, City city){
        citys.set(id, city);
    }

    public ArrayList<City> display(){
        return citys;
    }
}
