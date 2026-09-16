<%@ include file="WEB-INF/views/header.jspf" %>

<section class="hero">
    <div class="hero-content">
        <span class="eyebrow">✦ Trusted by independent sellers nationwide</span>
        <h1 class="hero-title">A marketplace built for <span class="accent">real sellers</span>, not algorithms.</h1>
        <p class="hero-subtitle">Buy directly from independent sellers, or start listing your own products in minutes. No hidden fees, no clutter — just a clean way to sell.</p>
        <div class="hero-actions">
            <a href="<c:url value='/products'/>" class="btn">Browse products</a>
            <a href="<c:url value='/register'/>" class="btn-outline">Start selling →</a>
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
        <span class="stat-number">4.7★</span>
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
        <span class="category-icon">🏠</span> Home &amp; Living
    </a>
    <a href="<c:url value='/products?category=Fashion'/>" class="category-tile">
        <span class="category-icon">👕</span> Fashion
    </a>
    <a href="<c:url value='/products?category=Electronics'/>" class="category-tile">
        <span class="category-icon">🔌</span> Electronics
    </a>
    <a href="<c:url value='/products?category=Beauty'/>" class="category-tile">
        <span class="category-icon">💄</span> Beauty
    </a>
    <a href="<c:url value='/products?category=Grocery'/>" class="category-tile">
        <span class="category-icon">🛒</span> Grocery
    </a>
    <a href="<c:url value='/products'/>" class="category-tile">
        <span class="category-icon">✦</span> View all
    </a>
</div>

<div class="section-heading">
    <h2>Featured products</h2>
    <a href="<c:url value='/products'/>">See all products →</a>
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
</div>

<%@ include file="WEB-INF/views/footer.jspf" %>