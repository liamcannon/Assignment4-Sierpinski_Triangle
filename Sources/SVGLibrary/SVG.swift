//
//  SVG.swift
//  SierpinskiSwift
//
//  A class that can be used to generate
//  a basic SVG file.

import Foundation

open class SVG {
    // YOUR CODE HERE
    var contents: Data

    // Initialize the SVG file with commands that will create a
    // width x height canvas
    public init(width: UInt, height: UInt) {
        contents = Data.init()
    }
    
    // YOUR CODE HERE
    public func start_graphics(width: Int, height : Int) {
        self.contents.append(contentsOf: Array(String(format: "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n").utf8))
        self.contents.append(contentsOf: Array(String(format: "<svg version=\"1.1\" baseProfile=\"full\" width=\"%d\" height=\"%d\" xmlns=\"http://www.w3.org/2000/svg\">\n", width, height).utf8))
    }

    public func draw_ellipse(x: Int, y:Int, width: Int, height: Int, color: String) {
        self.contents.append(contentsOf: Array(String(format: "<svg version=\"1.1\" baseProfile=\"full\" width=\"%d\" height=\"%d\" xmlns=\"http://www.w3.org/2000/svg\">\n", width, height).utf8))
    }

    public func draw_rectangle(x: Int, y:Int, width: Int, height: Int, color: String) {
        self.contents.append(contentsOf: Array(String(format: "<rect x=\"%d\" y=\"%d\" width=\"%d\" height=\"%d\" fill=\"%@\" />\n", x, y, width, height, color).utf8))
    }

    public func draw_line(x1: Int, y1: Int, x2: Int, y2: Int, color: String) {
        self.contents.append(contentsOf: Array(String(format: "<line x1=\"%d\" y1=\"%d\" x2=\"%d\" y2=\"%d\" stroke=\"%@\" />\n", x1, y1, x2, y2, color).utf8))
    }
    public func end_graphic() {
        self.contents.append(contentsOf: Array(String(format: "</svg>\n").utf8))
    }
    public func draw_triangle(p1: Point, p2: Point, p3: Point) {
        draw_line(x1: p1.x, y1: p1.y, x2: p2.x, y2: p2.y, color: "black")
        draw_line(x1: p2.x, y1: p2.y, x2: p3.x, y2: p3.y, color: "black")
        draw_line(x1: p3.x, y1: p3.y, x2: p1.x, y2: p1.y, color: "black")
    }
    // Write the SVG file to disk
    public func write(filePath: String) {
        FileManager.default.createFile(atPath: filePath, contents: Data(contents))
    }
}
