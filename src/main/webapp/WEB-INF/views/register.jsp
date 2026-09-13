<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jspf" %>

<div class="card" style="max-width:420px; margin:0 auto;">
    <h2>Create an account</h2>
    <form method="post" action="<c:url value='/register'/>">
        <label>Name</label>
        <input type="text" name="name" value="<c:out value='${formName}'/>" required>

        <label>Email</label>
        <input type="email" name="email" value="<c:out value='${formEmail}'/>" required>

        <label>Password (min 8 characters)</label>
        <input type="password" name="password" minlength="8" required>

        <label>I am a...</label>
        <select name="role" required>
            <option value="BUYER" <c:if test="${formRole == 'BUYER'}">selected</c:if>>Buyer</option>
            <option value="SELLER" <c:if test="${formRole == 'SELLER'}">selected</c:if>>Seller</option>
        </select>

        <button type="submit">Create account</button>
    </form>
    <p class="muted">Already have an account? <a href="<c:url value='/login'/>">Log in</a></p>
</div>

<%@ include file="footer.jspf" %>
