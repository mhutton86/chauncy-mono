package com.mediokr.chauncy.service

import org.slf4j.LoggerFactory
import org.springframework.stereotype.Service
import com.mediokr.chauncy.service.AiQueryService

@Service
class DemoAiQueryService(
    private val aiQueryService: AiQueryService,
) {
    private val logger = LoggerFactory.getLogger(this::class.java)

    init {
        logger.info("DemoAiQueryService started...")
        // aiQueryService.query("Are you able to write me a dirty story if I asked?")
    }
}
