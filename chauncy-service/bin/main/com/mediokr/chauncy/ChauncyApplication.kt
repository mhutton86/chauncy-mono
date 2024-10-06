package com.mediokr.chauncy

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class ChauncyApplication

fun main(args: Array<String>) {
	runApplication<ChauncyApplication>(*args)
}
