//Names: Nicole Vilkoff(40321430)
//Christa Abou Arraje(40226631)
//Anabel Prévost(40265371)

#include "Point.h"
#include "Triangle.h"
#include <ioStream>
#include <limits>
#include <string>

int main()
{
	//coordinates 
	float myX;
	float myY;
	float myZ;

	//points
	Point p1;
	Point p2;
	Point p3;

	Triangle myTriangle;
	int choiceInt;
	std:: string choiceStr = "";

	//menu options
	do
	{
		std::cout << "*****------------------------------------*****" << std::endl;
		std::cout << "Welcome to the triangle calculator!" << std::endl;
		std::cout << "*****------------------------------------*****" << std::endl;
		std::cout << "1- Enter the coordinates of the triangle" << std::endl;
		std::cout << "2- Translate the triangle" << std::endl;
		std::cout << "3- Calculate the area of the triangle" << std::endl;
		std::cout << "4- Display the coordinates of the triangle" << std::endl;
		std::cout << "5- Exit" << std::endl;

		std::cin >> choiceStr;

		//if the length of the the string is bigger than 1, don't accept it
		while (choiceStr.size() > 1)
		{
			std::cout << "Enter a valid choice" << std::endl;
			std::cin >> choiceStr;
		}
		//if the string is not 1,2,3,4 or 5, don't accept it
		while (choiceStr.at(0) != '1' && choiceStr.at(0) != '2' && choiceStr.at(0) != '3' && choiceStr.at(0) != '4' && choiceStr.at(0) != '5')
		{
			std::cout << "Enter a valid choice" << std::endl;
			std::cin >> choiceStr;
		}

		//convert the string into an int
		choiceInt = std::stoi(choiceStr);

		switch (choiceInt)
		{

		//Enter the coordinates of the three points of a triangle
		case 1:
		{
			//point 1
			std::cout << "enter the coordinates of the three points of your triangle" << std::endl << "Point 1 -> x:";
			std::cin >> myX;
			std::cout << "	y: ";
			std::cin >> myY;
			std::cout << "	z: ";
			std::cin >> myZ;
			Point p1(myX, myY, myZ);

			//point 2
			std::cout << "Point 2 -> x: ";
			std::cin >> myX;
			std::cout << "	y: ";
			std::cin >> myY;
			std::cout << "	z: ";
			std::cin >> myZ;
			Point p2(myX, myY, myZ);

			//point 3
			std::cout << "Point 3 -> x: ";
			std::cin >> myX;
			std::cout << "	y: ";
			std::cin >> myY;
			std::cout << "	z: ";
			std::cin >> myZ;
			Point p3(myX, myY, myZ);


			//set the three points of the triangle
			myTriangle.setPoints(p1,p2,p3);

			break;
		}
			
		//Translate a triangle
		case 2:
			//if no points have been entered
			if (myTriangle.getVertex_1 () == nullptr)
			{
				std::cout << "The points of the triangle have not been initialized yet." << std::endl;
			}
			else
			{
				//used to store an error code
				int correctEntry = 0;

				//Translates the triangle
				std::cout << std::endl << "On what axis do you wish to translate the triangle? (x, y, z) ";
				char axis;
				std::cin >> axis;
				std::cout << std::endl << "What is the distance you wish to translate the triangle on the axis " << axis << std::endl;
				int distanceInt;
				std::string distanceStr;
				
				std::cin >> distanceStr;

				//loop through each character of the string and check if it is a digit
				for (char c: distanceStr)
				{
					if (isdigit(c) == false)
					{
						correctEntry += -2;
						distanceStr = "0";
						break;
					}
				}

				//convert the string into an int
				distanceInt = std::stoi(distanceStr);
				
				//do the translation
				correctEntry += myTriangle.translate(distanceInt, axis);

				//print the correct error message if necessary
				if (correctEntry == -1)
				{
					std::cout << "The axis entered is invalid" << std::endl;
				}
				if (correctEntry == -2)
				{
					std::cout << "The distance is invalid. It has to be an integer." << std::endl;
				}
				if (correctEntry == -3)
				{
					std::cout << "The axis and the distance are invalid values. correct values are x,y and z for the axis and an integer for the distance." << std::endl;
				}
			}
			break;

		//Calculate the area of a triangle
		case 3:

			//if no points have been entered
			if (myTriangle.getVertex_1() == nullptr)
			{
				std::cout << "The points of the triangle have not been initialized yet." << std::endl;
			}
			else
			{
				//calculate the area of the triangle
				std::cout << "The area of the triangle is: " << myTriangle.calcArea() << std::endl;
			}
			break;

		//display the coordinates of the triangle
		case 4:

			//if no points have been entered
			if (myTriangle.getVertex_1() == nullptr)
			{
				std::cout << "The points of the triangle have not been initialized yet." << std::endl;
			}
			else
			{
				//displat the coordinates of the triangle
				myTriangle.display();
			}
			
			break;

		//quit the program
		case 5:
			std::cout << "Goodbye! Thank you for using the triangle calculator";
			return 0;
			break;

		default:
			std::cout << "Enter a valid choice";
			break;
		}


	} while (true); //repeat until the program quit
	
};

//The code consists of a main function that provides a menu-driven interface for the user. 
// It uses two main classes: Point for representing points in 3D space and Triangle for representing a triangle defined by three points. 
// The Triangle class includes methods for setting points, translating the triangle, calculating its area, and displaying its vertices.