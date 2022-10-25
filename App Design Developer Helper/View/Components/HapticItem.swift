//
//  HapticItem.swift
//  App Design Developer Helper
//
//  Created by Vitali Vyucheiski on 10/23/22.
//

import SwiftUI

struct HapticItem: View {
    let hapticItem: Haptic
    @State var isDetailViewPresented = false
    @State private var isSharePresented = false
    @State private var tapped = false
    
    let softImpactHaptic = UIImpactFeedbackGenerator(style: .soft)
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: hapticItem.icon)
                .imageModifier(presentedImageType: hapticItem.type, presentedImageTitle: hapticItem.title)
                .frame(width: 30)
            
            VStack(alignment: .leading) {
                Text(hapticItem.type)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(hapticItem.title)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Image(systemName: "arrow.up.forward.app")
                .font(.title)
                .foregroundColor(.secondary)
                .onTapGesture {
                    softImpactHaptic.impactOccurred()
                    isDetailViewPresented.toggle()
                }
        }
        .hapticItem(presentedImageType: hapticItem.type, presentedImageTitle: hapticItem.title)
        .padding(.horizontal)
        .scaleEffect(tapped ? 1.2 : 1.0)
        .pressEvents {
            // On press
            withAnimation(.spring(response: 0.8, dampingFraction: 0.8)) {
                tapped = true
            }
        } onRelease: {
            withAnimation {
                tapped = false
            }
        }
        .contextMenu {
            Button {
                softImpactHaptic.impactOccurred()
                isDetailViewPresented.toggle()
            } label: {
                Label("Detail", systemImage: "info.circle")
            }
            
            Divider()
            
            Button {
                softImpactHaptic.impactOccurred()
                UIPasteboard.general.setValue(hapticItem.code, forPasteboardType: "public.plain-text")
            } label: {
                Label("Copy Code", systemImage: "doc.on.doc")
            }
            
            Button {
                softImpactHaptic.impactOccurred()
                isSharePresented.toggle()
            } label: {
                Label("Share", systemImage: "square.and.arrow.up")
            }
        }
        .sheet(isPresented: $isDetailViewPresented) {
            HapticDetailView(/*isPresented: $isDetailViewPresented, */hapticItem: hapticItem)
        }
        .sheet(isPresented: $isSharePresented) {
            ActivityViewController(activityItems: [hapticItem.code])
                .presentationDetents([.medium, .large])
        }
    }
}

struct HapticItem_Previews: PreviewProvider {
    static var previews: some View {
        HapticItem(hapticItem: theHaptics[2])
    }
}

extension Image {
    func imageModifier(presentedImageType: String, presentedImageTitle: String) -> some View {
        switch presentedImageType {
        case "Default":
            return self
                .font(.title)
                .fontWeight(.regular)
                .foregroundColor(.secondary)
        case "Impact":
            switch presentedImageTitle {
            case "Light Haptic":
                return self
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            default:
                return self
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(.accentColor)
            }
        case "Notification":
            switch presentedImageTitle {
            case "Success Haptic":
                return self
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(.green)
            case "Warning Haptic":
                return self
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(.yellow)
            case "Error Haptic":
                return self
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(.red)
            default:
                return self
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
            }
        default:
            return self
                .font(.title)
                .fontWeight(.regular)
                .foregroundColor(.secondary)
        }
    }
}

extension HStack {
    func hapticItem(presentedImageType: String, presentedImageTitle: String) -> some View {
        let notificationHaptic = UINotificationFeedbackGenerator()
        
        let lightImpactHaptic = UIImpactFeedbackGenerator(style: .light)
        let mediumImpactHaptic = UIImpactFeedbackGenerator(style: .medium)
        let heavyImpactHaptic = UIImpactFeedbackGenerator(style: .heavy)
        let rigidImpactHaptic = UIImpactFeedbackGenerator(style: .rigid)
        let softImpactHaptic = UIImpactFeedbackGenerator(style: .soft)
        
        let selectionHaptic = UISelectionFeedbackGenerator()
        
        switch presentedImageType {
        case "Default":
            return self
                .padding(12)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                .onTapGesture {
                    selectionHaptic.selectionChanged()
                }
        case "Impact":
            switch presentedImageTitle {
            case "Light Haptic":
                return self
                    .padding(12)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .onTapGesture {
                        lightImpactHaptic.impactOccurred()
                    }
            case "Medium Haptic":
                return self
                    .padding(12)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .onTapGesture {
                        mediumImpactHaptic.impactOccurred()
                    }
            case "Heavy Haptic":
                return self
                    .padding(12)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .onTapGesture {
                        heavyImpactHaptic.impactOccurred()
                    }
            case "Rigid Haptic":
                return self
                    .padding(12)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .onTapGesture {
                        rigidImpactHaptic.impactOccurred()
                    }
            case "Soft Haptic":
                return self
                    .padding(12)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .onTapGesture {
                        softImpactHaptic.impactOccurred()
                    }
            default:
                return self
                    .padding(12)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .onTapGesture {
                        lightImpactHaptic.impactOccurred()
                    }
            }
        case "Notification":
            switch presentedImageTitle {
            case "Success Haptic":
                return self
                    .padding(12)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .onTapGesture {
                        notificationHaptic.notificationOccurred(.success)
                    }
            case "Warning Haptic":
                return self
                    .padding(12)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .onTapGesture {
                        notificationHaptic.notificationOccurred(.warning)
                    }
            case "Error Haptic":
                return self
                    .padding(12)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .onTapGesture {
                        notificationHaptic.notificationOccurred(.error)
                    }
            default:
                return self
                    .padding(12)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .onTapGesture {
                        notificationHaptic.notificationOccurred(.success)
                    }
            }
        default:
            return self
                .padding(12)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                .onTapGesture {
                    selectionHaptic.selectionChanged()
                }
        }
    }
}
