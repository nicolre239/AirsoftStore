package app.servlets;

import app.database.CartItemModel;
import app.database.MysqlCon;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import app.database.GoodsModel;


public class MainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String queryString = req.getQueryString();

        //System.out.println("CHECK ARTICOOL");
        if(queryString != null) {
            MysqlCon dbConnection = new MysqlCon();
            //System.out.println("cart");
            Integer id = Integer.parseInt(queryString.replaceAll("[^0-9]", ""));
            try {
                HttpSession httpSession = req.getSession();

                if (httpSession.getAttribute("id") == id) {
                    ResultSet rs = dbConnection.executeQuery("select * from cartitem, goods where user_iduser=" + id.toString() + " and goods_idgoods = idgoods and quantity != 0;");

                    List<CartItemModel> cartItemsList = new ArrayList<CartItemModel>();
                    CartItemModel tempCart;

                    while (rs.next()) {
                        tempCart = new CartItemModel(rs.getInt(1), rs.getInt(2), rs.getInt(4), rs.getInt(7), rs.getInt(3), rs.getString(6), rs.getString(8));
                        cartItemsList.add(tempCart);
                        //System.out.println(tempCart.toString());
                        req.setAttribute("cartItemsList", cartItemsList);
                    }
                }
                else{
                    System.out.println("GOD DAMN HACKER!!!!!");
                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/error.jsp");
                    requestDispatcher.forward(req, resp);
                    return;
                }
            }  catch (SQLException e) {
                System.out.println(e.getMessage().toString());
            }
            dbConnection.CloseConnection();
        }

        List<GoodsModel> goodsList = new ArrayList<GoodsModel>();
        GoodsModel tempGood;
        MysqlCon dbConnection = new MysqlCon();

            try {
                ResultSet result = dbConnection.executeQuery("select * from goods");

                while(result.next()) {
                    tempGood = new GoodsModel(result.getInt(1), result.getString(2), result.getInt(3), result.getString(4));
                    goodsList.add(tempGood);
                    //tempGood.Print();
                    req.setAttribute("goodsList", goodsList);
                }
                //System.out.println(goodsList.size());
                dbConnection.CloseConnection();
            } catch (SQLException e) {
                System.out.println(e.getMessage().toString());
            }

        System.out.println(queryString);
        if (queryString != null && queryString.contains("popup_wrap")){
            System.out.println("WOWOWO ITSACART");
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/cart.jsp");
            requestDispatcher.forward(req, resp);
        }
        else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/main.jsp");
            requestDispatcher.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        //System.out.println("IN DO POST");
        StringBuffer jb = new StringBuffer();
        String line = null;
        //System.out.println("TRY JB");
        try {
            BufferedReader reader = req.getReader();
            while ((line = reader.readLine()) != null)
                jb.append(line);
        } catch (Exception e) { System.out.println(e.getMessage().toString()); }

        //System.out.println("CHECK ARTICOOL");
        if(jb.toString().matches("(.*)\"articool\"(.*)")){
            //System.out.println(jb);

            //System.out.println(articool);
            //System.out.println(id);

            Integer articool = Integer.parseInt(jb.toString().replaceAll(",(.+)", "").replaceAll("[^0-9]", ""));
            Integer id = Integer.parseInt(jb.toString().replaceAll("(.+),", "").replaceAll("[^0-9]", ""));
            MysqlCon dbConnection = new MysqlCon();
            try{
                int someInt = dbConnection.executeUpdate("insert into cartitem (quantity, user_iduser, goods_idgoods) values (1, " + id.toString() + ", " + articool.toString() + ");");
            } catch (SQLException e) {
                System.out.println(e.getMessage().toString());
            }
            dbConnection.CloseConnection();
        }
        else{

            Integer cartItemId = Integer.parseInt(jb.toString().replaceAll(",(.+)", "").replaceAll("[^0-9]", ""));
            Integer quantity = Integer.parseInt(jb.toString().replaceAll("(.+),", "").replaceAll("[^0-9]", ""));

            System.out.println("AMARDYTOCHANGEYA");

            MysqlCon dbConnection = new MysqlCon();
            //System.out.println("cart");
            Integer id = Integer.parseInt(jb.toString().replaceAll("[^0-9]", ""));
            try {
                //System.out.println("update cartitem set quantity = " + quantity + " where idcartitem=" + cartItemId +"; \n delete from cartitem where quantity = 0;");
                Integer rs = dbConnection.executeUpdate("update cartitem set quantity = " + quantity + " where idcartitem=" + cartItemId +";");
            }  catch (SQLException e) {
                System.out.println(e.getMessage().toString());
            }
            dbConnection.CloseConnection();
        }
    }
}
