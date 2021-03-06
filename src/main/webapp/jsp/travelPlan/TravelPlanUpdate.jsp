<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>

<!DOCTYPE html><html>
<head>
<title>苏州高尔夫后台管理系统</title>

<link href="css/bootstrap.min.css" rel="stylesheet" travelPlan="screen">	
<link rel='stylesheet' type='text/css' href='css/admin.css' />
<script src="js/jquery-1.7.1.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#travelPlanList').addClass("active");
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
			<form action="travelPlanUpdateSubmit.do" id="form" method="post"  
				enctype="multipart/form-data">
				<table class="table table-striped table-bordered" width="100%">
					<tr><td colspan='2'>
						<h4 style="text-align:center">修改旅游行程安排信息</h4>
					</td></tr><tr>
						<input type="hidden" name="travelPlan.id" value="<s:property value="travelPlan.id"/>"/>
						<input type="hidden" name="travelPlan.travelId" value="<s:property value="travelPlan.travelId"/>"/>
						<td class="left" width="25%">行程名称<span class='red'>*</span></td>
						<td class="right">
							<input type="text" size="40" name="travelPlan.name" value="${travelPlan.name}"/>
						</td>
					</tr>
					<tr>
						<td class="left" width="25%">行程介绍<span class='red'>*</span></td>
						<td class="right">
							<textarea  name="travelPlan.content"  rows="10" cols="120">${travelPlan.content}</textarea>
						</td>
					</tr>
					<tr>
						<td class="left" width="25%">备注信息<span class='red'>*</span></td>
						<td class="right">
							<textarea  name="travelPlan.des"  rows="10" cols="120">${travelPlan.des}</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center">
							<button type="submit" class="btn btn-primary  btn-large">提交</button>
					</tr>
					</table>
			</form>
      </div>
    </div>
    <%@include file="./../Foot.jsp"%>
  </div>
</body>
</html>

