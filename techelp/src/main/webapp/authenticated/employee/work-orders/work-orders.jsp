<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../../../components/header.jsp">
	<jsp:param name="title" value="Ordens de serviço | Funcionário" />
</jsp:include>

<jsp:include page="../../../components/navbar-employee.jsp" />

<div class="container-lg">
	<h3>Ordens de serviço</h3>
	<div class="d-flex justify-content-end my-3">
		<a href="${contextPath}/WorkOrderRegisterServlet" class="btn btn-primary">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2"/>
			</svg>
			<span>Nova ordem de serviço</span>
		</a>
	</div>
	<div class="table-responsive">
		<table class="table table-striped">
		  <thead class="table-light">
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