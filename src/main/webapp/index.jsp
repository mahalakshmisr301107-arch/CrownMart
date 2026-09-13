<%@ page import="com.crownmart.app.filter.AuthFilter" %>
<%
    if (session != null && session.getAttribute(AuthFilter.SESSION_USER_ATTR) != null) {
        response.sendRedirect(request.getContextPath() + "/products");
    } else {
        response.sendRedirect(request.getContextPath() + "/login");
    }
%>
