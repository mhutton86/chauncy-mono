package com.mediokr.chauncy.ai

import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Service
import org.springframework.web.client.RestTemplate
import io.github.sashirestela.openai.SimpleOpenAI
import io.github.sashirestela.openai.domain.chat.ChatRequest;
import io.github.sashirestela.openai.domain.chat.ChatMessage.SystemMessage;
import io.github.sashirestela.openai.domain.chat.ChatMessage.UserMessage;

@Service
class DemoAiQueryService(
    private val aiQueryService: AiQueryService,
) {
    private val logger = LoggerFactory.getLogger(this::class.java)

    init {
        logger.info("DemoAiQueryService started...")
        aiQueryService.query("")
    }
}
