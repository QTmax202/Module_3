package controller;

import model.Student;
import service.StudentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "StudentServlet", value = "/home")
public class StudentServlet extends HttpServlet {
    private final StudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action(request, response);
    }

    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        displayAllStudent(request, response);
        switch (action) {
            case "createGet":
                createGet(request, response);
                break;
            case "createPost":
                createPost(request, response);
                break;
            case "editGet":
                editController(request, response);
                break;
            case "editPost":
                editStudent(request, response);
                break;
            case "delete":
                deleteStudent(request, response);
                break;
            case "sort":
                sortStudents(request, response);
                break;
            case "great":
                greatStudents(request, response);
                break;
            case "search":
                searchStudent(request, response);
                break;
            default:
                displayAllStudent(request, response);
        }
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Student student = studentService.getStudent(id);
        if (student != null) {
            studentService.deleteStudent(student);
        }
        ArrayList<Student> students = studentService.display();
        request.setAttribute("students", students);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void editStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Student student = studentService.getStudent(id);
        if (student != null) {
            student.setName(request.getParameter("name"));
            student.setAge(Integer.parseInt(request.getParameter("age")));
            student.setAddress(request.getParameter("address"));
            student.setAvg(Double.parseDouble(request.getParameter("avg")));
        }
        int index = -1;
        ArrayList<Student> students = studentService.display();
        for (int i = 0; i < students.size(); i++) {
            if (student != null && students.get(i).getId() == student.getId()) {
                index = i;
            }
        }
        studentService.editStudent(index, student);
        students = studentService.display();
        request.setAttribute("students", students);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void editController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Student student = studentService.getStudent(id);
        if (student != null) {
            request.setAttribute("student", student);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    private void searchStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search-name");
        ArrayList<Student> students = studentService.searchStudentByName(search);
        request.setAttribute("students", students);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void greatStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Student> students = studentService.getStudentListByAvg();
        request.setAttribute("students", students);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void sortStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Student> students = studentService.sortStudentList();
        request.setAttribute("students", students);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void createPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");
        double avg = Double.parseDouble(request.getParameter("avg"));
        studentService.addStudent(new Student(id, name, age, address, avg));
        ArrayList<Student> students = studentService.getStudentList();
        request.setAttribute("students", students);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void createGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("create.jsp");
    }

    private void displayAllStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Student> students = studentService.getStudentList();
        request.setAttribute("students", students);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }
}
