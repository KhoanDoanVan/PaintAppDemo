//
//  ColorPickerView.swift
//  PaintAppDemo
//
//  Created by Đoàn Văn Khoan on 24/9/24.
//

import Foundation
import SwiftUI

struct ColorPickerView: View {
    let colors = [Color.red, Color.orange, Color.green, Color.blue, Color.purple]
    @Binding var selectedColor: Color
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Image(systemName: selectedColor == color ? Contants.Icons.recordCircleFill : Contants.Icons.circleFill)
                    .foregroundStyle(color)
                    .font(.system(size: 32))
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedColor = color
                    }
            }
        }
    }
}

#Preview {
    ColorPickerView(selectedColor: .constant(Color.blue))
}
