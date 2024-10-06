package com.mediokr.chauncy

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class ChauncyApplication

@Suppress("INLINE_FROM_HIGHER_PLATFORM")
fun main(args: Array<String>) {
	runApplication<ChauncyApplication>(*args)
}
