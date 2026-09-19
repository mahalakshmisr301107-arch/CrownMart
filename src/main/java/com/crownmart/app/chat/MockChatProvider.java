package com.crownmart.app.chat;

import java.util.List;
import java.util.Locale;

/**
 * Deterministic FAQ chatbot. Used as the default provider and as the fallback
 * when no API key is configured. First matching rule wins, so order matters:
 * put more specific rules above general ones.
 *
 * NOTE: adjust the answer texts below so they match your real UI wording.
 */
public class MockChatProvider implements ChatProvider {

    static final String FALLBACK =
            "I can help with questions about CrownMart: browsing products, "
          + "orders, reviews, selling, and your account. "
          + "Try asking, for example, \"How do I sell a product?\"";

    private record Rule(List<String> keywords, String answer) { }

    private static final List<Rule> RULES = List.of(
        new Rule(List.of(" hi ", " hello ", " hey "),
            "Hello! I'm the CrownMart assistant. Ask me about products, orders, reviews or selling."),

        new Rule(List.of("sell", "seller", "listing", "list a product"),
            "To sell on CrownMart, log in with a seller account and add your product from the seller "
          + "pages. Orders for your products appear on the Seller Orders page."),

        new Rule(List.of("review", "rating", "feedback"),
            "You can leave a review from a product's detail page. You need to be logged in to submit one."),

        new Rule(List.of("order", "track", "purchase", "bought"),
            "Once you are logged in, your orders are available from your account. "
          + "Sellers see orders for their own products on the Seller Orders page."),

        new Rule(List.of("categor", "electronics", "kitchen"),
            "CrownMart currently has two categories: Electronics and Home & Kitchen. "
          + "Use the category tiles on the home page to browse them."),

        new Rule(List.of("login", "log in", "sign in", "register", "sign up", "account", "password"),
            "Use Login or Register at the top of the page. Passwords are stored as secure hashes, "
          + "never in plain text."),

        new Rule(List.of("admin", "moderate", "remove", "report"),
            "Admins moderate the marketplace and can remove products that break the rules."),

        new Rule(List.of("product", "search", "find", "browse", "buy"),
            "Browse items on the Products page and click any card to see its details, price and reviews.")
    );

    @Override
    public String name() {
        return "mock";
    }

    @Override
    public String reply(String userMessage) {
        if (userMessage == null || userMessage.isBlank()) {
            return FALLBACK;
        }
        // Normalize: lowercase, strip punctuation, pad with spaces so " hi " matches whole words.
        String text = " " + userMessage.toLowerCase(Locale.ROOT)
                .replaceAll("[^a-z0-9& ]", " ")
                .replaceAll("\\s+", " ")
                .trim() + " ";

        for (Rule rule : RULES) {
            for (String keyword : rule.keywords()) {
                if (text.contains(keyword)) {
                    return rule.answer();
                }
            }
        }
        return FALLBACK;
    }
}
