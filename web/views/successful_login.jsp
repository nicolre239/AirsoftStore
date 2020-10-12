<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/styles_main.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/styles_personal_area.css">

    <style type="text/css">
        .greetings{
            font-size: 3vh;
            color: whitesmoke;
            width: 80%;
            margin-left: 5%;
            text-align: center;
            margin-bottom: 1vh;
        }
        a.greetings:hover{
            color: red;
            transition: all 0.3s ease-out;
        }
    </style>
    <script src="https://kit.fontawesome.com/cb05544dfb.js" crossorigin="anonymous"></script>
</head>
<body>
<header>
    <div id="header_logo">
        <a href="main?userid=<%out.println(request.getAttribute("id"));%>">AIRS<i class="fas fa-crosshairs"></i>FT-SHOP</a>
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
    <p class="greetings">
        Добро пожаловать, <% out.println(request.getAttribute("name")); %>
    </p>
    <a class="greetings" href="main?userid=<%out.println(request.getAttribute("id"));%>">К ПОКУПКАМ!!!!</a>
</div>
</body>
</html>