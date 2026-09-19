<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="WEB-INF/views/header.jspf" %>

<section style="text-align:center; padding:64px 20px 48px; max-width:720px; margin:0 auto;">
    <span class="eyebrow">A small marketplace, run right</span>
    <h1 class="hero-title" style="font-size:42px;">Find something you'll<br><span class="accent">actually love</span>, from people who made it.</h1>
    <p class="hero-subtitle" style="margin-left:auto; margin-right:auto;">
        CrownMart connects buyers with independent sellers directly &mdash; no middlemen,
        no inflated prices, just honest listings and real reviews from real customers.
    </p>
    <div class="hero-actions" style="justify-content:center;">
        <a href="<c:url value='/products'/>" class="btn">Start browsing</a>
        <a href="<c:url value='/register'/>" class="btn-outline">Become a seller
            <svg class="icon-sm" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
        </a>
    </div>
</section>

<div style="display:grid; grid-template-columns:repeat(auto-fit, minmax(220px, 1fr)); gap:20px; margin:56px 0;">
    <div class="card" style="text-align:center;">
        <svg class="icon-lg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
        <div style="font-weight:700; margin-bottom:6px;">Every seller is verified</div>
        <p class="muted">No anonymous storefronts &mdash; every listing is tied to a real, accountable seller.</p>
    </div>
    <div class="card" style="text-align:center;">
        <svg class="icon-lg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
        <div style="font-weight:700; margin-bottom:6px;">Reviews you can trust</div>
        <p class="muted">Only buyers who've actually completed an order can leave a rating.</p>
    </div>
    <div class="card" style="text-align:center;">
        <svg class="icon-lg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="18" height="18" rx="2"></rect><line x1="3" y1="9" x2="21" y2="9"></line><line x1="9" y1="21" x2="9" y2="9"></line></svg>
        <div style="font-weight:700; margin-bottom:6px;">Simple, honest pricing</div>
        <p class="muted">The price you see is what you pay. No surprise fees at checkout.</p>
    </div>
</div>

<div class="section-heading">
    <h2>Browse by category</h2>
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
    <h2>Fresh on the marketplace</h2>
    <a href="<c:url value='/products'/>">Browse everything</a>
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