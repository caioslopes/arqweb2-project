<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- Required meta tags -->
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	     <!-- Bootstrap CSS -->
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script>
		const toastElList = document.querySelectorAll('.toast')
		const toastList = [...toastElList].map(toastEl => new bootstrap.Toast(toastEl))
		toastList.map(toastEl => toastEl.show())
	</script>
</body>
</html>