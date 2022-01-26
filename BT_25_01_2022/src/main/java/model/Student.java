package model;

public class Student {
    private int id ;
    private String name;
    private int age;
    private String address;
    private double avg;

    public Student(int id, String name, int age, String address, double avg) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.address = address;
        this.avg = avg;
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getAvg() {
        return avg;
    }

    public void setAvg(double avg) {
        this.avg = avg;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", address='" + address + '\'' +
                ", avg=" + avg +
                '}';
    }
}
