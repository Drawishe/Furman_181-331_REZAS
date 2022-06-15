#include <iostream>

int main()
{
    FILE* fptr;
    fopen_s(&fptr, "C:\\Lab1.furman", "r+");

    if (fptr == 0) {
        return -1;
    }

    char buf[1024] = { 0 };
    fread_s(buf, 1024, sizeof(char), 1024, fptr);
    printf_s("File data is:\n%s\n", buf);

    char buf_to_write[1024] = { "Test Value" };
    fseek(fptr, 0, 0);
    fwrite(buf_to_write, sizeof(char), 1024, fptr);
    fclose(fptr);

    return 0;



}
