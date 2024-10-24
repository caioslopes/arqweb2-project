<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../../../components/header.jsp">
	<jsp:param name="title" value="Métodos de pagamento | Funcionário" />
</jsp:include>

<jsp:include page="../../../components/navbar-employee.jsp" />

<div class="container-lg">
	<h3>Métodos de pagamento</h3>
	<div class="d-flex justify-content-end my-3">
		<a href="${contextPath}/authenticated/employee/payment-method-register/payment-method-register.jsp" class="btn btn-primary">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2"/>
			</svg>
			<span>Novo método de pagamento</span>
		</a>
	</div>
	<div class="table-responsive">
		<table class="table table-striped">
		  <thead class="table-light">
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Nome</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="paymentMethod" items="${paymentMethods}">
		    	<tr>
			      <th scope="row"><c:out value="${paymentMethod.id}"/></th>
			      <td><c:out value="${paymentMethod.name}"/></td>
			    </tr>
		    </c:forEach>
		  </tbody>
		</table>
	</div>
</div>

<jsp:include page="../../../components/footer.jsp" />