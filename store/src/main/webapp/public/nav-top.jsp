<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<nav class="navbar navbar-default navbar-inverse navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#demo-navbar"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<%=path %>/index/turnToIndex/1">
					<img class="logo-img img-rounded" alt="logo" src="<%=path %>/include/img/logo.png">
				</a>
			</div>

			<div class="collapse navbar-collapse" id="demo-navbar">
				<ul class="nav navbar-nav">
					<li class="active"><a title="COJ" href="<%=path %>/index/turnToIndex/1"><span class="glyphicon glyphicon-th" aria-hidden="true"></span> 
					<span class="sr-only">(current)</span>
					</a></li>
					<li><a href="#" data-toggle="modal" data-target="#about">关于</a></li>
				</ul>
				<form class="navbar-form navbar-left" action="<%=path %>/index/query" target="_blank" method="post" role="search">
					<div class="form-group">
						<input type="text" name="title" class="form-control" placeholder="Search">
					</div>
					<button type="submit"  class="btn btn-default">查询</button>
				</form>
				
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${empty user}">
						<li><a href="javascript:void(0)" data-toggle="modal" data-target="#login">登录
									<span class="glyphicon glyphicon-home"></span></a></li>
						<li>
						<a href="javascript:void(0)" data-toggle="modal" data-target="#register">注册
									<span class="glyphicon glyphicon-user"></span></a>
						</li>
						<li>
							<a href="javascript:void(0)" onclick="openShoppingCar();" data-toggle="modal" >购物车<span class="glyphicon glyphicon-shopping-cart"></span></a>
						</li>
						</c:when>
						<c:otherwise>
						
							<li class="dropdown">
							<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">
								<img id="sm-name" src="
									<c:choose>
										<c:when test="${empty headimg}">
											<%=path %>/include/img/person.gif
										</c:when>
										<c:otherwise>
											<%=path %>/${headimg}
										</c:otherwise>
									</c:choose>
									" class="img-responsive center-block img-circle" alt="图片无效">
								 </a>
								<ul class="dropdown-menu">
									<li>
									<a href="<%=path%>/user/frontUserSet/${user.id}">${user.username }<span class="glyphicon glyphicon-cog"></span></a>
									<a href="<%=path%>/user/achatDetail/${user.id}/?state=5">购物车<span class="glyphicon glyphicon-shopping-cart"></span></span></a>
									<a href="<%=path%>/user/achatDetail/${user.id}">个人流程<span class="glyphicon glyphicon-paperclip"></span></a>
									<a href="<%=path %>/login/loginOut?type=1" >退出登录<span class="glyphicon glyphicon-off"></span></a>
									</li>
								</ul>
							</li>
						</c:otherwise>
					</c:choose>
					
				</ul>
				
			</div>
		</div>
	</nav>