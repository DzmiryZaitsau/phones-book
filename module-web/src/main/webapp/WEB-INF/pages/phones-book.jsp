<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta charset="utf-8">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css">

    <title>
        <s:message code="application.title"/>
    </title>
</head>
<body>
<table>
<tr>
    <td>
        <table>
        <div class="dataFrame shortFrame">
            <h1>
                <s:message code="contactListPage.searchContactsForm.title"/>
            </h1>


            <spring:form action="search-contacts.html" method="post" >
                <s:message code="contactListPage.searchContactsForm.name.label"/>
                <br/>
                <p><input type="search" name="letters" placeholder="Search contacts"></p>

                <br/>
                <br/>
                <input type="submit" name="search_btn" value="search"/>

            </spring:form>


        </div>
        </table>
    </td>

        <td>
            <table>
                <div class="dataFrame shortFrame">
                    <h1>
                        <s:message code="contactListPage.saveContactForm.title"/>
                    </h1>

                    <spring:form action="save-phones-book.html" method="post" >
                        <spring:hidden path="id"/>

                        <s:message code="contactListPage.saveContactForm.name.label"/>
                        <br/>
                        <spring:input path="name"/>

                        <br/>
                        <br/>

                        <s:message code="contactListPage.saveContactForm.number.label"/>
                        <br/>
                        <spring:input path="number"/>

                        <br/>
                        <br/>
                        <input type="submit" name="login_btn" value="<s:message code="common.buttons.save" />"/>

                    </spring:form>
                </div>
            </table>
        </td>
    </tr>
</table>
<div class="dataFrame largeFrame">
    <h1>
        <s:message code="contactListPage.header.title"/>
    </h1>

    <table border="1" class="dataTable">
        <tr>
            <th class="dataColl">
                <s:message code="contactListPage.ContactGrid.name.header"/>
            </th>
            <th class="dataColl">
                <s:message code="contactListPage.ContactGrid.number.header"/>
            </th>
            <th class="dataColl">
                <s:message code="grid.common.actions.header"/>
            </th>
        </tr>

        <c:forEach items="${contactList}" var="contact">
            <tr>
                <td class="dataColl">
                        ${contact.name}
                </td>
                <td class="dataColl">
                        ${contact.number}
                </td>

                <td class="actionsColl dataColl">
                    <c:url value="edit-phones-book.html" var="edit_url">
                        <c:param name="contact_id" value="${contact.id}"/>
                    </c:url>

                    <a href="${edit_url}">
                        <s:message code="grid.common.actions.editAction"/>
                    </a>

                    &nbsp;&nbsp;

                    <c:url value="delete-phones-book.html" var="delete_url">
                        <c:param name="contact_id" value="${contact.id}"/>
                    </c:url>

                    <a href="${delete_url}">
                        <s:message code="grid.common.actions.deleteAction"/>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <br/>
    <hr/>
    <br/>


</div>
</body>
</html>
