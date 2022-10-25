//
//  HapticDetailView.swift
//  App Design Developer Helper
//
//  Created by Vitali Vyucheiski on 10/23/22.
//

import UIKit
import SwiftUI

struct HapticDetailView: View {
    //@Binding var isPresented: Bool
    @State private var isSharePresented = false
    let hapticItem: Haptic
    
    let softImpactHaptic = UIImpactFeedbackGenerator(style: .soft)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 40) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Reference")
                            .font(.title2).bold()
                        
                        Text(hapticItem.reference)
                            .foregroundColor(.secondary)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Swift Code")
                            .font(.title2).bold()
                        
                        Text(getAttributedString(string: hapticItem.code))
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(10)
                    }
                    
                    HStack {
                        Button {
                            softImpactHaptic.impactOccurred()
                            UIPasteboard.general.setValue(hapticItem.code, forPasteboardType: "public.plain-text")
                        } label: {
                            Text("Copy")
                                .font(.title2)
                                .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                                .background(.ultraThinMaterial)
                                .cornerRadius(10)
                        }
                        
                        Button {
                            softImpactHaptic.impactOccurred()
                            isSharePresented.toggle()
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                                .font(.title2)
                                .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                                .background(.ultraThinMaterial)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.top, -20)
                }
                .padding(.vertical, 50)
                .padding(.horizontal)
                .navigationTitle(hapticItem.title)
                .toolbar {
                    Button("Done") {
                        //isPresented.toggle()
                    }
                }
                .sheet(isPresented: $isSharePresented) {
                    ActivityViewController(activityItems: [hapticItem.code])
                        .presentationDetents([.medium, .large])
                }
            }
        }
    }
    
    func getAttributedString(string: String) -> AttributedString {
        let pinkish = UIColor(red: 0.932, green: 0.474, blue: 0.699, alpha: 1.000)
        let pinkish2 = UIColor(red: 1.000, green: 0.563, blue: 0.854, alpha: 1.000)
        let blueish = UIColor(red: 0.267, green: 0.580, blue: 0.677, alpha: 1.000)
        let greenish = UIColor(red: 0.471, green: 0.760, blue: 0.702, alpha: 1.000)
        let purple = UIColor(red: 0.698, green: 0.509, blue: 0.923, alpha: 1.000)
        var attributedString = AttributedString(string)
        
        //Apply color to LET
        if let range = attributedString.range(of: "let") {
            attributedString[range].foregroundColor = pinkish
        }
        //Apply color to GENERATOR
        if let range = attributedString.range(of: "generator") {
            attributedString[range].foregroundColor = blueish
        }
        if let range = attributedString.range(of: "\ngenerator") {
            attributedString[range].foregroundColor = greenish
        }
        //Apply color to UINotificationFeedbackGenerator()
        if let range = attributedString.range(of: "UINotificationFeedbackGenerator()") {
            attributedString[range].foregroundColor = pinkish2
        }
        //Apply color to notificationOccurred
        if let range = attributedString.range(of: "notificationOccurred") {
            attributedString[range].foregroundColor = purple
        }
        //Apply color to success
        if let range = attributedString.range(of: "success") {
            attributedString[range].foregroundColor = purple
        }
        //Apply color to warning
        if let range = attributedString.range(of: "warning") {
            attributedString[range].foregroundColor = purple
        }
        //Apply color to error
        if let range = attributedString.range(of: "error") {
            attributedString[range].foregroundColor = purple
        }
        
        //Apply color to UIImpactFeedbackGenerator
        if let range = attributedString.range(of: "UIImpactFeedbackGenerator") {
            attributedString[range].foregroundColor = pinkish2
        }
        //Apply color to style
        if let range = attributedString.range(of: "style") {
            attributedString[range].foregroundColor = purple
        }
        //Apply color to light
        if let range = attributedString.range(of: "light") {
            attributedString[range].foregroundColor = purple
        }
        //Apply color to medium
        if let range = attributedString.range(of: "medium") {
            attributedString[range].foregroundColor = purple
        }
        //Apply color to heavy
        if let range = attributedString.range(of: "heavy") {
            attributedString[range].foregroundColor = purple
        }
        //Apply color to rigid
        if let range = attributedString.range(of: "rigid") {
            attributedString[range].foregroundColor = purple
        }
        //Apply color to soft
        if let range = attributedString.range(of: "soft") {
            attributedString[range].foregroundColor = purple
        }
        //Apply color to impactOccurred()
        if let range = attributedString.range(of: "impactOccurred()") {
            attributedString[range].foregroundColor = purple
        }
        
        //Apply color to UISelectionFeedbackGenerator()
        if let range = attributedString.range(of: "UISelectionFeedbackGenerator()") {
            attributedString[range].foregroundColor = pinkish2
        }
        //Apply color to selectionChanged()
        if let range = attributedString.range(of: "selectionChanged()") {
            attributedString[range].foregroundColor = purple
        }
        
        return attributedString
    }
}

struct HapticDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HapticDetailView(hapticItem: theHaptics[8])
    }
}
