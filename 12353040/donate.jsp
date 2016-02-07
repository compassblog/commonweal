<%@ page language="java"
   import="java.util.*,java.sql.*,mylib.*"
   contentType="text/html; charset=UTF-8"
%>


<%
    //判断是否已经登陆
  String usernamec = null;
  if(session.getAttribute("username") != null)
      usernamec = session.getAttribute("username").toString();
%>
<%
  //获取到传递过来的projectId
  String projectId = "";
  projectId = request.getParameter("projectId");
  //将输入的金额 存入数据库
  int money = 0,project_id = -1;
  int sumMoney = 0,count = 0;
  String smoney = request.getParameter("money");
  String submit = request.getParameter("submit");
  boolean r = true;
  try{
      money =  Integer.parseInt(smoney);
  }catch(Exception e){
      money = 0;
   }
  try{
      project_id = Integer.parseInt(projectId);
  }catch(Exception e){
      project_id = -1;
   }
  /*被捐款项目总金额 和 捐款人次
  *查询项目已经有的金额 和 捐款的人次
  *保存在sumMoney和count中
  *在html中需要展示出来
  */
  System.out.println(projectId);
  System.out.println(project_id+"");
  if(project_id != -1 && CommonUtil.connect()){
     String sqlSentence2 = String.format("select * from item where projectId = '%d' ",project_id);
     System.out.println(sqlSentence2);
     ResultSet rs = CommonUtil.executeQuery(sqlSentence2);
     int i = 0;//查询没有返回结果的时候，需要用i来判断 rs.next()有没有结果
     if(rs.next()){
         i++;
     }
     if(i != 0){
         sumMoney = rs.getInt("sumMoney");
         System.out.println(sumMoney);
         count = rs.getInt("count");
    }
  }
  //记录捐款金额 并且 访问数据库，更新与之相关的两个表格
  if("2".equals(submit) && money != 0 && usernamec != null && project_id != -1 && CommonUtil.connect()){
      String sqlSentence1 = String.format("insert into project_money(projectId,money,username) values ('%d','%d','%s')",project_id,money,usernamec);
      System.out.println(sqlSentence1);
      CommonUtil.execute(sqlSentence1);
      sumMoney += money;
      count += 1;
      String sqlSentence3 = String.format("update item set sumMoney = '%d',count = '%d' where projectId = '%d' ",sumMoney,count,project_id);
      r =  CommonUtil.execute(sqlSentence3);
  }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="utf-8">
    <title>公益众筹捐赠</title>
    <style>
        .header{
            width: 100%;
            height: 50px;
        }
        .project_detail{
            width: 900px;
            margin-left: auto;
            margin-right: auto;
        }
        .projectId>h2>span{
            color: red;
        }
        .money >form>input{
            min-width: 150px;
            height: 28px;
            font-size: 20px;
            color: blue;
        }
        .money>form>button{
            font-size: 17px;
            padding-left: 5px;
            padding-right: 5px;
            height: 28px;
            border-radius: 5px;
            color: #fdfdff;
            background-color: blue;
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
    <!-- 填充导航栏占据的空间 -->
    <div class="header">
    </div>

    <div class="project_detail">
        <div class="projectId">
             <%
               if(usernamec == null)
                   out.print("<h2>请先登录！</h2>");
               if(!r && "2".equals(submit))
                   out.print("<h2>捐赠成功 感谢您的支持！！！</h2>");
               if(r && "2".equals(submit))
                   out.print("<h2>捐赠失败！</h2>");
              %>
              <h2>项目编号：<span><%=projectId%></span></h2>
              <h2>该项目已捐款额度：<span><%=sumMoney%></span></h2>
              <h2>您本次捐款额度：<span><%if(!r && "2".equals(submit)) out.print(money); else out.print("0"); %></span></h2>
              <h2>该项目已捐款人次总数：<span><%=count%></span></h2>
        </div>
        <div class="money">
             <form method="post" action="donate.jsp">
                 <input name="projectId" type="hidden" value="<%=projectId %>">
                 <input name="money" value="" autocomplete="off" placeholder="支持金额">元
                <button name="submit" value="2">确定</button>
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
