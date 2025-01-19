package com.mediokr.chauncy.ai

import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Service
import org.springframework.web.client.RestTemplate

@Service
class AiQueryService(
    @Value("\${ai.query.service.url}") private val serviceUrl: String,
    @Value("\${ai.query.service.token}") private val apiToken: String,
) {
    private val logger = LoggerFactory.getLogger(AiQueryService::class.java)
    private val restTemplate = RestTemplate()

    init {
        logger.info("AiQueryService started with serviceUrl: $serviceUrl")
    }

    fun query(input: String): String {
        val response =
            restTemplate.getForObject(
                "$serviceUrl?input=$input&token=$apiToken",
                String::class.java,
            )
        return response ?: "Query result for: $input"
    }
}
