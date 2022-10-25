//
//  HapticsView.swift
//  App Design Developer Helper
//
//  Created by Vitali Vyucheiski on 10/23/22.
//

import SwiftUI

struct HapticsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                ForEach(theHaptics, id: \.self) { haptic in
                    HapticItem(hapticItem: haptic)
                }
            }
        }
        .padding(.top, 20)
        .navigationTitle("Haptics")
    }
}

struct HapticsView_Previews: PreviewProvider {
    static var previews: some View {
        HapticsView()
    }
}
