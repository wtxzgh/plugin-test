<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache"/>
<meta HTTP-EQUIV="Expires" CONTENT="-1"/>
<link rel="shortcut icon" href="images/favicon.png"/>
<link rel="icon" href="images/favicon.png"/>
<title>软件中心 - WOL排程</title>
<link rel="stylesheet" type="text/css" href="index_style.css"/>
<link rel="stylesheet" type="text/css" href="form_style.css"/>
<link rel="stylesheet" type="text/css" href="usp_style.css"/>
<link rel="stylesheet" type="text/css" href="ParentalControl.css">
<link rel="stylesheet" type="text/css" href="css/icon.css">
<link rel="stylesheet" type="text/css" href="css/element.css">
<script type="text/javascript" src="/state.js"></script>
<script type="text/javascript" src="/popup.js"></script>
<script type="text/javascript" src="/help.js"></script>
<script type="text/javascript" src="/validator.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/general.js"></script>
<script type="text/javascript" src="/switcherplugin/jquery.iphone-switch.js"></script>
<script language="JavaScript" type="text/javascript" src="/client_function.js"></script>
<script type="text/javascript" src="/dbconf?p=wol_sch_&v=<% uptime(); %>"></script>
<script>
var $j = jQuery.noConflict();
function init() {
show_menu();
buildswitch();
version_show();
generate_options();
var rrt = document.getElementById("switch");
if (document.form.wol_sch_enable.value != "1") {
rrt.checked = false;
} else {
rrt.checked = true;
}
}
function done_validating() {
	return true;
//refreshpage(5);
}
function buildswitch(){
    $j("#switch").click(
    function(){
      if(document.getElementById('switch').checked){
          document.form.wol_sch_enable.value = 1;
          document.getElementById("wol_sch_table").style.display = "";
        }else{
          document.form.wol_sch_enable.value = 0;
	      document.getElementById("wol_sch_table").style.display = "none";
        }
    });
}
function onSubmitCtrl(o, s) {
document.form.action_mode.value = s;
showLoading(3);
document.form.submit();
}
function reload_Soft_Center(){
location.href = "/Main_Soft_center.asp";
}
function update_visibility(){
	if(db_wol_sch["wol_sch_enable"] == "1"){
		document.getElementById("wol_sch_table").style.display = "";
	}else{
		document.getElementById("wol_sch_table").style.display = "none";
	}
}
function generate_options(){
	for(var i = 0; i < 24; i++) {
		$j("#wol_sch_rule_hour").append("<option value='"  + i + "'>" + i + "</option>");
		}
	for(var i = 0; i < 60; i++) {
		$j("#wol_sch_rule_min").append("<option value='"  + i + "'>" + i + "</option>");
		}
}
function setClientIP(_macaddr){
document.form.wollist_macAddr.value = _macaddr;
hideClients_Block();
}
function hideClients_Block(){
document.getElementById("pull_arrow").src = "/images/arrow-down.gif";
document.getElementById('ClientList_Block_PC').style.display='none';
}
function pullLANIPList(obj){
var element = document.getElementById('ClientList_Block_PC');
var isMenuopen = element.offsetWidth > 0 || element.offsetHeight > 0;
if(isMenuopen == 0){
obj.src = "/images/arrow-top.gif"
element.style.display = 'block';
document.form.wollist_macAddr.focus();
}
else
hideClients_Block();
}
</script>
</head>
<body onload="init();">
<div id="TopBanner"></div>
<div id="Loading" class="popup_bg"></div>
<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>
<form method="POST" name="form" action="/applydb.cgi?p=wol_sch_" target="hidden_frame">
<input type="hidden" name="current_page" value="Module_wol_sch.asp"/>
<input type="hidden" name="next_page" value="Module_wol_sch.asp"/>
<input type="hidden" name="group_id" value=""/>
<input type="hidden" name="modified" value="0"/>
<input type="hidden" name="action_mode" value=""/>
<input type="hidden" name="action_script" value=""/>
<input type="hidden" name="action_wait" value="5"/>
<input type="hidden" name="first_time" value=""/>
<input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get("preferred_lang"); %>"/>
<input type="hidden" name="SystemCmd" onkeydown="onSubmitCtrl(this, ' Refresh ')" value="wol_sch.sh"/>
<input type="hidden" name="firmver" value="<% nvram_get("firmver"); %>"/>
<input type="hidden" id="wol_sch_enable" name="wol_sch_enable" value='<% dbus_get_def("wol_sch_enable", "0"); %>'/>
<table class="content" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="17">&nbsp;</td>
<td valign="top" width="202">
<div id="mainMenu"></div>
<div id="subMenu"></div>
</td>
<td valign="top">
<div id="tabMenu" class="submenuBlock"></div>
<table width="98%" border="0" align="left" cellpadding="0" cellspacing="0">
<tr>
<td align="left" valign="top">
<table width="760px" border="0" cellpadding="5" cellspacing="0" bordercolor="#6b8fa3" class="FormTitle" id="FormTitle">
<tr>
<td bgcolor="#4D595D" colspan="3" valign="top">
<div>&nbsp;</div>
<div style="float:left;" class="formfonttitle">WOL排程</div>
<div style="float:right; width:15px; height:25px;margin-top:10px"><img id="return_btn" onclick="reload_Soft_Center();" align="right" style="cursor:pointer;position:absolute;margin-left:-30px;margin-top:-25px;" title="返回软件中心" src="/images/backprev.png" onMouseOver="this.src='/images/backprevclick.png'" onMouseOut="this.src='/images/backprev.png'"></img></div>
<div style="margin-left:5px;margin-top:10px;margin-bottom:10px"><img src="/images/New_ui/export/line_export.png"></div>
<div class="formfontdesc" id="cmdDesc">该工具用于WOL排程。请确认添加的设备支持WOL。</div>
<div id="NoteBox">
<h3>使用说明：</h3>
<h3>点击添加/删除按钮会立即向系统提交WOL计划任务的更改。</h3>
</div>
<table style="margin:10px 0px 0px 0px;" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable" id="wol_sch_table">
<thead>
<tr>
<td colspan="2">基本设置</td>
</tr>
</thead>
<tr>
<th>开启WOL排程</th>
<td colspan="2">
	<div class="switch_field" style="display:table-cell">
		<label for="switch">
			<input id="switch" class="switch" type="checkbox" style="display: none;">
			<div class="switch_container" >
			<div class="switch_bar"></div>
			<div class="switch_circle transition_style">
			<div></div>
			</div>
			</div>
		</label>
	</div>
	<div id="koolproxy_install_show" style="padding-top:5px;margin-left:80px;margin-top:-30px;float: left;"></div>	
</td>
</tr>
</table>

<table id="wol_sch_table" style="margin:10px 0px 0px 0px;" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable" >
<thead>
	<tr>
		<td colspan="6">排程设置</td>
	</tr>
</thead>
	<tr>
		<th style="width:180px;">主机名</th>
		<th style="width:180px;">mac地址</th>
		<th style="width:100px;">时间设置</th>
		<th style="width:160px;">每周天数</th>
		<th style="width:60px;">添加/删除</th>
	</tr>
	<tr>
		<td>
			<input type="text" class="input_20_table" maxlength="17" name="wollist_macAddr" onClick="hideClients_Block();" autocorrect="off" autocapitalize="off" style="margin-left:5px;width:130px;" onKeyPress="return validator.isHWAddr(this,event)" placeholder="<% nvram_get("lan_hwaddr"); %>">
<img id="pull_arrow" height="14px;" src="/images/arrow-down.gif" style="position:absolute;*margin-left:-3px;*margin-top:1px;" onclick="pullLANIPList(this);" title="Select Mac">
<div id="ClientList_Block_PC" class="clientlist_dropdown"></div>
		</td>
		<td>
			<input type="text" id="wol_sch_mac" name="wol_sch_mac" class="input_ss_table" maxlength="50" style="width:140px;" placeholder="" />
		</td>
		<td>
			<select id="wol_sch_rule_hour" name="wol_sch_rule_hour" class="ssconfig input_option" >
			</select>
			：
			<select id="wol_sch_rule_min" name="wol_sch_rule_min" class="ssconfig input_option" >
			</select>
		</td>
		<td>
<input type="checkbox" name="wol_sch_Sun" onclick="check_Timefield_checkbox();">日
<input type="checkbox" name="wol_sch_Mon" onclick="check_Timefield_checkbox();">一
<input type="checkbox" name="wol_sch_Tue" onclick="check_Timefield_checkbox();">二
<input type="checkbox" name="wol_sch_Wed" onclick="check_Timefield_checkbox();">三
<input type="checkbox" name="wol_sch_Thu" onclick="check_Timefield_checkbox();">四
<input type="checkbox" name="wol_sch_Fri" onclick="check_Timefield_checkbox();">五
<input type="checkbox" name="wol_sch_Sat" onclick="check_Timefield_checkbox();">六
		</td>
		<td style="width:50px">
			<input style="margin-left: 6px;margin: -3px 0px -5px 6px;" type="button" class="add_btn" onclick="addTr()" value="" />
		</td>
	</tr>
	
</table>
<div class="apply_gen">
<button id="cmdBtn" class="button_gen" onclick="reload_Soft_Center();">完成</button>
</div>

</td>
</tr>
</table>
</td>
<td width="10" align="center" valign="top"></td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</td>
<div id="footer"></div>
</body>
</html>
