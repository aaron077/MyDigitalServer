
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<base href="<%=basePath%>" />  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow:hidden;
}
.STYLE3 {
	font-size: 12px;
	color: #435255;
}
.STYLE4 {font-size: 12px}
.STYLE5 {font-size: 12px; font-weight: bold; }
a{ text-decoration:none; color:#000;}
-->
</style></head>
<body>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="8" bgcolor="#353c44">&nbsp;</td>
    <td width="147" valign="top">
    	<div align="center" style="margin-top:10px;">
          <table width="82%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="38"><img src="images/main_40.gif" width="28" height="28" /></td>
               <td class="STYLE4"><a href="jsp/right.jsp" target="rightcont">终端管理</a></td>
            </tr>
            <tr>
              <td height="38"><img src="images/main_46.gif" width="28" height="28" /></td>
               <td class="STYLE4"><a href="jsp/right2.jsp" target="rightcont">成绩排名统计</a></td>
            </tr>
            <tr>
              <td height="38"><img src="images/main_48.gif" width="28" height="28" / ></td>
               <td class="STYLE4"><a href="jsp/right.jsp" target="rightcont">点击统计</a></td>
            </tr>
            <tr>
              <td height="38"><img src="images/main_52.gif" width="28" height="28" /></td>
               <td class="STYLE4"><a href="jsp/right2.jsp" target="rightcont">其他</a></td>
            </tr>
          </table>
        </div>
    </td>
    <td width="10" bgcolor="#add2da">&nbsp;</td>
    <td valign="top"><iframe height="100%" width="100%" name="rightcont" id="rightcont" border="0" frameborder="0" src="jsp/right.jsp"></iframe></td>
    <td width="8" bgcolor="#353c44">&nbsp;</td>
  </tr>
</table>
</body>
</html>
