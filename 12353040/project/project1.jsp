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
<!-- 填充导航栏占据的空间 -->
     <div class="header">
     </div>
<!-- 展示项目内容 -->
    <div class="project_detail">
        <div class="title">
            <h2>项目编号:<span>1</span></h2>  <!--复制文件时，此处项目编号应该修改-->
            <h2>项目名称:<span>太阳升起</span></h2>
        </div>
        <div class="detail">
            <p>*************此处应该是项目详细介绍**************
               ***********************************************
               ***********************************************
               ***********************************************
            </p>
       </div>
       <div class="money">
           <form method="post" action="/12353040/donate.jsp" >
                <input name="projectId" value="1" type="hidden">  <!-- 每次添加项目需要修改这条 value=项目编号-->
                <button name="submit" value="1">我想好了，进入捐赠页面</button>
           </form>
      </div>
    </div>
<!-- 页脚 相关申明信息 -->
    <div class="footer">
        <ul>
            <li>关于公益众筹|</li>
            <li>服务介绍|</li>
            <li>隐私政策<li>
        </ul>
        <img src="../img/address.png">
        </br clear="both">
        <p>
          &copy 2016 中山大学移动web小组　commonweal.com   版权所有
        </br>
           电信与信息服务业务经营许可证123456789号　粤ICP备123456789号　粤公网安备123456789
        </p>
    </div>

</body>
</html>
