<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%--
  Created by IntelliJ IDEA.
  User: Mega
  Date: 01.07.2017
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        a {
            text-decoration: none; /* Отменяем подчеркивание у ссылки */
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
    <title>Editing Page</title>
</head>
<body>

<h1 style = "color:yellow; text-align:left; vertical-align:top; text-shadow: red 0 0 2px;">User Details</h1>


<table>
    <tr style="background-color:gold">

        <th width="80">ID</th>
        <th width="120">Name</th>
        <th width="120">Age</th>
        <th width="120">Admin</th>
        <th width="120">DateOfCreation</th>

        <th width="60">Edit</th>
        <th width="60">Delete</th>
    </tr>

    <tr>
        <td>${user.id}</td>
        <td><a href="/userdata/${user.id}">${user.name}</a></td>
        <td>${user.age}</td>
        <td><tags:yesno value="${user.iAdmin}"/></td>
        <td>${user.createdDate}</td>

        <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
        <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
    </tr>



</table>


<td width = 150px>



            <h1 style = "color:yellow; text-align:left; vertical-align:top; text-shadow: red 0 0 2px;">Edit the User</h1>

    <c:url var="addAction" value="/users/add"/>


    <form:form modelAttribute="user" method="POST" action="${addAction}" commandName="user">
    <table>
        <c:if test="${!empty user.name}">
            <tr style="background-color:gold">
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>

                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="age">
                    <spring:message text="age"/>
                </form:label>
            </td>
            <td>
                <form:input path="age"/>
            </td>
        </tr>

        <tr>
            <td>
                <form:label path="iAdmin">
                    <spring:message text="iAdmin"/>
                </form:label>
            </td>
            <td>
                <form:input path="iAdmin"/>
            </td>
        </tr>


        <tr>
            <td colspan="2">

                <c:if test="${!empty user.name}">
                    <input type="submit"
                           value="<spring:message text="Edit User"/>"/>
                </c:if>
                <c:if test="${empty user.name}">
                    <input type="submit"
                           value="<spring:message text="Add User"/>"/>
                </c:if>

            </td>
        </tr>
    </table>
    </form:form>

    <a href ="/paging">Back to main page</a>


</body>
</html>
