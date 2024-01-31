#include "io.h"
#include<stdio.h>

int displayMainMenu() {
    int choice;
    do {
        printf("\nTableGen Menu\n");
        printf("-------------\n");
        printf("1. Generate new table\n");
        printf("2. Exit\n");
        printf("Selection: ");
        scanf("%d", &choice);
        while ((getchar()) != '\n');
    } while (choice != 1 && choice != 2);
    return choice;
}

void displayConfirmation() {
    char continueChar;
    printf("\nTable written successfully.\n");
    do {
        printf("Press 'c' or 'C' to continue: ");
        scanf(" %c", &continueChar);
        while ((getchar()) != '\n');
    } while (continueChar != 'c' && continueChar != 'C');
}

void writeToFile(const char* filename, const char* data) {
    char fullFilename[110];
    sprintf(fullFilename, "%s.csv", filename);
    FILE *file = fopen(fullFilename, "w");
    if (file != NULL) {
        fprintf(file, "%s", data);
        fclose(file);
    } else {
        printf("Error writing to file %s\n", fullFilename);
    }
}
