#include <stdio.h>
#include <math.h>

int main() {

    double a, b, c;
    double discriminant, root1, root2;

    printf("Input a, b, c (in format a b c): ");
    scanf("%lf %lf %lf", &a, &b, &c);

    discriminant = b * b - 4 * a * c;

    if (discriminant > 0) {
        root1 = (-b + sqrt(discriminant)) / (2 * a);
        root2 = (-b - sqrt(discriminant)) / (2 * a);
        printf("two real roots: %.2f and %.2f\n", root1, root2);
    }

    else if (discriminant == 0) {
        root1 = root2 = -b / (2 * a);
        printf("one real root: %.2f\n", root1);
    }

    else {
        double realPart = -b / (2 * a);
        double imaginaryPart = sqrt(-discriminant) / (2 * a);
        printf("two complex roots: %.2f + %.2fi and %.2f - %.2fi\n", realPart, imaginaryPart, realPart, imaginaryPart);
    }

    return 0;
}

