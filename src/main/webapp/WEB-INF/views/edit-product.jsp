<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Product - CrownMart</title>
</head>
<body>
    <h1>Edit Listing</h1>

    <c:if test="${not empty errorMessage}">
        <p style="color:red;"><c:out value="${errorMessage}" /></p>
    </c:if>

    <form action="${pageContext.request.contextPath}/products/edit?id=${product.id}" method="post">
        <label>Name:
            <input type="text" name="name" value="${fn:escapeXml(product.name)}" required />
        </label><br/>

        <label>Description:
            <textarea name="description">${fn:escapeXml(product.description)}</textarea>
        </label><br/>

        <label>Price:
            <input type="number" step="0.01" name="price" value="${product.price}" required />
        </label><br/>

        <label>Stock Quantity:
            <input type="number" name="stockQty" value="${product.stockQty}" required />
        </label><br/>

        <label>Category:
            <input type="text" name="category" value="${fn:escapeXml(product.category)}" required />
        </label><br/>

        <label>Image URL:
            <input type="text" name="imageUrl" value="${fn:escapeXml(product.imageUrl)}" />
        </label><br/>

        <button type="submit">Save Changes</button>
    </form>

    <form action="${pageContext.request.contextPath}/products/delete" method="post"
          onsubmit="return confirm('Are you sure you want to delete this listing?');">
        <input type="hidden" name="id" value="${product.id}" />
        <button type="submit">Delete Listing</button>
    </form>

    <a href="${pageContext.request.contextPath}/products">Back to products</a>
</body>
</html>