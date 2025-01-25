import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var isFlashlightOn = false
    @State private var screenBrightness: Double = UIScreen.main.brightness
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(systemName: isFlashlightOn ? "flashlight.on.fill" : "flashlight.off.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(isFlashlightOn ? .yellow : .gray)
                    .onTapGesture {
                        toggleFlashlight()
                    }
                
                Text("手电筒")
                    .font(.title2)
                    .fontWeight(.medium)
                
                Divider()
                    .padding(.vertical)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("屏幕亮度")
                        .font(.title2)
                        .fontWeight(.medium)
                    
                    HStack {
                        Image(systemName: "sun.min")
                        Slider(value: $screenBrightness, in: 0...1) { _ in
                            UIScreen.main.brightness = screenBrightness
                        }
                        Image(systemName: "sun.max")
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Kitty Light")
        }
    }
    
    private func toggleFlashlight() {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        do {
            try device.lockForConfiguration()
            if device.hasTorch {
                if isFlashlightOn {
                    device.torchMode = .off
                } else {
                    try device.setTorchModeOn(level: 1.0)
                }
                isFlashlightOn.toggle()
            }
            device.unlockForConfiguration()
        } catch {
            print("Flashlight could not be used")
        }
    }
}

#Preview {
    ContentView()
}