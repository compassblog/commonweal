<%@ page language="java"
   import="java.util.*,java.sql.*"
   contentType="text/html; charset=UTF-8"
%>

<%
  //判断是否已经登陆
  String usernamec = null;
  if(session.getAttribute("username") != null)
      usernamec = session.getAttribute("username").toString();
%>

<%
  //清空session 并且跳转回主页
  session.invalidate();
  response.sendRedirect("../12353040/commonweal.jsp");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="utf-8">
    <title>公益众筹项目</title>
    <style>
    </style>
    <link href="../css/common.css" rel="stylesheet"> </link>
    <link href="../css/project.css" rel="stylesheet"></link>
</head>
<body>
    <!-- 导航栏 -->
    <div class="menu">
       <div class="menu_contain">
          <div class="menu_left">
              <img src="../img/logo.jpg">
              <a href="/12353040/commonweal.jsp">项目</a>
              <a href="/12353040/newProject.jsp">发起项目</a>

          </div>
          <form action="/12353040/searchResult.jsp" method="get">
              <input name="search" value="" autocomplete="off" placeholder="搜索项目名称">
              <input name="submit1" type="submit" value="">
          </form>
          <div class="menu_right">
             <a href="/12353040/serviceIntroduction.jsp">服务介绍</a>
             <% //已登录 和 未登录展示不一样
             if(usernamec == null)
                    out.print("<a href='/12353040/register.jsp'>注册</a> <a href='/12353040/login.jsp'>登录</a>");
                else{
                    out.print("<a>欢迎您</a>");
                    out.print("<a id='name'>");
                    out.print(usernamec);
                    out.print("</a>");
                    out.print("<a href='/12353040/exit.jsp'>");
                    out.print("退出");
                    out.print("</a>");
                  }
              %>
          </div>
        </div>
     </div>
     <div class="header">
     </div>
     <jsp:include flush="true" page="footer.jsp"></jsp:include>
</body>
</html>
