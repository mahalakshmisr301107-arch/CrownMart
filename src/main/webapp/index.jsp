<%@ include file="WEB-INF/views/header.jspf" %>

<section class="hero">
    <div class="hero-content">
        <span class="eyebrow">The Everyday, Made Special</span>
        <h1 class="hero-title">Good things,<br>from sellers who care.</h1>
        <p class="hero-subtitle">Discover home essentials, handcrafted goods, and everyday finds from independent sellers across India.</p>
        <div class="hero-actions">
            <a href="<c:url value='/products'/>" class="btn">Explore the marketplace</a>
            <a href="<c:url value='/register'/>" class="btn-outline">Become a seller &rarr;</a>
        </div>
    </div>
    <div class="hero-visual">
        <div class="hero-card hero-card-back"></div>
        <div class="hero-card hero-card-front">
            <span class="tag">Curated Today</span>
            <div class="headline">Objects with a story.</div>
            <span class="caption">From local hands to your home.</span>
        </div>
    </div>
</section>

<%@ include file="WEB-INF/views/footer.jspf" %>