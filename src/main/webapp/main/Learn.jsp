<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">
<head>
<meta charset="UTF-8">
<title>苏州高尔夫网 -- 商务高球 | 名人高球 | 高球经营 | 球场设计 | 高球之源 | 高球活动 | 苏州专业高尔夫门户网站</title>
<meta name="Description" content="苏州高尔夫网 -- 商务高球 | 名人高球 | 高球经营 | 球场设计 | 高球之源 | 高球活动 | 苏州专业高尔夫门户网站">
<meta name="Keyword" content="苏州高尔夫网 -- 商务高球 | 名人高球 | 高球经营 | 球场设计 | 高球之源 | 高球活动 | 苏州专业高尔夫门户网站">

<link rel="stylesheet" href="css/base.css">
<style>
.mod-box-horizon .mod-bd{
	padding:20px;
	height:220px;
	overflow:hidden;
}
</style>
</head>
<body youdao="bind">
	<div class="wrap container_24">
		<jsp:include page="./Head.jsp"></jsp:include>

		<s:iterator value="news" status="vs">
			<div class="grid_8">
			<div class="mod-box-horizon">
				<div class="mod-hd">${smallTitle}</div>
				<div class="mod-bd">
				<s:property value="content" escape="false" />
				</div>
			</div>
			</div>
		</s:iterator>
		<jsp:include page="./Foot.jsp"></jsp:include>
	</div>
</body>
</html>


