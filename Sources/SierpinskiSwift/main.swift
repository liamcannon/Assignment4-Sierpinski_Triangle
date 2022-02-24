//
//  main.swift
//  SierpinskiSwift
//
//  Runs the main sierpinski algorithm.

import SVGLibrary

// YOUR CODE HERE
// Draw a triangle between the three points and then recursively draw
// three more triangles in each of the three corners of the first triangle.
func sierpinski(p1: Point, p2: Point, p3: Point, level: Int, figure: SVG) {
    if (level <= 0) {return }
    figure.draw_triangle(p1: p1, p2: p2, p3: p3)
    sierpinski(p1: p1, p2: midpoint(p1, p2), p3: midpoint(p1, p3), level: level - 1, figure: figure)
    sierpinski(p1: p2, p2: midpoint(p1, p2), p3: midpoint(p2, p3), level: level - 1, figure: figure)
    sierpinski(p1: p3, p2: midpoint(p1, p3), p3: midpoint(p2, p3), level: level - 1, figure: figure)
}


// Start the algorithm off using a 300x300 canvas and its largest triangle
// going across that canvas
func main() {
    let figure: SVG = SVG(width: 300, height: 300)
    let p1: Point = (0, 300)
    let p2: Point = (150, 0)
    let p3: Point = (300, 300)
    figure.start_graphics(width: 300, height: 300)
    sierpinski(p1: p1, p2: p2, p3: p3, level: 5, figure: figure)
    figure.end_graphic()
    figure.write(filePath: "sierpinski.svg")
}

main()
