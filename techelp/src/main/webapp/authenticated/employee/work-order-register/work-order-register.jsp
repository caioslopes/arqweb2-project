<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../../../components/header.jsp">
	<jsp:param name="title" value="Cadastro de ordem de serviço | Funcionário" />
</jsp:include>

<jsp:include page="../../../components/navbar-employee.jsp" />

<div class="container-lg">
	<h3>Cadastrar ordem de serviço</h3>
	<form action="${contextPath}/WorkOrderRegisterServlet" method="POST">
	  <div class="row">
		  <div class="col-6">
		      <!-- <div class="mb-3">
			    <label for="customerId" class="form-label">Cliente</label>
			    <input type="text" class="form-control" name="customerId" id="customerId">
			  </div> -->
			  <div class="mb-3">
			  	<label for="customerId" class="form-label">Cliente</label>
			  	<select class="form-select" name="customerId">
				    <option value="">Selecione um cliente</option>
				    <c:if test="${!empty customers}">
				        <c:forEach items="${customers}" var="customer">
				            <option value="${customer.id}">${customer.name}</option>
				        </c:forEach>
				    </c:if>
				</select>
			  </div>
		  	  <div class="mb-3">
			    <label for="description" class="form-label">Descrição</label>
			    <input type="text" class="form-control" name="description" id="description">
			  </div>
			  <div class="mb-3">
			    <label for="price" class="form-label">Valor R$</label>
			    <input type="number" class="form-control" name="price" id="price">
			  </div>
			  <div class="mb-3">
			    <label for="observation" class="form-label">Observação</label>
			    <input type="text" class="form-control" name="observation" id="observation">
			  </div>
			  <!-- <div class="mb-3">
			    <label for="paymentMethodId" class="form-label">Método de pagamento</label>
			    <input type="number" class="form-control" name="paymentMethodId" id="paymentMethodId">
			  </div> -->
			  <div class="mb-3">
			  	<label for="paymentMethodId" class="form-label">Método de pagamento</label>
			  	<select class="form-select" name="paymentMethodId">
				    <option value="">Selecione um método de pagamento</option>
				    <c:if test="${!empty paymentMethods}">
				        <c:forEach items="${paymentMethods}" var="paymentMethod">
				            <option value="${paymentMethod.id}">${paymentMethod.name}</option>
				        </c:forEach>
				    </c:if>
				</select>
			  </div>
		  </div>
	  </div>

	  <button type="submit" class="btn btn-primary">Cadastrar</button>
	</form>
</div>

<jsp:include page="../../../components/footer.jsp" />