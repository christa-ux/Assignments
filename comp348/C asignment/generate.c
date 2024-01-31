#include "generate.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

static const int phoneIndexCodes[10] = {398, 270, 925, 867, 209, 429, 908, 997, 444, 219};
static int currentID = 0;

char* randomLineFromFile(const char* filename) {
    FILE *file = fopen(filename, "r");
    if (!file) return NULL;

    int lineCount = 0;
    while (!feof(file)) {
        char ch = fgetc(file);
        if (ch == '\n') {
            lineCount++;
        }
    }
    
    int randomLine = rand() % lineCount;
    rewind(file);
    for (int i = 0; i < randomLine; i++) {
        while (fgetc(file) != '\n') {}
    }

    static char line[100];
    fgets(line, sizeof(line), file);
    fclose(file);
    
    size_t len = strlen(line);
    if (len > 0 && line[len-1] == '\n') {
        line[len-1] = '\0';
    }

    return line;
}

void generateData(char* tableColumns, int rowCount, char* filename) {
    FILE *file = fopen(filename, "w");
    if (!file) {
        printf("Error opening file %s for writing.\n", filename);
        return;
    }
    
    // Writing the table columns (headers) to the CSV
    fprintf(file, "%s\n", tableColumns);
    
    // Generate data for each row
    for (int i = 0; i < rowCount; i++) {
        char* firstName = generateFirstName();
        char* lastName = generateLastName();
        char* country = generateCountry();
        char* phoneNumber = generatePhoneNumber();
        char* email = generateEmail(firstName, lastName);
        char* sin = generateSIN();
        char* password = generatePassword();
        int userID = generateUserID();

        // Assuming your columns are in this order: UserID, First Name, Last Name, Country, Phone Number, Email, SIN, Password
        // Modify the fprintf line as needed if the order or columns are different
        fprintf(file, "%d,%s,%s,%s,%s,%s,%s,%s\n", userID, firstName, lastName, country, phoneNumber, email, sin, password);
    }

    fclose(file);
    printf("Data generation completed. Saved to %s.\n", filename);
}


int generateUserID() {
    return currentID++;
}

char* generateFirstName() {
    return randomLineFromFile("../first_names.txt");
}

char* generateLastName() {
    return randomLineFromFile("../last_names.txt");
}

char* generateCountry() {
    return randomLineFromFile("../countries.txt");
}

char* generatePhoneNumber() {
    static char phoneNumber[10];
    int index = rand() % 10;
    int suffix = rand() % 10000;
    sprintf(phoneNumber, "%d-%04d", phoneIndexCodes[index], suffix);
    return phoneNumber;
}

char* generateEmail(const char* firstName, const char* lastName) {
    static char email[100];
    char suffix[100];
    strcpy(suffix, randomLineFromFile("email_suffixes.txt"));
    snprintf(email, sizeof(email), "%c%.48s@%.48s", firstName[0], lastName, suffix);
    return email;
}

char* generateSIN() {
    static char sinNumber[10];
    for (int i = 0; i < 9; i++) {
        sinNumber[i] = '0' + (rand() % 10);
    }
    sinNumber[9] = '\0';
    return sinNumber;
}

char* generatePassword() {
    static char password[17];
    const char chars[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[]{}|;:'<>.?/";
    int passwordLength = 6 + (rand() % 11);
    for (int i = 0; i < passwordLength; i++) {
        password[i] = chars[rand() % (sizeof(chars) - 1)];
    }
    password[passwordLength] = '\0';
    return password;
}
