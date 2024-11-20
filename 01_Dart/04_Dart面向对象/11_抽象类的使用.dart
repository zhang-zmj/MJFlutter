void main(List<String> args) {}

abstract class Shape {
  getArea();
}

class Circle extends Shape {
  double r;

  Circle(this.r);

  @override
  getArea() {
    return r * r * 3.14;
  }
}

class Reactangle extends Shape {
  double w;
  double h;

  Reactangle(this.w, this.h);

  @override
  getArea() {
    return w * h;
  }
}
