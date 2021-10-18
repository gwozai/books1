<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<meta charset="UTF-8">
<title>订单管理</title>
	<%--静态导入--%>
	<%@ include file="/pages/common/head.jsp"%>
</head>
<body>

<%@include file="/pages/manager/managerHead.jsp"%>


<div id="main" style="text-align: center">
	<h1>当前系统总计: <span style="color: red"> ${requestScope.orderList.size()}</span>笔订单</h1>
	<table style="width: 800px">
		<tr>
			<th>订单号</th>
			<th>日期</th>
			<th>金额</th>
			<th>状态</th>
			<th>详情</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${requestScope.orderList}" var="order">
			<tr>
				<td style="width: 300px">${order.orderId}</td>
				<td><fmt:formatDate value="${order.createTime}" pattern="yyyy年MM月dd日 HH时mm分ss秒"/></td>
				<td>${order.price}元</td>
				<td>${order.status}</td>
				<td><a href="orderServlet?action=showOrderDetails&orderId=${order.orderId}">查看详情</a></td>
				<c:if test="${order.status=='已发货'}">
					<td>已发货</td>
				</c:if>
				<c:if test="${order.status=='已下单'}">
					<td><a href="orderServlet?action=sendOrder&orderId=${order.orderId}">点击发货</a></td>
				</c:if>
				<c:if test="${order.status=='已签收'}">
					<td>已签收</td>
				</c:if>

			</tr>
		</c:forEach>
	</table>

</div>

	<%--静态导入页脚--%>
	<%@ include file="/pages/common/bottom.jsp"%>
</body>
</html>