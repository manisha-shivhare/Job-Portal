<%@ page import="com.dao.JobDAO" %>
<%@ page import="com.entity.Jobs" %>
<%@ page import="com.DB.DBConnect" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Jobs</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
    <%@include file="all_component/navbar.jsp"%>

    <div class="container p-2">
        <div class="col-md-10 offset-md-1">
            <div class="card">
                <div class="card-body">
                    <div class="text-center text-success">
                        <i class="fa-solid fa-user-group"></i>

                        <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        JobDAO dao = new JobDAO(DBConnect.getConn());
                        Jobs j = dao.getJobById(id);
                        %>
                        <h5>Edit Jobs</h5>
                    </div>
                    <form action="update" method="post">
                    <input type="hidden" value="<%=j.getId() %>" name="id">
                        <div class="form-group">
                            <label>Enter Title</label> 
                            <input type="text" name="title" required class="form-control" value="<%= j.getTitle() %>">
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label>Location</label> 
                                <select name="location" class="custom-select" id="inlineFormCustomSelectPref">
                                    <option selected>Choose...</option>
                                    <option value="Odisha" <%= "Odisha".equals(j.getLocation()) ? "selected" : "" %>>Odisha</option>
                                    <option value="JharKhand" <%= "JharKhand".equals(j.getLocation()) ? "selected" : "" %>>JharKHand</option>
                                    <option value="Gujurat" <%= "Gujurat".equals(j.getLocation()) ? "selected" : "" %>>Gujurat</option>
                                    <option value="Bhubaneswar" <%= "Bhubaneswar".equals(j.getLocation()) ? "selected" : "" %>>Bhubaneswar</option>
                                    <option value="Delhi" <%= "Delhi".equals(j.getLocation()) ? "selected" : "" %>>Delhi</option>
                                    <option value="Banglore" <%= "Banglore".equals(j.getLocation()) ? "selected" : "" %>>Banglore</option>
                                    <option value="Chennai" <%= "Chennai".equals(j.getLocation()) ? "selected" : "" %>>Chennai</option>
                                    <option value="Hydrabad" <%= "Hydrabad".equals(j.getLocation()) ? "selected" : "" %>>Hydrabad</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Category</label> 
                                <select class="custom-select" id="inlineFormCustomSelectPref" name="category">
                                    <option selected>Choose....</option>
                                    <option value="IT" <%= "IT".equals(j.getCategory()) ? "selected" : "" %>>IT</option>
                                    <option value="Devloper" <%= "Devloper".equals(j.getCategory()) ? "selected" : "" %>>Devloper</option>
                                    <option value="Banking" <%= "Banking".equals(j.getCategory()) ? "selected" : "" %>>Banking</option>
                                    <option value="Engineer" <%= "Engineer".equals(j.getCategory()) ? "selected" : "" %>>Engineer</option>
                                    <option value="Teacher" <%= "Teacher".equals(j.getCategory()) ? "selected" : "" %>>Teacher</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Status</label> 
                                <select class="form-control" name="status">
                                    <option value="Active" <%= "Active".equals(j.getStatus()) ? "selected" : "" %>>Active</option>
                                    <option value="Inactive" <%= "Inactive".equals(j.getStatus()) ? "selected" : "" %>>Inactive</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Enter Description</label>
                            <textarea required rows="6" cols="" name="desc" class="form-control"><%= j.getDescription() %></textarea>
                        </div>
                        <button class="btn btn-success">Update Job</button>
                        <input type="hidden" name="id" value="<%= j.getId() %>">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
