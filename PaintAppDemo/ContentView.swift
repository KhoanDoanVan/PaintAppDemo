//
//  ContentView.swift
//  PaintAppDemo
//
//  Created by Đoàn Văn Khoan on 24/9/24.
//

import SwiftUI

struct Line {
    var points: [CGPoint] = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 3.0
}

struct ContentView: View {
    
    @State private var currentLine = Line()
    @State private var lines: [Line] = []
    @State private var selectedColor: Color = .red
    @State private var thinkness: Double = 0.0
    
    var body: some View {
        VStack {
            Canvas { context, size in
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
            }
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged({ value in
                        let newPoint = value.location
                        currentLine.points.append(newPoint)
                        self.lines.append(currentLine)
                    })
                    .onEnded({ value in
                        self.currentLine = Line(points: [], color: selectedColor, lineWidth: thinkness)
                    })
            )
            
            VStack {
                Slider(value: $thinkness, in: 1...20) {
                    
                }
                .onChange(of: thinkness) { oldValue, newValue in
                    self.currentLine.lineWidth = newValue
                }
                .frame(width: 200)
                .tint(.black)
                
                ColorPickerView(selectedColor: $selectedColor)
                    .onChange(of: selectedColor) { oldValue, newValue in
                        self.currentLine.color = newValue
                    }
            }
            .padding(.bottom)
        }
        .frame(width: 350, height: 700)
        .background(.gray.opacity(0.2))
        .clipShape(
            .rect(cornerRadius: 20)
        )
    }
}

#Preview {
    ContentView()
}
