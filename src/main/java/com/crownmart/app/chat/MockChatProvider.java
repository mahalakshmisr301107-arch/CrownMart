package com.crownmart.app.chat;

/**
 * Keyword-based fallback provider. Every answer only mentions pages that exist in CrownMart.
 */
public class MockChatProvider implements ChatProvider {

    static final String FALLBACK =
            "I can help with buying, selling, orders, reviews, categories and logging in on CrownMart. "
            + "Try asking, for example: \"How do I sell a product?\"";

    @Override
    public String name() {
        return "mock";
    }

    @Override
    public String reply(String userMessage) throws ChatProviderException {
        String m = " " + (userMessage == null ? "" : userMessage.toLowerCase())
                .replaceAll("[^a-z0-9& ]", " ").replaceAll("\\s+", " ").trim() + " ";

        if (has(m, "sell", "seller", "listing", "list a product", "add a product", "add product", "create product")) {
            return "To sell on CrownMart, log in with a seller account, then open the page /products/create "
                    + "to add your product. You can also edit or delete your own products. "
                    + "Orders for your products appear on the Seller Orders page (/orders/seller).";
        }
        if (has(m, "review", "rating", "rate ")) {
            return "To leave a review, log in, open a product from the Products page, and use the review form "
                    + "on that product's page.";
        }
        if (has(m, "order", "checkout", "buy", "purchase", "cart")) {
            return "To buy: open a product, add it to your cart, then open the Cart page and go to Checkout. "
                    + "After that, you can see your orders on the Orders page (/orders).";
        }
        if (has(m, "categor")) {
            return "CrownMart has two categories: Electronics and Home & Kitchen. "
                    + "Open the Products page (/products) to see the listings.";
        }
        if (has(m, "login", "log in", "sign in", "account", "register", "sign up", "password")) {
            return "Use the Login page (/login) to sign in. New users can create an account on the "
                    + "Register page (/register).";
        }
        if (has(m, "admin", "moderat", "remove product")) {
            return "Admin users have a dashboard at /admin/dashboard, where they can review the marketplace "
                    + "and remove products.";
        }
        if (has(m, "product", "browse", "search", "find", "shop", "items")) {
            return "Open the Products page (/products) to see all listings. Click a product to see its details.";
        }
        if (has(m, " hi ", " hello ", " hey ", "good morning", "good evening", "help")) {
            return "Hello! I can help with buying, selling, orders and reviews on CrownMart. What would you like to know?";
        }
        return FALLBACK;
    }

    private static boolean has(String text, String... keys) {
        for (String k : keys) {
            if (text.contains(k)) {
                return true;
            }
        }
        return false;
    }
}