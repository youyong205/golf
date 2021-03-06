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
		$('#smallCategoryList').addClass('active');
		var type = ${type};
		$('#type').val(type);
		$(".delete").bind("click", function() {
			return confirm("确定要删除此分类吗(不可恢复)？");
		});
	});
	function categoryChanged(){
		var type = $('#type').val();
		window.location="?type="+type;
	}

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
			<table  class="table table-striped table-bordered table-hover">
				<thead><tr class="title">
					<th width="5%">序号</th>
					<th width="21%">大分类
						<select id="type" onchange="categoryChanged()">
							<option value="1">新闻</option>
							<option value="2">图片</option>
						</select>
					</th>
					<th width="30%">一级分类</th>
					<th width="30%">二级分类名称</th>
					<th width="14%">操作&nbsp;&nbsp;&nbsp;&nbsp;<a href="smallCategoryAdd.do?type=${type}&categoryId=<s:property value="categoryId"/>" class="btn btn-primary  btn-small" >新增</a></th>
				</tr></thead><tbody>
				<s:iterator value="smallCategories" status="vs">
					<tr class="trDetail">
					<td><s:property value='#vs.index+1'/></td>
					<td><s:if test="category.type==1">新闻分类</s:if>
					<s:elseif test="category.type==2">图片专题</s:elseif></td>
					<td><s:property value="category.name" /></td>
					<td><s:property value="name" /></td>
					<td><a href="smallCategoryUpdate.do?type=${type}&smallCategoryId=<s:property value="id"/>" class="btn btn-primary  btn-small" >编辑</a> &nbsp;&nbsp;&nbsp;&nbsp;
					<a href="smallCategoryDelete.do?type=${type}&smallCategoryId=<s:property value="id"/>" class="btn btn-danger  btn-small delete">删除</a></td>
					</tr>
				</s:iterator></tbody>
			</table>
      </div>
    </div>
    <%@include file="./../Foot.jsp"%>
  </div>
</body>
</html>
