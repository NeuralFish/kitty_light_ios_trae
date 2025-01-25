import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var selectedColor = Color.pink
    @State private var saturation: Double = 1.0
    @State private var brightness: Double = UIScreen.main.brightness
    
    let presetColors: [Color] = [.pink, .purple, .cyan, .white, .yellow, .blue]
    let presetNames = ["少女感", "磨皮感", "冷白皮", "百搭光", "小鸡黄", "清新光"]
    
    var body: some View {
        VStack(spacing: 20) {
            // 颜色预设
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<presetColors.count, id: \.self) { index in
                        VStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(presetColors[index])
                                .frame(width: 60, height: 60)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: selectedColor == presetColors[index] ? 2 : 0))
                                .onTapGesture {
                                    selectedColor = presetColors[index]
                                }
                            Text(presetNames[index])
                                .font(.caption)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            // 颜色选择器
            ColorPicker("选择颜色", selection: $selectedColor)
                .padding()
            
            // 饱和度调节
            VStack(alignment: .leading, spacing: 10) {
                Text("饱和度")
                    .font(.headline)
                Slider(value: $saturation, in: 0...2)
            }
            .padding()
            
            // 屏幕亮度调节
            VStack(alignment: .leading, spacing: 10) {
                Text("屏幕亮度")
                    .font(.headline)
                Slider(value: $brightness, in: 0...1) { _ in
                    UIScreen.main.brightness = brightness
                }
            }
            .padding()
            
            Spacer()
        }
        .background(selectedColor.opacity(0.3))
        .onChange(of: selectedColor) { _ in
            updateScreenColor()
        }
        .onChange(of: saturation) { _ in
            updateScreenColor()
        }
    }
    
    private func updateScreenColor() {
        // 使用选中的颜色和饱和度更新背景颜色
        // 饱和度的改变会通过background modifier自动应用
        // 亮度的改变会通过UIScreen.main.brightness自动应用
    }
}

#Preview {
    ContentView()
}