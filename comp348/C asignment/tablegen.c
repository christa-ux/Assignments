#include "io.h"
#include "generate.h"
#include "sort.h"
#include <stdio.h>
#include <stdlib.h> // for malloc() and free()
#include <string.h> // for strcat() and sprintf()

// char firstName[100];
// char lastName[100];
// char country[100];

void getUserInputForTableGen(char* selectedColumns, int* rowCount, char* filename) {
    printf("\nColumn Options\n");
    printf("--------------\n");
    printf("1. User ID\n");
    printf("2. First name\n");
    printf("3. Last name\n");
    printf("4. Country\n");
    printf("5. Phone Number\n");
    printf("6. Email address\n");
    printf("7. SIN\n");
    printf("8. Password\n");
    printf("Enter column list (comma-separated, no spaces): ");
    scanf("%s", selectedColumns);
    while ((getchar()) != '\n');
    do {
        printf("Enter row count (1 < n < 100): ");
        scanf("%d", rowCount);
        while ((getchar()) != '\n');
    } while (*rowCount <= 1 || *rowCount >= 100);
    printf("Enter output file name (without .txt suffix): ");
    scanf("%s", filename);
    strcat(filename, ".txt"); // appending .txt suffix
    while ((getchar()) != '\n');
}


char* generateTable(const char* selectedColumns, int rowCount) {
    char* tableData = malloc(rowCount * 200 * sizeof(char));
    if (!tableData) {
        printf("Error: Memory allocation for table data failed.\n");
        exit(1);
    }

    for (int i = 0; i < rowCount; i++) {
        char buffer[1000] = "";
        for (int j = 0; selectedColumns[j] != '\0'; j++) {
            switch (selectedColumns[j]) {
                case '1':
                    sprintf(buffer + strlen(buffer), "%d,", generateUserID());
                    break;
                case '2':
                    strcat(buffer, generateFirstName());
                    strcat(buffer, ",");
                    break;
                case '3':
                    strcat(buffer, generateLastName());
                    strcat(buffer, ",");
                    break;
                case '4':
                    strcat(buffer, generateCountry());
                    strcat(buffer, ",");
                    break;
                case '5':
                    strcat(buffer, generatePhoneNumber());
                    strcat(buffer, ",");
                    break;
                case '6':
                    // Assuming you want an email to be generated using a consistent first and last name
                    // If not, you might need to adjust the order of these cases.
                    strcat(buffer, generateEmail(generateFirstName(), generateLastName()));
                    strcat(buffer, ",");
                    break;
                case '7':
                    strcat(buffer, generateSIN());
                    strcat(buffer, ",");
                    break;
                case '8':
                    strcat(buffer, generatePassword());
                    strcat(buffer, ",");
                    break;
            }
        }
        strcat(tableData, buffer);
        strcat(tableData, "\n");
    }

    return tableData;
}

void handleTableGeneration() {
    char selectedColumns[100], filename[100];
    int rowCount;

    getUserInputForTableGen(selectedColumns, &rowCount, filename);

    char* data = generateTable(selectedColumns, rowCount);

    sortTable(data);

    writeToFile(filename, data);

    displayConfirmation();
    free(data);
}

void startApplication() {
    while (1) {
        int choice = displayMainMenu();
        if (choice == 1) {
            handleTableGeneration();
        } else if (choice == 2) {
            printf("Goodbye and thanks for using TableGen\n");
            break;
        } else {
            printf("Error: Invalid choice. Please try again.\n");
        }
    }
}

int main() {
    printf("Welcome to TableGen\n");
    startApplication();
    return 0;
}
