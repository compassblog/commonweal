<%@ page language="java"
   import="java.util.*,java.sql.*"
   contentType="text/html; charset=UTF-8"
%>
<%
    String usernamec = null;
    if(session.getAttribute("username") != null)
        usernamec = session.getAttribute("username").toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <title>公益众筹</title>
        <style>
        .header{
            width: 100%;
            height: 50px;
        }
        .connect{
            width:900px;
            margin-left: auto;
            margin-right: auto;
        }
        .connect p{
            font-size: 20px;
        }
        </style>
            <link href="css/common.css" rel="stylesheet"> </link>
    </head>
    <body>
        <!-- 导航栏-->
        <div class="menu">
            <div class="menu_contain">
                 <div class="menu_left">
                      <img src="img/logo.jpg">
                      <a href="/12353040/commonweal.jsp">项目</a>
                      <a href="newProject.jsp">发起项目</a>
                </div>
                <form action="searchResult.jsp" method="get">
                    <input name="search" value="" autocomplete="off" placeholder="搜索项目名称">
                    <input name="submit1" type="submit" value="">
                </form>
                <div class="menu_right">
                     <a href="serviceIntroduction.jsp">服务介绍</a>
                     <%  if(usernamec == null)
                             out.print("<a href='register.jsp'>注册</a> <a href='login.jsp'>登录</a>");
                         else{
                             out.print("<a>欢迎您</a>");
                             out.print("<a id='name'>");
                             out.print(usernamec);
                             out.print("</a>");
                             out.print("<a href='../12353040/exit.jsp'>");
                             out.print("退出");
                             out.print("</a>");
                        }
                    %>
                </div>
              </div>
        </div>

        <div class="header">
        </div>
        <div class="connect">
            <p>如果你有公益项目，需要我们的帮助，请联系我们。</p>
        </div>
        <jsp:include flush="true" page="footer.jsp"></jsp:include>
    </body>
</html>
