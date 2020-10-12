package app.servlets;

import app.database.GoodsModel;
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

public class PersonalAreaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/personal_area.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        //System.out.println(req.getParameter("email") + " " + req.getParameter("password"));

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        List<UsersModel> usersList = new ArrayList<UsersModel>();
        UsersModel tempUser;
        MysqlCon dbConnection = new MysqlCon();

        try {
            ResultSet result = dbConnection.executeQuery("select * from user where (login='" + email + "' and password='" + password + "');");
            while(result.next()) {
                tempUser = new UsersModel(result.getInt(1), result.getString(2), result.getString(3), result.getString(4));
                usersList.add(tempUser);
                //tempUser.Print();
            }
            dbConnection.CloseConnection();

            if (usersList.size() == 1){
                req.setAttribute("name", usersList.get(0).getName());
                req.setAttribute("id", usersList.get(0).getUserId());

                HttpSession httpSession = req.getSession();
                httpSession.setAttribute("id", usersList.get(0).getUserId());


                RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/successful_login.jsp");
                requestDispatcher.forward(req, resp);
            }
            else {
                HttpSession httpSession = req.getSession();
                httpSession.setAttribute("id", -1);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/personal_area.jsp");
                requestDispatcher.forward(req, resp);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage().toString());
        }
    }
}
