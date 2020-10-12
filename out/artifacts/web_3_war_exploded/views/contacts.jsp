<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" session="true" %>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Контакты</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/styles_main.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/styles_contacts.css">

    <script src="https://kit.fontawesome.com/cb05544dfb.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <div id="header_logo">
            <%
                Integer sesssionUserId = (Integer) session.getAttribute("id");

                if (sesssionUserId != null) {
                    out.println("<a href=\"main?userid=" + sesssionUserId + "\">AIRS<i class=\"fas fa-crosshairs\"></i>FT-SHOP</a>");
                }
                else{
                    out.println("<a href=\"main\">AIRS<i class=\"fas fa-crosshairs\"></i>FT-SHOP</a>");
                }
            %>
        </div>
        <div>
            <ul class="navbar">
                <li class="navbar-nav"><a href="news">Новости</a></li>
                <li class="navbar-nav"><a href="personal_area">Личный кабинет</a></li>
                <li class="navbar-nav"><a href="#">Магазины</a></li>
            </ul>
        </div>
    </header>
    <div id="main_container">
        <div class="table_wrapper">
            <table border="1">
                <caption>Airosft-shop, м. Технологический институт</caption>
                <tr>
                    <th>Адрес</th>
                    <td>Москвоский проспект, д.23, метро Технологический институт</td>
                </tr>
                <tr>
                    <th>Телефон</th>
                    <td><a href="tel:8121234567" class="phone_number">(812)-123-45-67</a></td>
                </tr>
                <tr>
                    <th>Время работы</th>
                    <td>Пн - Пт: 9:00 - 21:00</td>
                </tr>
            </table>
            <img src="images/map.jpg" alt="map">
        </div>

        <div class="table_wrapper">
            <table border="1">
                <caption>Airosft-shop, м. Невский проспект</caption>
                <tr>
                    <th>Адрес</th>
                    <td>Невский проспект, д.123, метро Невский проспект, м. Гостинный двор</td>
                </tr>
                <tr>
                    <th>Телефон</th>
                    <td><a href="tel:8121234567" class="phone_number">(812)-123-45-67</a></td>
                </tr>
                <tr>
                    <th>Время работы</th>
                    <td>Пн - Пт: 9:00 - 21:00</td>
                </tr>
            </table>
            <img src="images/map.jpg" alt="map">
        </div>

    </div>
    <footer>
        <p>Мы в соцсетях:</p>
        <div class="footer-icon"><a href="https://ru-ru.facebook.com/"><i class="fab fa-facebook-square"></i></a></div>
        <div class="footer-icon"><a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a></div>
        <div class="footer-icon"><a href="https://www.vk.com/"><i class="fab fa-vk"></i></a></div>
    </footer>
    <a id="up_arrow" href="#header_logo"><i class="fas fa-arrow-alt-circle-up"></i></a>
</body>
</html>