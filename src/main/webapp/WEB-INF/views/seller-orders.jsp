<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jspf" %>

<h2>Orders for your products</h2>

<c:choose>
<c:when test="${empty orders}">
    <div class="card"><p class="muted">No orders yet for your products.</p></div>
</c:when>
<c:otherwise>
    <c:forEach var="order" items="${orders}">
        <div class="card">
            <div style="display:flex; justify-content:space-between;">
                <strong>Order #${order.id}</strong>
                <span class="muted"><c:out value="${order.createdAt}"/></span>
            </div>
            <div>Buyer ID: <c:out value="${order.buyerId}"/></div>
            <div>Status: <strong><c:out value="${order.status}"/></strong></div>
            <table style="margin-top:8px;">
                <thead><tr><th>Your product</th><th>Qty</th><th>Unit price</th><th>Line total</th></tr></thead>
                <tbody>
                <c:forEach var="item" items="${order.items}">
                    <tr>
                        <td><c:out value="${item.productName}"/></td>
                        <td>${item.quantity}</td>
                        <td>&#8377;<fmt:formatNumber value="${item.unitPrice}" minFractionDigits="2" maxFractionDigits="2"/></td>
                        <td>&#8377;<fmt:formatNumber value="${item.lineTotal}" minFractionDigits="2" maxFractionDigits="2"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:forEach>
</c:otherwise>
</c:choose>

<%@ include file="footer.jspf" %>