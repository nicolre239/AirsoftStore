<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" session="true" %>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Новости</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/styles_main.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/styles_news.css">

    <style type="text/css">
        h2{
            font-size: 17px;
        }
    </style>

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
            <ul  class="navbar">
                <li class="navbar-nav"><a href="#">Новости</a></li>
                <li class="navbar-nav"><a href="personal_area">Личный кабинет</a></li>
                <li class="navbar-nav"><a href="contacts">Магазины</a></li>
            </ul>
        </div>
    </header>
    <div id="main_container">
        <h1>НОВОСТИ AIRSOFT-SHOP</h1>
        <div class="news_block">
            <a href="#">
                <img src="<%= request.getContextPath() %>/images/m60tokyomarui.jpg" alt="m-60 tokyo marui" class="news_image">
                <h2>Японская Компания Tokyo Marui представила свою новую разработку
                - модель легендарного пулемета М-60. Данный привод обладает традиционной японской надежностью, функцией блокировки спуска при отсутствии шаров. Ориентировочная цена - 1500$</h2>
            </a>
        </div>
        <div class="news_block">
            <a href="#">
                <img src="<%= request.getContextPath() %>/images/romanhors.jpg" alt="m-60 tokyo marui" class="news_image">
                <h2>Выбран новый президент ФВТИ. Им становится видеоблогер Роман Хорс. Интервью с новым президентом, планы, цели, задачи.</h2>
            </a>
        </div>
        <div class="news_block">
            <a href="#">
                <img src="<%= request.getContextPath() %>/images/marty_airsoft.jpg" alt="m-60 tokyo marui" class="news_image">
                <h2> Новая книга Александра Левченко - "Путь к миллиону. История одного блогера". Спешите приобрести лимитированное издание с автографом автора, только в магазине Airoft-shop!</h2>
            </a>
        </div>
    </div>
    <footer>
        <p>Наши соцсети:</p>
        <div class="footer-icon"><a href="https://ru-ru.facebook.com/"><i class="fab fa-facebook-square"></i></a></div>
        <div class="footer-icon"><a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a></div>
        <div class="footer-icon"><a href="https://www.vk.com/"><i class="fab fa-vk"></i></a></div>
    </footer>
    <a id="up_arrow" href="#header_logo"><i class="fas fa-arrow-alt-circle-up"></i></a>
</body>
</html>