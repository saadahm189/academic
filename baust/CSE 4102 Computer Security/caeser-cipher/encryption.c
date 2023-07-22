#include <stdio.h>

int main()
{
    char message[100], temp;
    int i, key;

    printf("Message to encrypt:\n");
    gets(message);

    printf("Enter key:");
    scanf("%d", &key);

    i = 0;

    while (message[i] != '\0')
    {
        temp = message[i];
        if (temp >= 'a' && temp <= 'z')
        {
            temp = temp + key;
            if (temp > 'z')
            {
                temp = temp - 26;
            }
        }
        else if (temp >= 'A' && temp <= 'Z')
        {
            temp = temp + key;
            if (temp > 'Z')
            {
                temp = temp - 26;
            }
        }
        message[i] = temp;
        i++;
    }
    printf("Encrypted text:\n");
    puts(message);

    return 0;
}