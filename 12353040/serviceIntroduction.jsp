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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
  <meta charset="utf-8">
  <title>公益众筹服务介绍</title>
  <style>
  </style>
    <link href="css/common.css" rel="stylesheet"> </link>
    <link href="css/serviceIntroduction.css" rel="stylesheet"> </link>
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
<div float="clear">
</div>


<div class="header">
  <img src="img/bg_introduce.png"></img>
</div>

<!-- 页脚 相关申明信息 -->
<div class="footer">
     <ul>
         <li>关于公益众筹|</li>
         <li>服务介绍|</li>
         <li>隐私政策<li>
     </ul>
     <img src="img/address.png">
     </br clear="both">
     <p>
         &copy 2016 中山大学移动web小组　commonweal.com   版权所有
     </br>
         电信与信息服务业务经营许可证123456789号　粤ICP备123456789号　粤公网安备123456789
     </p>
 </div>
</body>
</html>