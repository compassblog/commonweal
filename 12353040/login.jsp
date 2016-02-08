<%@ page language="java"
   import="java.util.*,java.sql.*,java.net.URLEncoder,java.net.URLDecoder,mylib.*"
   contentType="text/html; charset=UTF-8"
    %>
  <%
        //登陆
        //判断是否有cookie 有的话从cookie中读取出来
        String usernameincookie = "";
        String passwordincookie = "";
        Cookie[] cookies = request.getCookies();
        if(cookies.length > 1){
          for(Cookie cookie:cookies){
             usernameincookie = cookie.getName();
             passwordincookie = cookie.getValue();
            usernameincookie = URLDecoder.decode(usernameincookie,"UTF-8");
            System.out.println(usernameincookie+"   username in cookie");
            System.out.println(passwordincookie+"   password in cookie");
          }
        }
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("user_name");
        String password = request.getParameter("password");
        String submit = request.getParameter("submit1");
        boolean success = false;
        ResultSet rs = null;
        if(!"".equals(username) && !"".equals(password) && username != null){
          if(CommonUtil.connect()){
          String sqlSentence = String.format("select * from user where username = '%s' ",username);
            System.out.println(sqlSentence);
          rs = CommonUtil.executeQuery(sqlSentence);
          int i=0;
          if(rs.next()){
            i++;
          System.out.println(rs.getString("password"));
        }
          if(i != 0 && password.equals(rs.getString("password"))){
           username = URLEncoder.encode(username,"UTF-8");
           Cookie cookieu = new Cookie(username,password);
           cookieu.setMaxAge(3600*24*7);
           cookieu.setPath("/");
           response.addCookie(cookieu);
          System.out.println("cookie success");
            success = true;  //登录成功标志
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
        <title>公益众筹登陆</title>
        <style>
        </style>
        <link href="css/common.css" rel="stylesheet"> </link>
        <link href="css/login.css" rel="stylesheet"> </link>
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
    <div class="login">
        <div class="title">
            <h2>登录</h2>
        </div>
        <form method="post" action="">
            <p>
                <input autocomplete="off" placeholder="输入昵称" name="user_name" value = "<%=usernameincookie %>"type="text">
            </p>
            <p>
                <input autocomplete="off" placeholder="输入密码" name="password" value = "<%= passwordincookie %>"type="password">
            </p>

            <div class="button">
                <button type="submit" name="submit1" value="1">登陆</button>
            </div>
        </form>
    </div>
    <div class="result">
        <%
          if(success && "1".equals(submit)){
          out.print("<h2>登陆成功!</h2>");
          username = URLDecoder.decode(username,"UTF-8");
          session.setAttribute("username",username);
          response.sendRedirect("commonweal.jsp");
          }
          if(!success && "1".equals(submit)) out.print("<h2>登陆失败!(昵称、密码不正确！)</h2>");
       %>
    </div>
    <jsp:include flush="true" page="footer.jsp"></jsp:include>
</body>
</html>
