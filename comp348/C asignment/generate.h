#ifndef GENERATE_H
#define GENERATE_H

// Function declarations (prototypes)

void generateData(char* tableColumns, int rowCount, char* filename);
int generateUserID();
char* generateFirstName();
char* generateLastName();
char* generateCountry();
char* generatePhoneNumber();
char* generateEmail(const char* firstName, const char* lastName);
char* generateSIN();
char* generatePassword();

#endif 
