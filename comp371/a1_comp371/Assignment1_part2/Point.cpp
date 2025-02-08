#include "Point.h"
#include <ioStream>

//constructor 
Point::Point(float aX, float aY, float aZ)
{
	x = aX;
	y = aY;
	z = aZ;
}

//default constructor
Point::Point()
{
	x = 0;
	y = 0;
	z = 0;
}

//destructor
Point::~Point()
{
	//nothing special has to be done when a point is deleted
}

// function that will translate a point
int Point::translate(int d, char axis)
{
	if (axis == 'x')
	{
		//translate the point
		x = x + d;
		return 0;
	}
	else if (axis == 'y')
	{
		//translate the point
		y = y + d;
		return 0;
	}
	else if (axis == 'z')
	{
		//translate the point
		z = z + d;
		return 0;
	}
	else
	{
		//return -1 when the exis is invalid
		return -1;
	}
}

//method that display the coordinates of a point
void Point::display()
{
	std::cout << "(" << x << ", " << y << ", " << z << ")";
}


