#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_ROW_SIZE 1024

// This function will compare two rows based on their User IDs.
int compareRows(const void* a, const void* b) {
    // Extract the User IDs from the start of each row.
    int id1 = atoi((const char*)a);
    int id2 = atoi((const char*)b);

    return id1 - id2;
}

void sortTable(char* data) {
    char* rows[100]; // Assuming a maximum of 100 rows as per the requirement.
    char* token;
    int rowCount = 0;

    token = strtok(data, "\n"); // Tokenize by new line.
    while(token != NULL) {
        rows[rowCount] = token;
        rowCount++;
        token = strtok(NULL, "\n");
    }

    qsort(rows, rowCount, sizeof(char*), compareRows);

    // Reconstruct the sorted data.
    data[0] = '\0';
    for(int i = 0; i < rowCount; i++) {
        strcat(data, rows[i]);
        strcat(data, "\n");
    }
}
