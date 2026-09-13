<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jspf" %>

<div class="card">
    <form method="get" action="<c:url value='/products'/>" style="display:flex; gap:12px; align-items:flex-end;">
        <div style="flex:2;">
            <label>Search</label>
            <input type="text" name="keyword" placeholder="Search by name or description" value="<c:out value='${keyword}'/>">
        </div>
        <div style="flex:1;">
            <label>Category</label>
            <input type="text" name="category" placeholder="e.g. Electronics" value="<c:out value='${category}'/>">
        </div>
        <div style="flex:0 0 auto; margin-bottom:12px;">
            <button type="submit">Search</button>
        </div>
    </form>
</div>

<div class="product-grid">
    <c:forEach var="p" items="${products}">
        <div class="card">
            <img src="<c:out value='${p.imageUrl}'/>" alt="" style="width:100%; height:140px; object-fit:cover; border-radius:6px;" onerror="this.style.display='none'">
            <h3 style="margin:8px 0 4px;"><c:out value="${p.name}"/></h3>
            <div class="muted"><c:out value="${p.category}"/></div>
            <p><c:out value="${p.description}"/></p>
            <div class="price">&#8377;<fmt:formatNumber value="${p.price}" minFractionDigits="2" maxFractionDigits="2"/></div>
            <div class="muted">
                <c:choose>
                    <c:when test="${p.stockQty > 0}">${p.stockQty} in stock</c:when>
                    <c:otherwise>Out of stock</c:otherwise>
                </c:choose>
            </div>
            <c:if test="${p.stockQty > 0}">
                <form method="post" action="<c:url value='/cart/add'/>" style="margin-top:8px; display:flex; gap:8px;">
                    <input type="hidden" name="productId" value="${p.id}">
                    <input type="number" name="quantity" value="1" min="1" max="${p.stockQty}" style="width:70px; margin:0;">
                    <button type="submit">Add to cart</button>
                </form>
            </c:if>
        </div>
    </c:forEach>
    <c:if test="${empty products}">
        <p class="muted">No products found.</p>
    </c:if>
</div>

<%@ include file="footer.jspf" %>
