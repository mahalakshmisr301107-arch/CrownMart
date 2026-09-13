<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jspf" %>

<h2>Your orders</h2>

<c:choose>
<c:when test="${empty orders}">
    <div class="card"><p class="muted">You haven't placed any orders yet.</p></div>
</c:when>
<c:otherwise>
    <c:forEach var="order" items="${orders}">
        <div class="card">
            <div style="display:flex; justify-content:space-between;">
                <strong>Order #${order.id}</strong>
                <span class="muted"><c:out value="${order.createdAt}"/></span>
            </div>
            <div>Status: <strong><c:out value="${order.status}"/></strong></div>
            <table style="margin-top:8px;">
                <thead><tr><th>Product</th><th>Qty</th><th>Unit price</th><th>Line total</th></tr></thead>
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
            <h4 style="text-align:right;">Total: &#8377;<fmt:formatNumber value="${order.totalAmount}" minFractionDigits="2" maxFractionDigits="2"/></h4>
        </div>
    </c:forEach>
</c:otherwise>
</c:choose>

<%@ include file="footer.jspf" %>
