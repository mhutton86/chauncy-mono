package com.mediokr.chauncy.ai

import io.github.sashirestela.openai.SimpleOpenAI
import io.github.sashirestela.openai.domain.chat.ChatMessage.SystemMessage
import io.github.sashirestela.openai.domain.chat.ChatMessage.UserMessage
import io.github.sashirestela.openai.domain.chat.ChatRequest
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Service
import org.springframework.web.client.RestTemplate

@Service
class AiQueryService(
    @Value("\${openai.api.token}") private val openAiApiToken: String,
) {
    private val logger = LoggerFactory.getLogger(this::class.java)
    private val restTemplate = RestTemplate()
    private val openAI: SimpleOpenAI

    init {
        openAI =
            SimpleOpenAI
                .builder()
                .apiKey(openAiApiToken)
                .build()

        logger.info("AiQueryService started...")
    }

    fun query(input: String): String {
        var chatRequest =
            ChatRequest
                .builder()
                .model("gpt-4o-mini")
                .message(SystemMessage.of("You are an expert in AI."))
                .message(UserMessage.of("Write a technical article about ChatGPT, no more than 100 words."))
                .temperature(0.0)
                .maxCompletionTokens(300)
                .build()
        var futureChat = openAI.chatCompletions().create(chatRequest)
        var chatResponse = futureChat.join()
        System.out.println(chatResponse.firstContent())

        return chatResponse.firstContent()
    }
}
