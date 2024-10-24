<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../../../components/header.jsp">
	<jsp:param name="title" value="Cadastro de cliente" />
</jsp:include>

<jsp:include page="../../../components/navbar-employee.jsp" />

<div class="container-lg">
	<h1>Cadastro de cliente</h1>
	<form action="${contextPath}/PaymentMethodRegisterServlet" method="POST">
	  <div class="row">
		  <div class="col-6">
		  	<div class="mb-3">
			    <label for="name" class="form-label">Nome</label>
			    <input type="text" class="form-control" name="name" id="name">
			  </div>
			  <!-- <div class="mb-3">
			  	<div class="form-check form-switch">
				  <input class="form-check-input" type="checkbox" role="switch" id="active" name="active" checked>
				  <label class="form-check-label" for="active">Ativo</label>
			    </div>
			  </div> -->
		  </div>
	  </div>

	  <button type="submit" class="btn btn-primary">Cadastrar</button>
	</form>
</div>

<jsp:include page="../../../components/footer.jsp" />