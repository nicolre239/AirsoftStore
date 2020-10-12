<%@ page import="app.database.GoodsModel" %>
<%@ page import="java.util.List" %>
<%@ page import="app.database.CartItemModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Главная</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/preset.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/styles_main.css">

    <script src="https://kit.fontawesome.com/cb05544dfb.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <div id="header_logo">
            <a href="#">AIRS<i class="fas fa-crosshairs"></i>FT-SHOP</a>
        </div>
        <div>
            <ul  class="navbar">
                <li class="navbar-nav"><a href="news">Новости</a></li>
                <li class="navbar-nav"><a href="personal_area">Личный кабинет</a></li>
                <li class="navbar-nav"><a href="contacts">Магазины</a></li>
            </ul>
        </div>
    </header>
    <div id="main_container">
        <h1>НАШИ НОВИНКИ</h1>
        <%
            List<GoodsModel> goodsList = (List<GoodsModel>) request.getAttribute("goodsList");

            if (goodsList != null && !goodsList.isEmpty()) {
                for (GoodsModel good : goodsList) {
                    out.println("<div class=\"new_goods_good\">");
                    out.println("<a href=\"#\">");
                    out.println("<img src=\"" + request.getContextPath() + "/images/" + good.getImage() + "\" alt=\"ak-47 tactical\" class=\"goods_image\">");
                    out.println("<h2>" + good.getDescription() + "<br>" + good.getPrice() +" р.</h2>");
                    out.println("</a>");
                    out.println("<button class=\"buy_button\" articool=\"" + good.getArticool() +"\" onclick=\"addToCart(this)\">Купить</button>");
                    out.println("</div>");
                }
            }
        %>
    </div>
    <footer>
        <p>Мы в соцсетях:</p>
        <div class="footer-icon"><a href="https://ru-ru.facebook.com/"><i class="fab fa-facebook-square"></i></a></div>
        <div class="footer-icon"><a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a></div>
        <div class="footer-icon"><a href="https://www.vk.com/"><i class="fab fa-vk"></i></a></div>

    </footer>
    <a id="up_arrow" href="#header_logo"><i class="fas fa-arrow-alt-circle-up"></i></a>
    <a id="cart" class="popupButton" onclick="showCart()"><i class="fas fa-shopping-cart"></i></a>

    <div id="popup_wrap" class="overlay">
        <div class="popup" id="popup">
        </div>
    </div>

    <script src="<%= request.getContextPath() %>/js/scripts_main.js"></script>
</body>
</html>