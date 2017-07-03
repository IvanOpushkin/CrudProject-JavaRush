<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Mega
  Date: 27.06.2017
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Searching Page</title>

    <style>
        a {
            text-decoration: none;
        }


        th {
            text-align: left;
            background: gold;
            padding: 5px;
            border: 1px solid black;
        }
        td {
            padding: 5px;
            border: 1px solid gold;
        }
    </style>

    <style type = "css/text">

        .tg
        {
            font-family: Arial, sans-serif;
            font-size: 14px;
            border-collapse: collapse;
            width:300px;

        }

        .tg th
        {
            font-family: Arial, sans-serif;
            font-size: 14px;
            border-color: #ccc;
            background:#fc0;
            text-align:center;
        }



        .tg td
        {
            font-family: Arial, sans-serif;
            font-size: 14px;
            color: #333;
            background:#fff;
            text-align:center;
        }

    </style>
</head>
<body>
<br>

<h1 style = "color:yellow; text-align:left; vertical-align:top; text-shadow: red 0 0 2px;"> Users Found </h1>

<c:if test = "${!empty pagedList}" var = "user">
        <table valign = "top" class = "tg">
            <tr style="background-color:gold">

                <th width="80">ID</th>
                <th width="120">Name</th>
                <th width="120">Age</th>
                <th width="120">Admin</th>
                <th width="120">DateOfCreation</th>

                <th width="60">Edit</th>
                <th width="60">Delete</th>
            </tr>

            <c:forEach items = "${pagedList}" var = "user">
                <tr>
                    <td>${user.id}</td>
                    <td><a href="/userdata/${user.id}">${user.name}</a></td>
                    <td>${user.age}</td>
                    <td><tags:yesno value="${user.iAdmin}"/></td>
                    <td>${user.createdDate}</td>

                    <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
                    <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
                </tr>

            </c:forEach>

        </table>
    </c:if>

</br>

<div align="center" class="panel-footer" style="background-color:gold; width:450px" id="pagination">
    <c:url value="search${page-1}" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
    <c:if test="${page > 0}">
        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
    </c:if>


    <c:forEach begin="0" end="${maxPages-1}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index + 1}</span>
            </c:when>
            <c:otherwise>
                <c:url value="search" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href='/search${i.index}'>${i.index + 1}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:url value="search${page+1}" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages-1}">
        <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>
</div>


</br>
<a href = "/paging">Return to the Main page</a>




</body>
</html>




