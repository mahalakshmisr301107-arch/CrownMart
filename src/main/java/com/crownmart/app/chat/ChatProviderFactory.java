package com.crownmart.app.chat;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Picks the ChatProvider from configuration.
 *
 * Lookup order (first non-blank wins):
 *   1. environment variable  AI_CHATBOT_PROVIDER   (use this on Render)
 *   2. JVM system property   ai.chatbot.provider   (use this locally: -Dai.chatbot.provider=mock)
 *   3. default               mock
 *
 * No secrets live in the repo: the Gemini key (added in a later step) will
 * come from an environment variable too.
 */
public final class ChatProviderFactory {

    private static final Logger log = LoggerFactory.getLogger(ChatProviderFactory.class);

    private ChatProviderFactory() { }

    public static ChatProvider fromConfig() {
        String choice = read("AI_CHATBOT_PROVIDER", "ai.chatbot.provider", "mock")
                .trim().toLowerCase(Locale.ROOT);

        switch (choice) {
            case "gemini":
                // GeminiChatProvider is added in a later step; until then fall back safely.
                log.warn("ai.chatbot.provider=gemini requested but not available yet; using mock");
                return new MockChatProvider();
            case "mock":
                return new MockChatProvider();
            default:
                log.warn("Unknown ai.chatbot.provider '{}'; using mock", choice);
                return new MockChatProvider();
        }
    }

    private static String read(String envName, String propName, String defaultValue) {
        String value = System.getenv(envName);
        if (value == null || value.isBlank()) {
            value = System.getProperty(propName);
        }
        return (value == null || value.isBlank()) ? defaultValue : value;
    }
}
