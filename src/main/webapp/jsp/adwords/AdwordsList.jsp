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
		$('#adwordsList').addClass('active');
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
				<table class="table table-striped table-bordered table-hover">
					<thead>
					<tr class="title">
						<th width="5%">序号</th>
						<th width="10%">位置</th>
						<th width="25%">名称</th>
						<th width="8%">宽度</th>
						<th width="8%">高度</th>
						<th width="30%">链接</th>
						<th width="14%">操作&nbsp;&nbsp;&nbsp;&nbsp;<!-- <a href="adwordsAdd.do">新增</a> --></th>
					</tr></thead><tbody>
					<s:iterator value="adwordss" status="vs">
						<tr class="trDetail">
							<td><s:property value='#vs.index+1' /></td>
							<td><s:property value="position" /></td>
							<td><s:property value="name" /></td>
							<td><s:property value="width" /></td>
							<td><s:property value="height" /></td>
							<td><s:property value="url" /></td>
							<td><a
								href="adwordsUpdate.do?adwordsId=<s:property value="id"/>"class="btn btn-primary  btn-small" >编辑</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="adwordsDelete.do?adwordsId=<s:property value="id"/>"
								class="btn btn-danger  btn-small delete">删除</a></td>
						</tr>
					</s:iterator></tbody>
				</table>
				</br>
			</div>
		</div>
		<%@include file="./../Foot.jsp"%>
	</div>
</body>
</html>
