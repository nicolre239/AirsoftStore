package app.database;
import java.sql.*;
import com.mysql.jdbc.Driver;
public class MysqlCon{
    protected Connection mysqlConnection;

    public MysqlCon() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.mysqlConnection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/mydb", "root", "123");
        }
        catch(Exception e){ System.out.println(e);}
    }
    public ResultSet executeQuery(String query) throws SQLException {
        Statement stmt=this.mysqlConnection.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        return rs;
    }

    public int executeUpdate(String query) throws SQLException {
        Statement stmt=this.mysqlConnection.createStatement();
        int rs = stmt.executeUpdate(query);
        return rs;
    }

    public void CloseConnection() {
        try {
            this.mysqlConnection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}