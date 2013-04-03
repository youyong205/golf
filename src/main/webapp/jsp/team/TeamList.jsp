<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>

<!DOCTYPE html><html>
<head>
<title>苏州高尔夫后台管理系统</title>

<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link rel='stylesheet' type='text/css' href='css/admin.css' />
<script src="js/jquery-1.7.1.js" type="text/javascript"></script>
<script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
<link rel='stylesheet' type='text/css' href='css/table_jui.css' />
<script src="js/tableInit.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#teamList').addClass('active');
		$(".delete").bind("click", function() {
			return confirm("确定要删除此分类吗(不可恢复)？");
		});
	});
</script>
</head>
<body>
  <%@include file="./../Head.jsp"%>
  </br>
  </br>
  <div class="container-fluid">
    <div class="row-fluid">
      <%@include file="./../Menu.jsp"%>
      <div class="span10">
        	<!-- <h4 style="text-align:center">球队管理</h4> -->
			<table  class="table table-striped table-bordered table-hover">
				<thead><tr class="title">
					<th width="5%">序号</th>
					<th width="75%">球队名称</th>
					<th width="20%">操作&nbsp;&nbsp;&nbsp;&nbsp;<a href="teamAdd.do" class="btn btn-primary  btn-small" >新增</a></th>
				</tr></thead><tbody>
				<s:iterator value="teams" status="vs">
					<tr class="trDetail">
					<td><s:property value='#vs.index+1'/></td>
					<td><s:property value="name" /></td>
					<td>
					<a href="teamNewsAdd.do?teamId=<s:property value="id"/>"class="btn btn-primary  btn-small" >新增新闻</a> &nbsp;&nbsp;&nbsp;&nbsp;
					<a href="teamUpdate.do?teamId=<s:property value="id"/>"class="btn btn-primary  btn-small" >编辑</a> &nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn btn-danger  btn-small delete" href="teamDelete.do?teamId=<s:property value="id"/>">删除</a></td>
					</tr>
				</s:iterator></tbody>
			</table>
      </div>
    </div>
    <%@include file="./../Foot.jsp"%>
  </div>
</body>
</html>
