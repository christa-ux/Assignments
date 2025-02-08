#include "Triangle.h"
#include <cmath>
#include <ioStream>

//constructor
Triangle::Triangle(Point p1, Point p2, Point p3)
{
	vertex_1 = new Point(p1);
	vertex_2 = new Point(p2);
	vertex_3 = new Point(p3);
}

//default constructor
Triangle::Triangle()
{
	vertex_1 = nullptr;
	vertex_2 = nullptr;
	vertex_3 = nullptr;
}

//destructor
Triangle::~Triangle()
{
	//delete the vertices if they are not nullptr else delete nothing
	if (vertex_1 != nullptr)
	{
		delete vertex_1;
		vertex_1 = nullptr;
	}
	if (vertex_2 != nullptr)
	{
		delete vertex_2;
		vertex_2 = nullptr;
	}
	if (vertex_3 != nullptr)
	{
		delete vertex_3;
		vertex_3 = nullptr;
	}
	
}

//getters
Point* Triangle::getVertex_1()
{
	return vertex_1;
}

Point* Triangle::getVertex_2()
{
	return vertex_2;
}

Point* Triangle::getVertex_3()
{
	return vertex_3;
}

//method that set the points of a triangle
void Triangle::setPoints(Point p1, Point p2, Point p3)
{
	//the setPoints method assigns the given points to the vertices of the triangle. 
	// If the vertices are not yet initialized (i.e., they are nullptr), it allocates new memory for them. 
	// If they are already initialized, it simply updates the values of the existing points
	if (vertex_1 == nullptr)
	{
		vertex_1 = new Point(p1);
	}
	else
	{
		*vertex_1 = p1;
	}
	if (vertex_2 == nullptr)
	{
		vertex_2 = new Point(p2);
	}
	else
	{
		*vertex_2 = p2;
	}
	if (vertex_3 == nullptr)
	{
		vertex_3 = new Point(p3);
	}
	else
	{
		*vertex_1 = p3;
	}
}

//method that translates a triangle 
int Triangle::translate(int d, char axis)
{
	//variable used to hold an error code
	int correctEntry;

	//translate each points independently
	correctEntry = vertex_1->translate(d, axis);
	vertex_2->translate(d, axis);
	vertex_3->translate(d, axis);

	//return an error code or 0 if no error
	return correctEntry;

}

//method that calculates the area of the triangle
double Triangle::calcArea()
{
	//vectors
	Point vertex_1_2;
	Point vertex_1_3;

	Point norm;
	double magnitude;

	//calculate the vector between vertex_1 and vertex_2
	vertex_1_2.x = vertex_2->x - vertex_1->x;
	vertex_1_2.y = vertex_2->y - vertex_1->y;
	vertex_1_2.z = vertex_2->z - vertex_1->z;

	//calculate the vector between vertex_1 and vertex_3
	vertex_1_3.x = vertex_3->x - vertex_1->x;
	vertex_1_3.y = vertex_3->y - vertex_1->y;
	vertex_1_3.z = vertex_3->z - vertex_1->z;

	//calculate the norm using the cross product
	norm.x = vertex_1_2.y * vertex_1_3.z - vertex_1_2.z * vertex_1_3.y;
	norm.y = -(vertex_1_2.x * vertex_1_3.z - vertex_1_2.z * vertex_1_3.x);
	norm.z = vertex_1_2.x * vertex_1_3.y - vertex_1_2.y * vertex_1_3.x;

	//calculate the magnitude
	magnitude = sqrt(norm.x*norm.x + norm.y*norm.y + norm.z*norm.z);

	//return the area 
	return 1.0 / 2.0 * magnitude;

}

//method that display the three points of the triangle
void Triangle::display()
{
	std::cout << "the coordinates of your triangle are: " << std::endl << "vertex 1: ";
	vertex_1->display();
	std::cout << std::endl << "vertex 2: ";
	vertex_2->display();
	std::cout << std::endl << "vertex 3: ";
	vertex_3->display();
	std::cout << std::endl;
}