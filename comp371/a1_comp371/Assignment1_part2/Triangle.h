#pragma once
#include "Point.h"

class Triangle
{
private:
	//vertices of a Triangle
	Point* vertex_1;
	Point* vertex_2;
	Point* vertex_3;

public:
	//getters
	Point* getVertex_1();
	Point* getVertex_2();
	Point* getVertex_3();

	//constructors
	Triangle(Point v1, Point v2, Point v3);
	Triangle();

	//destructor 
	~Triangle();

	//methods
	void setPoints(Point p1, Point p2, Point p3);
	int translate(int d, char axis);
	double calcArea();
	void display();
	
};
