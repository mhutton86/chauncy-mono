package com.mediokr.chauncy.service

import io.github.sashirestela.openai.SimpleOpenAI
import io.github.sashirestela.openai.domain.chat.ChatMessage.SystemMessage
import io.github.sashirestela.openai.domain.chat.ChatMessage.UserMessage
import io.github.sashirestela.openai.domain.chat.ChatRequest
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Service

@Service
class AiQueryService(
        @Value("\${openai.api.token}") private val openAiApiToken: String,
) {
    private final val logger = LoggerFactory.getLogger(this::class.java)
    private final val openAI: SimpleOpenAI

    init {
        openAI = SimpleOpenAI.builder().apiKey(openAiApiToken).build()

        logger.info("AiQueryService started...")
    }

    fun query(input: String): String {
        val chatRequest =
                ChatRequest.builder()
                        .model("gpt-4o-mini")
                        .message(
                                SystemMessage.of(
                                        "You are an expert in AI. Your responses are no more than 50 words. Answer the user's question in a concise and clear manner."
                                )
                        )
                        .message(UserMessage.of(input))
                        .temperature(0.0)
                        .maxCompletionTokens(300)
                        .build()

        val futureChat = openAI.chatCompletions().create(chatRequest)
        val chatResponse = futureChat.join()
        logger.info("AI Response: ${chatResponse.firstContent()}")

        return chatResponse.firstContent()
    }
}
