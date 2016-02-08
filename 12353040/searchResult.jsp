<%@ page language="java"
   import="java.util.*,java.sql.*,mylib.*"
   contentType="text/html; charset=UTF-8"
%>
<%
  //根据输入的部分项目名称 查找
  ResultSet rs = null;
  String project_name = request.getParameter("search");
      System.out.println(project_name);
      if(project_name != null && !"".equals(project_name) && CommonUtil.connect()){
          String sqlSentence = String.format("select * from item where projectName like '%%%s%%'",project_name);
          System.out.println(sqlSentence);
          rs = CommonUtil.executeQuery(sqlSentence);
      }
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
        <title>公益众筹搜索结果</title>
        <style>
            .header{
                width: 100%;
                height: 50px;
            }
            .search_result{
                width: 900px;
                margin-left: auto;
                margin-right: auto;
            }
            .search_result>a{
                font-size: 16px;
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
        <div class="search_result">
        <%
          if(rs != null ){
              int i = 0;
              while(rs.next()){
              i++;
              out.print("<h2>相关结果如下：</h2>");
              out.print("<br/>");
              int count = rs.getInt("projectId");
              out.print("<a>");
              out.print("项目编号: "+count+"  "+"项目名称： ");
              out.print("</a>");
              String projectName = rs.getString("projectName");
              String url = "../12353040/project/project"+count+".jsp";
              out.print("<a href=");
              out.print(url+">");
              out.print(projectName);
              out.print("</a>");
          }
          //返回0条返回结果
          if(i == 0){
              out.print("<h2>无相关项目！</h2>");
          }
         }
        %>
        <jsp:include flush="true" page="footer.jsp"></jsp:include>
    </body>
</html>
