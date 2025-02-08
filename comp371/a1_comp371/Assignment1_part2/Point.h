#pragma once

class Point
{
private:
	//Coordinates of a point
	float x = 0;
	float y = 0;
	float z = 0;

public:
	//constructors 
	Point(float x, float y, float z);
	Point();

	//destructor
	~Point();

	//methods
	int translate(int d, char axis);
	void display();

	//The triangle class is a friend of the Point class
	friend class Triangle;
};

