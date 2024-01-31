#ifndef IO_H
#define IO_H

// Functions

// Display main menu and get user choice
int displayMainMenu();

// Confirm file has been written successfully
void displayConfirmation();

// Write data to a file
void writeToFile(const char* filename, const char* data);

// Reading from FIRST NAME file
void firstNameReader();

// Reading from LAST NAME file
void lastNameReader();

// Reading from COUNTRY file
void countryReader();

// Reading from EMAIL SUFFIX file
void emailSuffixReader();

#endif
