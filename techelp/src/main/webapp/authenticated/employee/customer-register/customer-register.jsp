<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../../../components/header.jsp">
	<jsp:param name="title" value="Cadastro de cliente" />
</jsp:include>

<div class="container-lg">
	<h1>Cadastro de cliente</h1>
	<form action="${contextPath}/customerRegister" method="POST">
	  <div class="row">
		  <div class="col-6">
		  	<div class="mb-3">
			    <label for="name" class="form-label">Nome</label>
			    <input type="text" class="form-control" name="name" id="name">
			  </div>
			  <div class="mb-3">
			    <label for="email" class="form-label">Email</label>
			    <input type="email" class="form-control" name="email" id="email">
			  </div>
			  <div class="mb-3">
			    <label for="password" class="form-label">Senha</label>
			    <input type="password" class="form-control" name="password" id="password">
			  </div>
			  <div class="mb-3">
			    <label for="phone" class="form-label">Telefone</label>
			    <input type="text" class="form-control" name="phone" id="phone">
			  </div>
			  <div class="mb-3">
			    <label for="document" class="form-label">CPF</label>
			    <input type="text" class="form-control" name="document" id="document">
			  </div>
			  <div class="mb-3">
			  	<div class="form-check form-switch">
				  <input class="form-check-input" type="checkbox" role="switch" id="active" name="active" checked>
				  <label class="form-check-label" for="active">Ativo</label>
			    </div>
			  </div>
		  </div>
		  
		  <div class="col-6">
		  	<div class="mb-3">
			    <label for="street" class="form-label">Rua</label>
			    <input type="text" class="form-control" name="street" id="street">
			  </div>
			  <div class="mb-3">
			    <label for="number" class="form-label">Número</label>
			    <input type="text" class="form-control" name="number" id="number">
			  </div>
			   <div class="mb-3">
			    <label for="additional_info" class="form-label">Complemento</label>
			    <input type="text" class="form-control" name="additional_info" id="additional_info">
			  </div>
			   <div class="mb-3">
			    <label for="neighborhood" class="form-label">Bairro</label>
			    <input type="text" class="form-control" name="neighborhood" id="neighborhood">
			  </div>
			  <div class="mb-3">
			    <label for="postal_code" class="form-label">CEP</label>
			    <input type="text" class="form-control" name="postal_code" id="postal_code">
			  </div>
			  <div class="mb-3">
			    <label for="city" class="form-label">Cidade</label>
			    <input type="text" class="form-control" name="city" id="city">
			  </div>
			  <div class="mb-3">
			    <label for="state" class="form-label">Estado</label>
			    <input type="text" class="form-control" name="state" id="state">
			  </div>
		  </div>
	  </div>

	  <button type="submit" class="btn btn-primary">Submit</button>
	</form>
</div>

<jsp:include page="../../../components/footer.jsp" />