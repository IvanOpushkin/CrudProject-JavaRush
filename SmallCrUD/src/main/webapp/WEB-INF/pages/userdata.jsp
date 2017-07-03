
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

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

    <title>BookData</title>

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

</br>

<a href ="/paging">Back to main page</a>

</body>
</html>