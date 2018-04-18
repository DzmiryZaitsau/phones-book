<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta charset="utf-8">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css">

    <title>
        <s:message code="contactListPage.editContactForm.title"/>
    </title>
</head>
<body>



<div class="dataFrame largeFrame">
    <h1>
        Edit Contact
    </h1>

<div class="dataFrame shortFrame">


<spring:form action="save-phones-book.html" method="post" >
    <spring:hidden path="id" value="${contact.id}"/>

    <s:message code="contactListPage.saveContactForm.name.label" />
    <br />
    <spring:input path="name" value="${contact.name}"  />

    <br />
    <br />

    <s:message code="contactListPage.saveContactForm.number.label" />
    <br />
    <spring:input path="number" value="${contact.number}" />

    <br />
    <br />
    <input type="submit" name="login_btn" value="<s:message code="common.buttons.save" />" />

</spring:form>
</div>
</div>
</body>
</html>
