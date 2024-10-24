<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<nav class="navbar navbar-expand-lg bg-body-tertiary mb-5">
  <div class="container-lg">
    <a class="navbar-brand" href="${contextPath}/authenticated/customer/home/home.jsp">TecHelp</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Ordem de serviço
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${contextPath}/authenticated/customer/work-order-register/work-order-register.jsp">Solicitar ordem de serviço</a></li>
            <li><a class="dropdown-item" href="#">Suas ordens de serviços</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>