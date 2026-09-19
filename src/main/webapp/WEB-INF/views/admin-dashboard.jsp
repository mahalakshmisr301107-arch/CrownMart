<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jspf" %>

<h2>Admin Dashboard</h2>

<div class="card">
    <h3>Users (<c:out value="${users.size()}"/>)</h3>
    <table>
        <tr><th>ID</th><th>Name</th><th>Email</th><th>Role</th><th>Created</th></tr>
        <c:forEach var="u" items="${users}">
            <tr>
                <td><c:out value="${u.id}"/></td>
                <td><c:out value="${u.name}"/></td>
                <td><c:out value="${u.email}"/></td>
                <td><c:out value="${u.role}"/></td>
                <td><c:out value="${u.createdAt}"/></td>
            </tr>
        </c:forEach>
    </table>
</div>

<div class="card">
    <h3>Products (<c:out value="${products.size()}"/>)</h3>
    <table>
        <tr><th>ID</th><th>Name</th><th>Category</th><th>Price</th><th>Stock</th><th>Seller ID</th><th></th></tr>
        <c:forEach var="p" items="${products}">
            <tr>
                <td><c:out value="${p.id}"/></td>
                <td><c:out value="${p.name}"/></td>
                <td><c:out value="${p.category}"/></td>
                <td class="price"><c:out value="${p.price}"/></td>
                <td><c:out value="${p.stockQty}"/></td>
                <td><c:out value="${p.sellerId}"/></td>
                <td>
                    <form method="post" action="<c:url value='/admin/products/remove'/>"
                          onsubmit="return confirm('Remove this listing? This cannot be undone.');">
                        <input type="hidden" name="id" value="${p.id}">
                        <button type="submit" style="background:#a33;">Remove</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<div class="card">
    <h3>Orders (<c:out value="${orders.size()}"/>)</h3>
    <table>
        <tr><th>ID</th><th>Buyer</th><th>Status</th><th>Total</th><th>Placed</th></tr>
        <c:forEach var="o" items="${orders}">
            <tr>
                <td><c:out value="${o.id}"/></td>
                <td><c:out value="${buyerNames[o.buyerId]}"/></td>
                <td><c:out value="${o.status}"/></td>
                <td class="price"><c:out value="${o.totalAmount}"/></td>
                <td><c:out value="${o.createdAt}"/></td>
            </tr>
        </c:forEach>
    </table>
</div>

<%@ include file="footer.jspf" %>