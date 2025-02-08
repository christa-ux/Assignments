int main() {
    Point *p1 = new Point(0, 0, 0);
    Point *p2 = new Point(1, 0, 0);
    Point *p3 = new Point(0, 1, 0);

    Triangle t(p1, p2, p3);

    int choice;
    int d;
    char axis;

    do {
        std::cout << "Menu:\n";
        std::cout << "1. Display triangle coordinates\n";
        std::cout << "2. Translate triangle\n";
        std::cout << "3. Calculate area of the triangle\n";
        std::cout << "4. Exit\n";
        std::cout << "Enter your choice: ";
        std::cin >> choice;

        switch (choice) {
            case 1:
                t.display();
                break;
            case 2:
                std::cout << "Enter distance: ";
                std::cin >> d;
                std::cout << "Enter axis (x, y, or z): ";
                std::cin >> axis;
                t.translate(d, axis);
                break;
            case 3:
                std::cout << "Area of the triangle: " << t.calcArea() << "\n";
                break;
            case 4:
                std::cout << "Exiting...\n";
                break;
            default:
                std::cout << "Invalid choice. Please try again.\n";
        }
    } while (choice != 4);

    return 0;
}
