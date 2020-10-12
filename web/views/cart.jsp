<%@ page import="app.database.CartItemModel" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Николай
  Date: 07.11.2019
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<CartItemModel> itemsList = (List<CartItemModel>) request.getAttribute("cartItemsList");
    if (itemsList != null && !itemsList.isEmpty()){
        for (CartItemModel item : itemsList) {
            out.println("<div class=\"cart_item\" idCartItem=\"" + item.getIdCartItem() + "\">");
            out.println("<img src=\"" + request.getContextPath() + "images/" + item.getPicture() + "\" class=\"cart_goods_image\" alt=\"" + item.getPicture() + "\">");
            out.println("<div class=\"cart_description\" >");
            out.println("<p >" + item.getInfo() + " </p >");
            out.println("<br>");
            out.println("<p class=\"price\" >" + item.getPrice() + "</p ><p class=\"price-description\" > &nbsp; р</p >");
            out.println("</div >");
            out.println("<div class=\"buy_form\" >");
            out.println("<form onsubmit = \"return false\">");
            out.println("<input name = \"number\" onchange = \"countItemCost(this)\" type = \"number\" value = \"" + item.getQuantity() + "\" min = \"0\" max = \"30\" >");
            out.println("<p class=\"price-description\" > Сумма:</p ><p class=\"cost\" >" + item.getQuantity() * item.getPrice() + "</p ><p class=\"price-description\" > &nbsp; р</p >");
            out.println("</form >");
            out.println("</div >");
            out.println("</div >");
        }


        out.println("<div class=\"total_count\">");
        out.println("<p class=\"price-description\">Итого:&nbsp;</p><p class=\"price-description\" id=\"price-total\">10 987</p><p class=\"price-description\">&nbsp;р</p>");
        out.println("</div>");
        out.println("<button class=\"order-button\">Заказать!</button>");
    }
    else{
        out.println("<h2 style=\"color: red\">Корзина пуста. Пожалуйста, залогиньтесь и наполните ее!</h2");
    }
%>