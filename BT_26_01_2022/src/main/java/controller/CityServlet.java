package controller;

import model.City;
import service.CityService;

import javax.crypto.Cipher;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CityServlet", urlPatterns = "/city")
public class CityServlet extends HttpServlet {
    private static final CityService cityService = new CityService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        controllerCity(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        controllerCity(request, response);
    }

    private void controllerCity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action ="";
        }
        switch (action){
            case "createGet":
                createGet(request, response);
                break;
            case "createPost":
                createPost(request, response);
                break;
            case "editGet":
                editControl(request, response);
                break;
            case "editPost":
                editCity(request, response);
                break;
            case "delete":
                deleteCity(request, response);
                break;
            default:
                displayAllCity(request, response);
        }
    }

    private void editCity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        City city = cityService.getCity(id);
        if (city != null){
//            city.setId(Integer.parseInt(request.getParameter("id")));
            city.setName(request.getParameter("name"));
            city.setArea(Double.parseDouble(request.getParameter("area")));
            city.setPopulation(Integer.parseInt(request.getParameter("population")));
            city.setGDP(Integer.parseInt(request.getParameter("gdp")));
            city.setCountry(request.getParameter("country"));
        }
        int index = -1;
        ArrayList<City> citys = cityService.display();
        for (int i = 0; i < citys.size(); i++) {
//            assert city != null;
            if (citys.get(i).getId() == id){
                index = i;
            }
        }
        cityService.editCity(index, city);
        citys = cityService.display();
        request.setAttribute("citys", citys);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void editControl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        City city = cityService.getCity(id);
        if (city != null){
            request.setAttribute("city", city);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    private void createPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double area = Double.parseDouble(request.getParameter("area"));
        int population = Integer.parseInt(request.getParameter("population"));
        int gdp = Integer.parseInt(request.getParameter("gdp"));
        String country = request.getParameter("country");
        cityService.addCity(new City(id, name, area, population, gdp, country));
        ArrayList<City> citys = cityService.display();
        request.setAttribute("citys", citys);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void createGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.sendRedirect("create.jsp");
    }

    private void deleteCity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        City city = cityService.getCity(id);
        if (city != null){
            cityService.deleteCity(city);
        }
        ArrayList<City> citys = cityService.display();
        request.setAttribute("citys", citys);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void displayAllCity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        ArrayList<City> citys = cityService.display();
        request.setAttribute("citys", citys);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }
}
