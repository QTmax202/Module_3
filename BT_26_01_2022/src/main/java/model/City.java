package model;

public class City {
    private int id;
    private String name;
    private double area;
    private int GDP;
    private int population;
    private String country;

    public City(int id, String name, double area, int population, int GDP, String country) {
        this.id = id;
        this.name = name;
        this.area = area;
        this.GDP = GDP;
        this.population = population;
        this.country = country;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public int getPopulation() {
        return population;
    }

    public void setPopulation(int population) {
        this.population = population;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getGDP() {
        return GDP;
    }

    public void setGDP(int GDP) {
        this.GDP = GDP;
    }

    @Override
    public String toString() {
        return "City{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", area=" + area +
                ", GDP=" + GDP +
                ", population=" + population +
                ", country='" + country + '\'' +
                '}';
    }
}

