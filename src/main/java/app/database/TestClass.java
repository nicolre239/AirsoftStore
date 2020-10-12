package app.database;

public class TestClass {


    public static void main(String[] args) {
        StringBuffer jb = new StringBuffer();
        jb.append("{\"articool\":\"1110\",\"userId\":\"1\"}");
        System.out.println(jb);
        System.out.println(jb.toString().replaceAll(",(.+)", "").replaceAll("[^0-9]", ""));
        System.out.println(jb.toString().replaceAll("(.+),", "").replaceAll("[^0-9]", ""));
    }
}
