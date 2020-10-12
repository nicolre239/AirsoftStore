<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" session="true" %>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Линчый кабинет</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/styles_main.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/styles_personal_area.css">

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
            <li class="navbar-nav"><a href="#">Личный кабинет</a></li>
            <li class="navbar-nav"><a href="contacts">Магазины</a></li>
        </ul>
    </div>
</header>
<div id="main_container">
   <form method="post">
       <p style="color: whitesmoke; font-family: Calibri; font-weight: bold">ЛИЧНЫЙ КАБИНЕТ</p>
       <input name="email" type="email" autofocus required placeholder="E-mail">
       <input name="password" type="password" required placeholder="Пароль">
       <input id="submitbutton" type="submit" value="Войти">
       <a href="register" style="font-size: 3vh">Регистрация</a>
   </form>
    <%
        if (sesssionUserId != null && sesssionUserId == -1) {
            out.println("<div style = \"display: block; width: 100%; align-content: center; text-align: center\" >");
            out.println("<P style = \"color: red; font-family: Calibri; font-weight: bold; margin-top: 0\" > НЕВЕРНЫЙ ЛОГИН ИЛИ ПАРОЛЬ</P >");
            out.println("</div >");
        }
    %>
</div>
</body>
</html>