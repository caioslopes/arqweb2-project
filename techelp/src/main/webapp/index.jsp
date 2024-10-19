<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/bootstrap.min.css" />
		<title>TecHelp</title>
	</head>
<body>

	<c:if test="${result == 'notRegistered'}">
		<div class="toast-container position-fixed top-0 end-0 p-3">
		 	<div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
			  <div class="toast-header">
			    <strong class="me-auto text-danger">Não foi possível cadastrar cliente.</strong>
			    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
			  </div>
			  <div class="toast-body">
			    O email informado já foi cadastrado. Tente outro email.
			  </div>
			</div>
		 </div>
	</c:if>	
	
	<c:if test="${result == 'registered'}">
		<div class="toast-container position-fixed top-0 end-0 p-3">
		 	<div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
			  <div class="toast-header">
			    <strong class="me-auto text-secondary">Cliente cadastrado.</strong>
			    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
			  </div>
			  <div class="toast-body">
			   	O cliente foi cadastrado com sucesso!
			  </div>
			</div>
		 </div>
	</c:if>
	
	<div class="relative">
	    <div class="position-absolute top-50 start-50 translate-middle border p-3 rounded-3 w-25">
	      	<h3 class="mb-3">Cadastro de cliente</h3>
			<form action="customerRegister" method="POST">
			  <div class="form-floating mb-3">
			    <input type="text" name="name" class="form-control" placeholder="Nome">
			    <label for="name">Nome</label>
			  </div>
			  
			  <div class="form-floating mb-3">
			    <input type="email" name="email" class="form-control" placeholder="Email">
			    <label for="email">Email</label>
			  </div>
			  
			  <div class="form-floating mb-3">
			    <input type="password" name="password" class="form-control" placeholder="Senha">
			    <label for="password">Senha</label>
			  </div>
			  
			  <div class="form-floating mb-3">
			    <input type="text" name="document" class="form-control" placeholder="CPF">
			    <label for="document">CPF</label>
			  </div>
			  
			  <div class="form-floating mb-3">
			    <input type="text" name="phone" class="form-control" placeholder="Telefone">
			    <label for="phone">Telefone</label>
			  </div>
			  
			  <button type="submit" class="btn btn-primary w-100">Cadastrar</button>
			</form>
	    </div>
	  </div>


	<script src="${contextPath}/resources/bootstrap/bootstrap.bundle.min.js" ></script>
	<script>
		const toastElList = document.querySelectorAll('.toast')
		const toastList = [...toastElList].map(toastEl => new bootstrap.Toast(toastEl))
		toastList.map(toastEl => toastEl.show())
	</script>
</body>
</html>