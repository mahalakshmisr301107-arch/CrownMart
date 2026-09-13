<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jspf" %>

<h2>Your cart</h2>

<c:choose>
<c:when test="${empty cartItems}">
    <div class="card"><p class="muted">Your cart is empty. <a href="<c:url value='/products'/>">Browse products</a></p></div>
</c:when>
<c:otherwise>
<div class="card">
    <table>
        <thead>
            <tr><th>Product</th><th>Unit price</th><th>Quantity</th><th>Line total</th><th></th></tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${cartItems}">
            <tr>
                <td><c:out value="${item.productName}"/></td>
                <td>&#8377;<fmt:formatNumber value="${item.unitPrice}" minFractionDigits="2" maxFractionDigits="2"/></td>
                <td>
                    <form method="post" action="<c:url value='/cart/update'/>" style="display:flex; gap:6px;">
                        <input type="hidden" name="cartItemId" value="${item.id}">
                        <input type="number" name="quantity" value="${item.quantity}" min="1" max="${item.availableStock}" style="width:70px; margin:0;">
                        <button type="submit">Update</button>
                    </form>
                </td>
                <td>&#8377;<fmt:formatNumber value="${item.lineTotal}" minFractionDigits="2" maxFractionDigits="2"/></td>
                <td>
                    <form method="post" action="<c:url value='/cart/remove'/>">
                        <input type="hidden" name="cartItemId" value="${item.id}">
                        <button type="submit" style="background:#a33;">Remove</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <h3 style="text-align:right;">Total: &#8377;<fmt:formatNumber value="${cartTotal}" minFractionDigits="2" maxFractionDigits="2"/></h3>
    <div style="text-align:right;">
        <a class="btn" href="<c:url value='/checkout'/>">Proceed to checkout</a>
    </div>
</div>
</c:otherwise>
</c:choose>

<%@ include file="footer.jspf" %>
