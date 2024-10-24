<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../../../components/header.jsp">
	<jsp:param name="title" value="Métodos de pagamento" />
</jsp:include>

<jsp:include page="../../../components/navbar-employee.jsp" />

<div class="container-lg">
	<div class="table-responsive">
		<table class="table table-bordered">
		  <thead>
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