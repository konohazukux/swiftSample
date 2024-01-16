//
//  ContentView.swift
//  ShakeSample
//

import SwiftUI

struct KeyframeAnimationValues {
    var offsetX = 0.0
}

struct ContentView: View {
    @State private var text = ""
    @State private var shakeAnimationTrigger = false

    var body: some View {
        VStack {
            TextField("文字を入力してください", text: $text)
                .textFieldStyle(.roundedBorder)
                .keyframeAnimator(
                    initialValue: KeyframeAnimationValues(),
                    trigger: shakeAnimationTrigger
                ) { content, value in
                    content.offset(x: value.offsetX)
                } keyframes: { _ in
                    KeyframeTrack(\.offsetX) {
                        CubicKeyframe(5, duration: 0.2)
                        CubicKeyframe(-5, duration: 0.1)
                        CubicKeyframe(5, duration: 0.1)
                        CubicKeyframe(-5, duration: 0.1)
                        CubicKeyframe(5, duration: 0.1)
                        CubicKeyframe(0, duration: 0.2)
                    }
                }
                .onSubmit {
                    shakeAnimationTrigger.toggle()
                }
        }
        .padding(20)
    }
}

#Preview {
    ContentView()
}
