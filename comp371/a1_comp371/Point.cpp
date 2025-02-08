#include <iostream>
#include <cmath>

class Point {
private:
    int x, y, z;

public:
    Point(int x = 0, int y = 0, int z = 0) : x(x), y(y), z(z) {}

    int translate(int d, char axis) {
        if (!std::isdigit(d) && d < 0) {
            return -2;
        }

        switch (axis) {
            case 'x':
                x += d;
                break;
            case 'y':
                y += d;
                break;
            case 'z':
                z += d;
                break;
            default:
                return -1;
        }
        return 0;
    }

    void display() const {
        std::cout << "(" << x << ", " << y << ", " << z << ")";
    }

    int getX() const { return x; }
    int getY() const { return y; }
    int getZ() const { return z; }

    ~Point() {}
};
