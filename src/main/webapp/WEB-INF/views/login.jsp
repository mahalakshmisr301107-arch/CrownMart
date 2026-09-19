<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jspf" %>

<div class="card" style="max-width:420px; margin:0 auto;">
    <h2>Log in</h2>
    <form method="post" action="<c:url value='/login'/>">
        <label>Email</label>
        <input type="email" name="email" value="<c:out value='${formEmail}'/>" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <button type="submit">Log in</button>
    </form>
    <p class="muted">No account yet? <a href="<c:url value='/register'/>">Register</a></p>
    <p class="muted">Demo logins: buyer1@crownmart.com / crownmart123 &middot; seller1@crownmart.com / crownmart123</p>
</div>

<%@ include file="footer.jspf" %>