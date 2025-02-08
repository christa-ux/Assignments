#include <iostream>
//Names: Nicole Vilkoff(40321430)
//Christa Abou Arraje(4022663)
//Anabel Prévost(40265371)


int* createArray(int size) {
	int* arr = new int[size]; //"new" dynamically allocates memory


	if (arr == nullptr) {
		std::cout << "Memory allocation failed!" << std::endl;
		return nullptr; //if memory allocation fails, it returns null pointer
	}


	return arr; //returns a pointer to the newly allocated array
}


void initializeArray(int* arr, int size) { //takes pointer to an array, and the desired size of the array
	for (int i = 0; i < size; i++) {  //initializes the array with values from 0 to size-1
		arr[i] = i;
	}
}

void printArray(int* arr, int size) {
	std::cout << "Array: ";
	for (int i = 0; i < size; i++) {
		std::cout << arr[i] << " ";
	}
	std::cout << std::endl;
}


void deleteArray(int* arr) {
	// Deletes array to avoid memory leaks
	delete[] arr;
	arr = nullptr;  // Set the pointer to null to prevent dangling pointers 
	//(point to a memory location that has been freed, which can lead to undefined behavior)
}

int main() {
	
	int size;
	std::cout << "Enter the size of the array: ";
	std::cin >> size;

	//if (size <= 0) {
		//std::cout << "Invalid size. The size must be a positive integer." << std::endl;
		//return 1;
	//}
	int* myArray = createArray(size);
	

	
	if (myArray != nullptr) {

		initializeArray(myArray, size);


		printArray(myArray, size);

		
		deleteArray(myArray);

	
		std::cout << "Array after being deleted: " << std::endl;
		printArray(myArray, size); //if we get garbage value or undefined behavior, 
		//it means the array has been properly deleted since the pointer is now set to null; memory has been deallocated

	}

	return 0;
}

//if the user gives a negative integer for the size of th
// e array, our code does not handle that exception. So we're just going to have a syntax error. 

//This program demonstrates dynamic memory allocation in C++ by using the new operator to allocate memory for an array 
// and the delete[] operator to deallocate that memory.

// If you forget to delete the allocated array, it would result in a memory leak. The memory allocated for the array would not be returned to the system, 
//leading to inefficient memory usage and potential issues if the program runs for an extended period