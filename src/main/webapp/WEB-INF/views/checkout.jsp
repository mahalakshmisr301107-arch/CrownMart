<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jspf" %>

<h2>Checkout</h2>

<c:choose>
<c:when test="${empty cartItems}">
    <div class="card"><p class="muted">Your cart is empty. <a href="<c:url value='/products'/>">Browse products</a></p></div>
</c:when>
<c:otherwise>
<div class="card">
    <table>
        <thead><tr><th>Product</th><th>Qty</th><th>Line total</th></tr></thead>
        <tbody>
        <c:forEach var="item" items="${cartItems}">
            <tr>
                <td><c:out value="${item.productName}"/></td>
                <td>${item.quantity}</td>
                <td>&#8377;<fmt:formatNumber value="${item.lineTotal}" minFractionDigits="2" maxFractionDigits="2"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <h3 style="text-align:right;">Total: &#8377;<fmt:formatNumber value="${cartTotal}" minFractionDigits="2" maxFractionDigits="2"/></h3>

    <p class="muted">This is a mock payment step for the MVP - no real payment gateway is involved. Click below to simulate a successful payment and place your order.</p>

    <form method="post" action="<c:url value='/checkout'/>" style="text-align:right;">
        <button type="submit">Confirm Payment</button>
    </form>
</div>
</c:otherwise>
</c:choose>

<%@ include file="footer.jspf" %>
