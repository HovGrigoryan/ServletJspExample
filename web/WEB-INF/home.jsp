<%@ page import="java.util.List" %>
<%@ page import="model.ToDo" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: Hov
  Date: 11.06.2020
  Time: 2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%

    User user = (User) session.getAttribute("user");
%>
Welcome  <%= user.getName()%> <% if (user.getPictureUrl() != null) {%>
<img src="/image?path=<%=user.getPictureUrl()%>" width="50"/> <%}%> <a href="/logout">logout</a> <br>
<a href="/">Index</a><br><br>

<div id="info">

</div>

<div id="todolist">
    Loading...
</div>

Add ToDo:
<form action="/addTodo" method="post" id="addTodo">
    <input name="title" id="title" type="text"/><br>
    <input name="deadline" id="deadline" type="date"/><br>
    <input type="submit" value="create">
</form>

<script src="/js/jquery-3.5.1.min.js" type="text/javascript"></script>

<script>
    $(document).ready(function () {

        $("#addTodo").submit(function (e) {
            e.preventDefault();
            let title = $("#title").val();
            let deadline = $("#deadline").val();
            $.ajax({
                url: "/addTodo?title=" + title + "&deadline=" + deadline,
                method: "POST",
                success: function (result) {
                    $("#info").html(result);
                    $("#title").val("");
                    $("#deadline").val("");
                },
                eror: function (result) {
                    $("#info").html("There is problem with todo data.!");
                }
            });

        })

        let getTodoList = function () {
            $.ajax({
                url: "/todolist",
                method: "Get",
                success: function (result) {
                    $("#todolist").html(result)
                }
            });
        };
        getTodoList();
        setInterval(getTodoList, 2000)
    })
</script>
</body>
</html>
