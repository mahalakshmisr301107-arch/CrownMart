package com.crownmart.app.chat;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class MockChatProviderTest {

    private final MockChatProvider mock = new MockChatProvider();

    @Test
    void nameIsMock() {
        assertEquals("mock", mock.name());
    }

    @Test
    void sellQuestionMentionsCreatePage() throws Exception {
        assertTrue(mock.reply("How do I sell a product?").contains("/products/create"));
    }

    @Test
    void orderQuestionMentionsOrdersPage() throws Exception {
        assertTrue(mock.reply("How do I place an order?").contains("/orders"));
    }

    @Test
    void categoryQuestionListsRealCategories() throws Exception {
        String r = mock.reply("What categories are there?");
        assertTrue(r.contains("Electronics"));
        assertTrue(r.contains("Home & Kitchen"));
    }

    @Test
    void reviewQuestionMentionsReview() throws Exception {
        assertTrue(mock.reply("How do I leave a review?").toLowerCase().contains("review"));
    }

    @Test
    void loginQuestionMentionsLoginPage() throws Exception {
        assertTrue(mock.reply("How do I log in?").contains("/login"));
    }

    @Test
    void unknownQuestionGivesFallback() throws Exception {
        assertEquals(MockChatProvider.FALLBACK, mock.reply("zzzz qqqq"));
    }

    @Test
    void nullMessageGivesFallback() throws Exception {
        assertEquals(MockChatProvider.FALLBACK, mock.reply(null));
    }
}