<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US"><head>
	<meta charset="UTF-8">
		<title>苏州高尔夫网</title>
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/news.css">
	<style>
	.mod-article-list{padding:8px;}
	.mod-article-list .article-item{margin:7px;font-size:13px;}
	.adwords-full{height:198px;margin-bottom:5px;width:100%;}
	.img-full-last{margin-bottom:0;}
	.news-article-list{height:600px;}
	.paginate{text-align:center;padding:5px 0;font-size:13px;background-color:#F0F7E7;}
	</style>
</head>
<body>
	<div class="wrap container_24">
		<jsp:include page="./Head.jsp"></jsp:include>
		<div class="clear"></div>
		<div class="grid_17">
		<div class="mod-box-horizon-last mod-box-horizon">
		<div class="mod-hd">
					您当前所在位置：首页 ->新闻查询
				</div>
		<div class="mod-bd">
			<ul class="mod-article-list news-article-list">
				<s:iterator value="news" status="vs">
					<li class="article-item"><a href="news.do?id=<s:property value="id"/>"><s:property
						value="title" /></a><span class="time"><s:property value="dateStr"/></span></li>
				</s:iterator>
			</ul>
			<div class="paginate">
				共&nbsp;<s:property value="pagedTool.totalNumber"/>&nbsp;条记录
				<a href="?index=0&keyword=<s:property value="keyword"/>">首页</a>&nbsp;&nbsp;
				<a href="?index=<s:property value="pagedTool.pageIndex-1"/>&keyword=<s:property value="keyword"/>">上一页</a>&nbsp;&nbsp;
				<a href="?index=<s:property value="pagedTool.pageIndex+1"/>&keyword=<s:property value="keyword"/>">下一页</a>&nbsp;&nbsp;
				<a href="?index=<s:property value="pagedTool.totalPage"/>&keyword=<s:property value="keyword"/>">末页</a>&nbsp;&nbsp;
				共&nbsp;<s:property value="pagedTool.totalPage"/>&nbsp;页,当前第&nbsp;<s:property value="pagedTool.pageIndex"/>页&nbsp;
				<s:property value="pagedTool.pageSize"/>条记录/页&nbsp;
			</div>
		</div>
		</div>
			
		</div>
		<div class="grid_7">
			<div class="mod-box-horizon">
				<div class="mod-hd">
					最新新闻
				</div>
				<div class="mod-bd">
					<ul class="mod-article-list">
						<s:iterator value="latestNews" status="vs">
							<li class="article-item"><a
								href="news.do?id=${id}" target="_blank">${smallTitle}</a><span class="time">${dateStr}</span></li>
						</s:iterator>
					</ul>
				</div>
			</div>
			<a href="${adwordsService.adwords[21].url}" target="_blank"><img
				class="adwords-full" src="${adwordsService.adwords[21].image.path}"
				 border="0"></a>
			<a href="${adwordsService.adwords[22].url}" target="_blank"><img
				class="adwords-full" src="${adwordsService.adwords[22].image.path}"
				border="0"></a>
		</div>
		<div class="grid_24">
			<a href="${adwordsService.adwords[20].url}" target="_blank"><img
				class="img-full" src="${adwordsService.adwords[20].image.path}"
				height="90" border="0"></a>
		</div>
		<jsp:include page="./Foot.jsp"></jsp:include>
	</div>
</body></html>