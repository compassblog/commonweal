<%@ page language="java"
   import="java.util.*,java.sql.*,mylib.*"
   contentType="text/html; charset=UTF-8"
%>
<%      //注册
  request.setCharacterEncoding("UTF-8");
  String email =  request.getParameter("user_email");
  String username = request.getParameter("user_name");
  String password = request.getParameter("password");
  String submit = request.getParameter("submit1");
  boolean r = true;
  if(CommonUtil.connect() && email != null && username != null && password != null){
      int count = email.indexOf('@');
      if(count != -1){
          if(username.length() >0 && username.length() < 30){
              if(password.length() >= 6 && password.length() < 30){
                  System.out.println("r5");
                  String sqlSentence = String.format("insert into user(email,username,password) values ('%s','%s','%s')",email,username,password);
                  System.out.println(sqlSentence);
                  r =  CommonUtil.execute(sqlSentence);
                  System.out.println("rc");
              }
          }
     }
  }
%>
<%
  //判断是否已经登陆
  String usernamec = null;
  if(session.getAttribute("username") != null)
      usernamec = session.getAttribute("username").toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <title>公益众筹注册</title>
        <style>
        </style>
        <link href="css/common.css" rel="stylesheet"> </link>
        <link href="css/register.css" rel="stylesheet"> </link>
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
                    <%
                      if(usernamec == null)
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
        <div class="register">
            <div class="title">
                <h2>注册</h2>
            </div>
            <form method="post" action="register.jsp">
                <p>
                    <input autocomplete="off" placeholder="输入邮箱" name="user_email" type="text">
                </p>
                <p>
                    <input autocomplete="off" placeholder="昵称(唯一)"   name="user_name" type="text">
                </p>
                <p>
                    <input autocomplete="off" placeholder="密码（至少6个字符）" name="password" type="password">
                </p>
                <div class="button">
                    <button type="submit" name="submit1" value="1">提交</button>
                </div>
            </form>
        </div>
        <br/>
        <div class="result">
            <% if(!r && "1".equals(submit)) out.print("<h2>注册成功!</h2>"); %>
            <% if(r && "1".equals(submit)) out.print("<h2>注册失败!(邮箱、昵称、密码不符合要求！)</h2>"); %>
        </div>
        <jsp:include flush="true" page="footer.jsp"></jsp:include>
    </body>
</html>
