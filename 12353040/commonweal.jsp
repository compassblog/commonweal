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
     <title>公益众筹</title>
     <style>
     </style>
     <link href="css/common.css" rel="stylesheet"> </link>
     <link href="css/commonweal.css" rel="stylesheet"></link>
     <script type="text/javascript">
            /*  function webexit() {
                    if(confirm("您确定要退出吗？")){
                        System.out.print("clicked!")
                        top.location = "./commonweal.jsp";
                    }
                    return false;
                }
         */
    </script>
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
                         // out.print("<a onclick='webexit()'' href='javascript:window.opener=null;%20window.close();'>");
                         out.print("<a href='../12353040/exit.jsp'>");
                         out.print("退出");
                         out.print("</a>");
                    }
                %>
            </div>
          </div>
    </div>

    <div class="slide">
         <img src="img/big_1024_1.jpg"></img>
    </div>
    <!-- 用来分割的背景色 -->
    <div class="mid">
    </div>
    <div class="project">
         <div class="project00">
              <p>项目编号：<span>0</span></p>
              <p>项目名称:<span>太阳升起</span></p>
              <a href="project/project0.jsp">给***地区的人一些捐赠</a>
        </div>
        <div class="project01">
             <p>项目编号：<span>1</span></p>
             <p>项目名称:<span>雏鸟起飞</span></p>
             <a href="project/project1.jsp">给***地区的人一些祝福</a>
        </div>
        <div class="project02">
             <p>项目编号：<span>2</span></p>
             <p>项目名称:<span>树叶新发</span></p>
             <a href="project/project2.jsp">给***地区的人一些温暖</a>
        </div>
        <div class="project03">
             <p>项目编号：<span>3</span></p>
             <p>项目名称:<span>青草破土</span></p>
             <a href="project/project3.jsp">给***地区的人一些支援</a>
        </div>
     </div>
     <jsp:include flush="true" page="footer.jsp"></jsp:include>
</body>
</html>
