<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="WEB-INF/views/header.jspf" %>

<section class="hero">
    <div class="hero-content">
        <span class="eyebrow">Trusted by independent sellers nationwide</span>
        <h1 class="hero-title">A marketplace built for <span class="accent">real sellers</span>, not algorithms.</h1>
        <p class="hero-subtitle">Buy directly from independent sellers, or start listing your own products in minutes. No hidden fees, no clutter &mdash; just a clean way to sell.</p>
        <div class="hero-actions">
            <a href="<c:url value='/products'/>" class="btn">Browse products</a>
            <a href="<c:url value='/register'/>" class="btn-outline">Start selling
                <svg class="icon-sm" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
            </a>
        </div>
    </div>
    <div class="hero-visual">
        <div class="hero-card hero-card-back"></div>
        <div class="hero-card hero-card-front">
            <span class="tag">Verified Seller</span>
            <div class="headline">Real products, real people, real reviews.</div>
            <span class="caption">Every listing is backed by an actual seller you can trust.</span>
        </div>
    </div>
</section>

<div class="stats-bar">
    <div class="stat-item">
        <span class="stat-number">1,200+</span>
        <span class="stat-label">Active listings</span>
    </div>
    <div class="stat-item">
        <span class="stat-number">300+</span>
        <span class="stat-label">Independent sellers</span>
    </div>
    <div class="stat-item">
        <span class="stat-number">4.7</span>
        <span class="stat-label">Average rating</span>
    </div>
    <div class="stat-item">
        <span class="stat-number">24hr</span>
        <span class="stat-label">Avg. dispatch time</span>
    </div>
</div>

<div class="section-heading">
    <h2>Shop by category</h2>
</div>
<div class="category-grid">
    <a href="<c:url value='/products?category=Home'/>" class="category-tile">
        <svg class="icon-lg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
        Home &amp; Living
    </a>
    <a href="<c:url value='/products?category=Fashion'/>" class="category-tile">
        <svg class="icon-lg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20.38 3.46 16 2a4 4 0 0 1-8 0L3.62 3.46a2 2 0 0 0-1.34 2.23l.58 3.47a1 1 0 0 0 .99.84H6v10c0 1.1.9 2 2 2h8a2 2 0 0 0 2-2V10h2.15a1 1 0 0 0 .99-.84l.58-3.47a2 2 0 0 0-1.34-2.23z"></path></svg>
        Fashion
    </a>
    <a href="<c:url value='/products?category=Electronics'/>" class="category-tile">
        <svg class="icon-lg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="4" y="2" width="16" height="20" rx="2"></rect><line x1="12" y1="18" x2="12.01" y2="18"></line></svg>
        Electronics
    </a>
    <a href="<c:url value='/products?category=Beauty'/>" class="category-tile">
        <svg class="icon-lg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><circle cx="12" cy="12" r="4"></circle></svg>
        Beauty
    </a>
    <a href="<c:url value='/products?category=Grocery'/>" class="category-tile">
        <svg class="icon-lg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
        Grocery
    </a>
    <a href="<c:url value='/products'/>" class="category-tile">
        <svg class="icon-lg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>
        View all
    </a>
</div>

<div class="section-heading">
    <h2>Featured products</h2>
    <a href="<c:url value='/products'/>">See all products</a>
</div>
<div class="product-grid">
    <c:forEach var="product" items="${featuredProducts}" varStatus="loop" end="7">
        <div class="card">
            <div style="height:150px; background:var(--surface-hover); border-radius:var(--radius-sm); margin-bottom:14px; display:flex; align-items:center; justify-content:center; overflow:hidden;">
                <c:choose>
                    <c:when test="${not empty product.imageUrl}">
                        <img src="${product.imageUrl}" alt="${product.name}" style="width:100%; height:100%; object-fit:cover;">
                    </c:when>
                    <c:otherwise>
                        <span class="muted">No image</span>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="muted" style="text-transform:uppercase; font-size:11px; margin-bottom:4px;">${product.category}</div>
            <div style="font-weight:600; margin-bottom:8px;"><c:out value="${product.name}"/></div>
            <div class="price">${product.price}</div>
        </div>
    </c:forEach>
    <c:if test="${empty featuredProducts}">
        <p class="muted">No featured products to show yet.</p>
    </c:if>
</div>

<%@ include file="WEB-INF/views/footer.jspf" %>