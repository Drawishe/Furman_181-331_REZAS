﻿#include <stdio.h>
#include <tchar.h>
#include <string.h>

#define BUF_LEN 100 // Длина буфера обмена между анклавом и небезопасным приложением
/*
const char table[6][41] = {
	// Значения были сгенерированы случайным образом благодаря: https://www.browserling.com/tools/random-hex
	"2BC7F22C0EF28F5C14DB4F2D4430AAD222532280",
	"5373FEDA0C3B53A1B425FFB8542E8CEAB8B8620F",
	"9334D8E51ADDF87674B4980600DA1060D62F0D4A",
	"2510A8AC5824C6873386B59923227BA9FFA942C1",
	"5660D3FEE4AC52F18BFF3CA31DDB5EF46A46D381",
	"4B368C460AB00A9D7CF4C35775D8CE8086F9AA6F"
};

void foo(char* buf, size_t len, size_t idx) {
	if (idx < 6) {
		const char* data_ptr = data_ptr = table[idx];
		memcpy(buf, data_ptr, strlen(data_ptr + 1));
	}
	else {
		memset(buf, 0, strlen(table[0]));
	}
	return;
}
*/
int main() {

	char buffer[BUF_LEN] = { 0 };

	while (true) {
		printf("Enter a number of object to get information or enter -1 to exit a program: \t");
		int idx = -1;
		scanf_s("%d", &idx);
		if (idx < 0) {
			return 0;
		}
		foo(buffer, BUF_LEN, idx);
		printf("%s \n******************************************\n\n", buffer);
	}
	return 0;
}