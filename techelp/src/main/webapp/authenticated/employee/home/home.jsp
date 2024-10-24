<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../../../components/header.jsp">
	<jsp:param name="title" value="Inicio | Funcionário" />
</jsp:include>

<jsp:include page="../../../components/navbar-employee.jsp" />

<div class="container-lg">
	<a class="btn btn-outline-secondary p-4" href="${contextPath}/CustomersServlet">Clientes</a>
	<a class="btn btn-outline-secondary p-4" href="${contextPath}/WorkOrdersServlet">Ordens de serviço</a>
	<a class="btn btn-outline-secondary p-4" href="${contextPath}/PaymentMethodsServlet">Métodos de pagamento</a>
</div>

<jsp:include page="../../../components/footer.jsp" />