<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../../../components/header.jsp">
	<jsp:param name="title" value="Ordens de serviço" />
</jsp:include>

<jsp:include page="../../../components/navbar-employee.jsp" />

<div class="container-lg">
	<div class="table-responsive">
		<table class="table table-bordered">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Cliente email</th>
		      <th scope="col">Descrição do serviço</th>
		      <th scope="col">Solicitado em</th>
		      <th scope="col">Status</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="workOrder" items="${workOrders}">
		    	<tr>
			      <th scope="row"><c:out value="${workOrder.id}"/></th>
			      <td><c:out value="${workOrder.customer.email}"/></td>
			      <td><c:out value="${workOrder.description}"/></td>
			      <td><c:out value="${workOrder.createdAt}"/></td>
			      <td><c:out value="${workOrder.status}"/></td>
			    </tr>
		    </c:forEach>
		  </tbody>
		</table>
	</div>
</div>

<jsp:include page="../../../components/footer.jsp" />