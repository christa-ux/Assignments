 
#include <iostream>
using namespace std;
class Triangle {
   
private:
    Point *vertex_1, *vertex_2, *vertex_3;

public:
    Triangle(Point* p1 = nullptr, Point* p2 = nullptr, Point* p3 = nullptr)
        : vertex_1(p1), vertex_2(p2), vertex_3(p3) {}

    void translate(int d, char axis) {
        if (vertex_1) vertex_1->translate(d, axis);
        if (vertex_2) vertex_2->translate(d, axis);
        if (vertex_3) vertex_3->translate(d, axis);
    }

    double calcArea() {
        // Using Heron's formula for the area of a triangle in 3D
        double a = distance(vertex_1, vertex_2);
        double b = distance(vertex_2, vertex_3);
        double c = distance(vertex_3, vertex_1);
        double s = (a + b + c) / 2;
        return std::sqrt(s * (s - a) * (s - b) * (s - c));
    }

    void display() const {
        std::cout << "Triangle vertices:\n";
        std::cout << "Vertex 1: "; vertex_1->display(); std::cout << "\n";
        std::cout << "Vertex 2: "; vertex_2->display(); std::cout << "\n";
        std::cout << "Vertex 3: "; vertex_3->display(); std::cout << "\n";
    }

    ~Triangle() {
        delete vertex_1;
        delete vertex_2;
        delete vertex_3;
    }

private:
    double distance(Point* p1, Point* p2) {
        return std::sqrt(std::pow(p2->getX() - p1->getX(), 2) +
                         std::pow(p2->getY() - p1->getY(), 2) +
                         std::pow(p2->getZ() - p1->getZ(), 2));
    }
};
