<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../../../components/header.jsp">
	<jsp:param name="title" value="Solicitar ordem de serviço" />
</jsp:include>

<jsp:include page="../../../components/navbar-customer.jsp" />

<div class="container-lg">
	<h1>Solicitar ordem de serviço</h1>
	<form action="${contextPath}/WorkOrderRegisterServlet" method="POST">
	  <div class="row">
		  <div class="col-6">
		  		<!-- Quando adicionar sessão -> Adicionar um input hidden passando o id do cliente -->
		      <div class="mb-3">
			    <label for="customerId" class="form-label">Cliente</label>
			    <input type="text" class="form-control" name="customerId" id="customerId">
			  </div>
		  	  <div class="mb-3">
			    <label for="description" class="form-label">Descrição</label>
			    <input type="text" class="form-control" name="description" id="description">
			  </div>
			  <!-- <div class="mb-3">
			    <label for="price" class="form-label">Valor R$</label>
			    <input type="number" class="form-control" name="price" id="price">
			  </div> -->
			  <div class="mb-3">
			    <label for="observation" class="form-label">Observação</label>
			    <input type="text" class="form-control" name="observation" id="observation">
			  </div>
			  <!-- <div class="mb-3">
			    <label for="paymentMethodId" class="form-label">Método de pagamento</label>
			    <input type="number" class="form-control" name="paymentMethodId" id="paymentMethodId">
			  </div> -->
		  </div>
	  </div>

	  <button type="submit" class="btn btn-primary">Solicitar</button>
	</form>
</div>

<jsp:include page="../../../components/footer.jsp" />