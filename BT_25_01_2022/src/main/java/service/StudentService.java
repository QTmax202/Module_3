package service;

import model.Student;

import java.util.ArrayList;

public class StudentService {
    private static final ArrayList<Student> students;

    static{
        students = new ArrayList<>();
        students.add(new Student(1, "Tran Quang Tuyen", 19, "KS-NB", 7.3));
        students.add(new Student(2, "Tran Hong fhy", 19, "HN-HN", 8.6));
        students.add(new Student(3, "Tran Bick Gem", 19, "LN-HN", 6.9));
    }

    public ArrayList<Student> getStudentList() {
        return students;
    }

    public Student getStudent(int id){
        for(Student student : students){
            if (student.getId() == id){
                return student;
            }
        }
        return null;
    }

    public void addStudent(Student student){
        students.add(student);
    }

    public void deleteStudent(Student student){
        students.remove(student);
    }

    public void editStudent(int id, Student student){
        students.set(id, student);
    }

    public ArrayList<Student> display(){
        return students;
    }

    public ArrayList<Student> sortStudentList(){
        students.sort((o1, o2) -> (int) (o1.getAvg()-o2.getAvg()));
        return students;
    }

    public ArrayList<Student> getStudentListByAvg(){
        ArrayList<Student> studentList = new ArrayList<>();;
        for(Student student : students){
            if (student.getAvg() >= 8){
                studentList.add(student);
            }
        }
        return studentList;
    }

    public ArrayList<Student> searchStudentByName(String name){
        ArrayList<Student> studentsList = new ArrayList<>();
        for(Student student : students){
            if (student.getName().equals(name)){
                studentsList.add(student);
            }
        }
        return studentsList;
    }
}
