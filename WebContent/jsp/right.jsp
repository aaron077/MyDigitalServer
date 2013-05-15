<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
.inputsty1{ width:98%; text-align:center; margin:0 auto;}
.disedit{ border:none; color:#000000;}
img,input{ vertical-align:middle;}
.search_div{ font-size:12px; padding:10px;}
.search_div label{ padding:0 5px;}
-->
</style>

	<script src="js/socket.io/socket.io.js"></script>
    <script src="js/moment.min.js"></script>
    <script src="js/jquery-1.7.2.min.js"></script>
    
    <script >
	    var userName = 'user' + Math.floor((Math.random()*1000)+1);
	
		var socket =  io.connect('http://localhost:9092');
	

		socket.on('qryinfoevent', function(data) {
			alert(data.clientName);
		});
		
		function qryInfoEvent() {
            var clientName = $('#clientName').val();
            var company = $('#company').val();
            var startTime = $('#startTime').val();
            var endTime = $('#endTime').val();
            var region = $('#region').val();
            // don't forget to define type field '@class' 
            // it should equals to class name which used 
            // to deserialize object on server side
            // via ...addJsonObjectListener() method
            //
            // TIP: you can customize type name field
         // via Configuration.jsonTypeFieldName property

                     socket.emit('qryinfoevent', {clientName: clientName, 
       				  company: company,
    				  startTime: startTime, 
    				  endTime: endTime,
    				  region:region});

}

		
    </script>
</head>
<body>
    <div class="search_div">
        <form>
            <label>终端名称:<input type="text" name="clientName" id="clientName"/></label>
            <label>所属单位:<select name="company" id="company"><option>1222222</option><option>22222222</option></select></label>
            <label>开始时间:<input type="text" name="startTime" id="startTime" onClick="WdatePicker()" style="width:100px;"></label>
            <label>结束时间:<input type="text" name="endTime" id="endTime" onClick="WdatePicker()" style="width:100px;"></label>
            <label>地区:<input type="text" name="region" id="region"/></label>       
            <label><input type="button" value="查询" onClick="qryInfoEvent()"/></label>
        </form>
    </div>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr bgcolor="#353c44">
                    <td width="45%" align="left" height="22" valign="center"><div align="left" style="padding-left:10px;"><img src="images/tb.gif" width="14" height="14" /><span class="STYLE1"> 终端管理</span></div></td>
                    <td align="right"><div align="right"><span class="STYLE1" onclick="addTrLine()">
                 <img src="images/add.gif" width="10" height="10" /> 添加</span>   &nbsp; <span class="STYLE1" onclick="delallTr()"><img src="images/del.gif" width="10" height="10" /> 删除</span>    &nbsp;&nbsp;</div></td>
                </tr>
             </table>
          </td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"  onmouseout="changeback()" id="tablemain">
          <tr>
            <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
              <input type="checkbox" name="checkbox" class="allcheckbox" id="checkbox" />
            </div></td>
            <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">用户名</span></div></td>
            <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">用户角色</span></div></td>
            <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">联系方式</span></div></td>
            <td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">IP地址</span></div></td>
            <td width="27%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">详细描述</span></div></td>
            <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">基本操作</span></div></td>
          </tr>
          <tr class="sel_tr">
            <td height="20" bgcolor="#FFFFFF"><div align="center">
              <input type="checkbox" name="checkbox3" class="checkboxs"  />
            </div></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1 disedit" value="admin" readonly="readonly" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1 disedit" value="系统管理员"readonly="readonly" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1 disedit" value="123156465" readonly="readonly" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1 disedit" value="192.11.251.21" readonly="readonly" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1 disedit" value="用户可以对系统的所有操作进行管理" readonly="readonly" /></td>
            <td height="20" bgcolor="#FFFFFF" align="center"><a class="STYLE21" href="javascript:void(0)" onclick="editthisTd(this)">编辑</a><a class="STYLE21" href="javascript:void(0)" onclick="savethisTd(this)" style="display:none;">保存</a> | <a class="STYLE21 a_delbtn" href="javascript:void(0)" onclick="delectLine(this)">删除</a></td>
          </tr>
          <tr class="sel_tr">
            <td height="20" bgcolor="#FFFFFF"><div align="center">
              <input type="checkbox" name="checkbox5" class="checkboxs"  />
            </div></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1 disedit" value="admin" readonly="readonly" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1 disedit" value="系统管理员"readonly="readonly" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1 disedit" value="123156465" readonly="readonly" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1 disedit" value="192.11.251.21" readonly="readonly" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1 disedit" value="用户可以对系统的所有操作进行管理" readonly="readonly" /></td>
            <td height="20" bgcolor="#FFFFFF" align="center"><a class="STYLE21" href="javascript:void(0)" onclick="editthisTd(this)">编辑</a><a class="STYLE21" href="javascript:void(0)" onclick="savethisTd(this)" style="display:none;">保存</a> | <a class="STYLE21 a_delbtn" href="javascript:void(0)" onclick="delectLine(this)">删除</a></td>
          </tr>
          <tr class="sel_tr">
            <td height="20" bgcolor="#FFFFFF"><div align="center">
              <input type="checkbox" name="checkbox10" class="checkboxs" />
            </div></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1 disedit" value="admin" readonly="readonly" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1 disedit" value="系统管理员"readonly="readonly" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1 disedit" value="123156465" readonly="readonly" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1 disedit" value="192.11.251.21" readonly="readonly" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1 disedit" value="用户可以对系统的所有操作进行管理" readonly="readonly" /></td>
            <td height="20" bgcolor="#FFFFFF" align="center"><a class="STYLE21" href="javascript:void(0)" onclick="editthisTd(this)">编辑</a><a class="STYLE21" href="javascript:void(0)" onclick="savethisTd(this)" style="display:none;">保存</a> | <a class="STYLE21 a_delbtn" href="javascript:void(0)" onclick="delectLine(this)">删除</a></td>
          </tr>
          <tr class="sel_tr">
            <td height="20" bgcolor="#FFFFFF"><div align="center">
              <input type="checkbox" name="checkbox10" class="checkboxs" />
            </div></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1" value="" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1" value="" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1" value="" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1" value="" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1" value="" /></td>
            <td height="20" bgcolor="#FFFFFF" align="center"><a class="STYLE21" href="javascript:void(0)" onclick="editthisTd(this)" style="display:none;">编辑</a><a class="STYLE21" href="javascript:void(0)" onclick="savethisTd(this)">保存</a> | <a class="STYLE21 a_delbtn" href="javascript:void(0)" onclick="delectLine(this)">删除</a></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="33%"><div align="left"><span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong> 243</strong> 条记录，当前第<strong> 1</strong> 页，共 <strong>10</strong> 页</span></div></td>
            <td width="67%"><table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="49"><div align="center"><img src="images/main_54.gif" width="40" height="15" alt="首页" /></div></td>
                <td width="49"><div align="center"><img src="images/main_56.gif" width="45" height="15" alt="上一页" /></div></td>
                <td width="49"><div align="center"><img src="images/main_58.gif" width="45" height="15" alt="下一页" /></div></td>
                <td width="49"><div align="center"><img src="images/main_60.gif" width="40" height="15" alt="尾页" /></div></td>
                <td width="37" class="STYLE22"><div align="center">转到</div></td>
                <td width="22"><div align="center">
                  <input type="text" name="textfield" id="textfield"  style="width:20px; height:12px; font-size:12px; border:solid 1px #7aaebd;"/>
                </div></td>
                <td width="22" class="STYLE22"><div align="center">页</div></td>
                <td width="35"><img src="images/main_62.gif" width="26" height="15" /></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table>
    
    <table style="display:none;" class="copymodel">
        <tr class="sel_tr">
            <td height="20" bgcolor="#FFFFFF"><div align="center">
              <input type="checkbox" name="checkbox10" class="checkboxs" />
            </div></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1" value="" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1" value="" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1" value="" /></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1" value=""/></td>
            <td height="20" bgcolor="#FFFFFF" class="STYLE19"><input type="text" class="inputsty1" value="" /></td>
            <td height="20" bgcolor="#FFFFFF" align="center"><a class="STYLE21" href="javascript:void(0)" onclick="editthisTd(this)" style="display:none;">编辑</a><a class="STYLE21" href="javascript:void(0)" onclick="savethisTd(this)">保存</a> | <a class="STYLE21 a_delbtn" href="javascript:void(0)" onclick="delectLine(this)">删除</a></td>
          </tr>
    </table>
    <script language="javascript" type="text/javascript" src="<%=basePath%>/js/My97DatePicker/WdatePicker.js"></script>
</body>

<script>
var  highlightcolor='#d5f4fe';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
//add by LQH
//新增行
function addTrLine(){
	$(".copymodel tr").clone().appendTo("#tablemain");
	}
//删除行
function delectLine(objthis){
	$(objthis).parents('tr.sel_tr').remove();
	}
//保存
function savethisTd(objthis){
	$(objthis).parent().parent().children('td').children('input.inputsty1').addClass('disedit').attr("readonly","readonly");
	$(objthis).prev().show();
	$(objthis).hide();
	}
//编辑
function editthisTd(objthis){
	$(objthis).parent().parent().children('td').children('input.inputsty1').removeClass('disedit').attr("readonly","");
	$(objthis).next().show();
	$(objthis).hide();
	}
//删除所有
function delallTr(){
	$('.checkboxs').each(function(){
								  if($(this).attr('checked')==true){
									  $(this).parent().parent().parent().find('.a_delbtn').click();
									  }
								  })
	

	}
$(document).ready(function(){
						   $('.allcheckbox').click(function(){
														  if($(this).attr('checked')==true){
															  $(".checkboxs").each(function(){$(this).attr('checked',true);})
															  							}else{$(".checkboxs").each(function(){$(this).attr('checked',false);})
																							}
														   })
						   $('.checkboxs').each(function(){
														 $(this).click(function(){
																				if($(this).attr('checked')==false){
																					$('.allcheckbox').attr('checked',false)
																					}
																				})
														 })
						   
						   })
</script>

</html>
