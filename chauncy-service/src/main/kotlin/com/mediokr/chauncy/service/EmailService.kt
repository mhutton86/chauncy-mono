package com.mediokr.chauncy.service

import com.google.api.client.auth.oauth2.Credential
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport
import com.google.api.client.http.javanet.NetHttpTransport
import com.google.api.client.json.JsonFactory
import com.google.api.client.json.gson.GsonFactory
import com.google.api.client.util.store.FileDataStoreFactory
import com.google.auth.oauth2.GoogleCredentials
import com.google.auth.http.HttpCredentialsAdapter
import com.google.api.services.gmail.Gmail
import com.google.api.services.gmail.GmailScopes
import com.google.api.services.gmail.model.Label
import com.google.api.services.gmail.model.ListLabelsResponse
import java.io.FileNotFoundException
import java.io.IOException
import java.io.InputStream
import java.io.InputStreamReader
import java.security.GeneralSecurityException
import java.time.ZonedDateTime
import org.springframework.stereotype.Service
import org.springframework.beans.factory.annotation.Value
import org.slf4j.LoggerFactory

@Service
class EmailService {

  @Value("\${gmail.api.client-id}")
  private lateinit var clientId: String

  @Value("\${gmail.api.client-secret}")
  private lateinit var clientSecret: String

  @Value("\${gmail.api.refresh-token}")
  private lateinit var refreshToken: String

  private val logger = LoggerFactory.getLogger(this::class.java)

  companion object {
    private const val APPLICATION_NAME = "Chauncy: Gmail API Kotlin Integration"
    private val JSON_FACTORY: JsonFactory = GsonFactory.getDefaultInstance()
    private const val TOKENS_DIRECTORY_PATH = "tokens"
    private val SCOPES = listOf(GmailScopes.GMAIL_LABELS, GmailScopes.GMAIL_READONLY)
  }

  init {
    logger.info("${this::class.simpleName} started...")
    val credentialsStream = """
        {
          "installed": {
            "client_id": "$clientId",
            "client_secret": "$clientSecret",
            "refresh_token": "$refreshToken",
            "type": "authorized_user"
          }
        }
    """.trimIndent().byteInputStream()

    val credentials = GoogleCredentials.fromStream(credentialsStream)
        .createScoped(SCOPES)

    return HttpCredentialsAdapter(credentials)
  }
    return HttpCredentialsAdapter(credentials)
  }

  @Throws(IOException::class, GeneralSecurityException::class)
  fun getGmailService(): Gmail {
    val HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport()
    return Gmail.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials())
            .setApplicationName(APPLICATION_NAME)
            .build()
  }

  fun listLabels(): List<String> {
    val service = getGmailService()
    val user = "me"
    val listResponse: ListLabelsResponse = service.users().labels().list(user).execute()
    val labels: List<Label> = listResponse.labels
    return if (labels.isEmpty()) {
      emptyList()
    } else {
      labels.map { it.name }
    }
  }

  fun fetchEmails(
    label: String = "INBOX",
          limit: Int = 50,
          fetchAll: Boolean = false,
          withContent: Boolean = false,
          after: ZonedDateTime? = null,
          before: ZonedDateTime? = null
  ): List<String> {
    // TODO: Use Gmail API to query messages using label, limit, and date filters
    // - Build query string from after/before
    // - Call users().messages().list() with labelIds, maxResults, and query
    // - Optionally fetch full message content if withContent is true

    return emptyList()
  }

  fun getEmailContents(ids: List<String>): List<String> {
    // TODO: Use users().messages().get(id).execute() per ID
    // - Consider coroutine parallelism or ExecutorService

    return emptyList()
  }
}
