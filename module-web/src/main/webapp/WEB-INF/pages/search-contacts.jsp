<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta charset="utf-8">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css">

    <title>
        Search Contacts
    </title>
</head>
<body>

<div class="dataFrame largeFrame">
    <h1>
        Search Contacts
    </h1>

    <div class="dataFrame shortFrame">

        <table border="1" class="dataTable">
            <tr>
                <th class="dataColl">
                    <s:message code="contactListPage.ContactGrid.name.header"/>
                </th>
                <th class="dataColl">
                    <s:message code="contactListPage.ContactGrid.number.header"/>
                </th>
            </tr>

            <c:forEach items="${list}" var="contact">
                <tr>
                    <td class="dataColl">
                            ${contact.name}
                    </td>
                    <td class="dataColl">
                            ${contact.number}
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
