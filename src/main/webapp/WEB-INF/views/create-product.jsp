<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jspf" %>

<div class="card" style="max-width:480px; margin:0 auto;">
    <h2>List a new product</h2>
    <form method="post" action="<c:url value='/products/create'/>">
        <label>Name</label>
        <input type="text" name="name" required>

        <label>Description</label>
        <textarea name="description" rows="3"></textarea>

        <label>Category</label>
        <input type="text" name="category" required>

        <label>Price (&#8377;)</label>
        <input type="number" name="price" step="0.01" min="0.01" required>

        <label>Stock quantity</label>
        <input type="number" name="stockQty" min="0" required>

        <label>Image URL (optional)</label>
        <input type="text" name="imageUrl" placeholder="https://...">

        <button type="submit">Create listing</button>
    </form>
</div>

<%@ include file="footer.jspf" %>
