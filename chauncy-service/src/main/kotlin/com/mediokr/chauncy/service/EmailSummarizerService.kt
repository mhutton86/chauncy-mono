package com.mediokr.chauncy.service

import org.slf4j.LoggerFactory
import org.springframework.stereotype.Service

@Service
class EmailSummarizerService(
    private val emailService: EmailService,
    private val aiQueryService: AiQueryService
) {
    private val logger = LoggerFactory.getLogger(this::class.java)

    fun summarizeEmails(): List<String> {
        logger.info("Starting email summarization...")
        val emails = emailService.retrieveEmails()
        return emails.map { email ->
            logger.info("Summarizing email: $email")
            aiQueryService.query("Summarize this email: $email")
        }
    }
}
