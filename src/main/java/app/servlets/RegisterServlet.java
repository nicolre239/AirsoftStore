package app.servlets;

import app.database.MysqlCon;
import app.database.UsersModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/register.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String userName = req.getParameter("userName");

        List<UsersModel> usersList = new ArrayList<UsersModel>();
        UsersModel tempUser;
        MysqlCon dbConnection = new MysqlCon();

        try {
            ResultSet resultSet = dbConnection.executeQuery("select * from user where login = '" + email + "';");
            while(resultSet.next()) {
                tempUser = new UsersModel(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4));
                usersList.add(tempUser);
            }
        }
        catch (SQLException e){
            System.out.println(e.getMessage().toString());
        }


        List<Integer> idList = new ArrayList<Integer>();
        if (usersList.size() != 0){
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("id", -2);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/register.jsp");
            requestDispatcher.forward(req, resp);
        }
        else {
            try {
                dbConnection.executeUpdate("insert into user (login, password, name) values ('" + email + "', '" + password + "', '" + userName + "');");

                ResultSet resultSet = dbConnection.executeQuery("select max(iduser) from user;");
                while (resultSet.next()){
                    idList.add(resultSet.getInt(1));
                }

                HttpSession httpSession = req.getSession();
                httpSession.setAttribute("id", idList.get(0).intValue());

                req.setAttribute("id", idList.get(0).intValue());
                req.setAttribute("name", userName);

                RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/successful_login.jsp");
                requestDispatcher.forward(req, resp);
            }
            catch (SQLException e){
                System.out.println(e.getMessage().toString());
            }
        }

        dbConnection.CloseConnection();
    }
}
