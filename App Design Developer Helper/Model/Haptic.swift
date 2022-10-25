//
//  Haptic.swift
//  App Design Developer Helper
//
//  Created by Vitali Vyucheiski on 10/23/22.
//

import Foundation

struct Haptic: Hashable {
    let title: String
    let type: String
    let icon: String
    let reference: String
    let code: String
}

let theHaptics = [Haptic(title: "Success Haptic", type: "Notification", icon: "checkmark.circle.fill", reference: "Notification haptics provide feedback about the outcome of a task or action, such as depositing a check or unlocking a vehicle.\n\nSuccess Haptic indicates that a task or action has completed.", code: "let generator = UINotificationFeedbackGenerator()\ngenerator.notificationOccurred(.success)"),
                  Haptic(title: "Warning Haptic", type: "Notification", icon: "questionmark.diamond.fill", reference: "Notification haptics provide feedback about the outcome of a task or action, such as depositing a check or unlocking a vehicle.\n\nWarning Haptic indicates that a task or action has produced a warning of some kind.", code: "let generator = UINotificationFeedbackGenerator()\ngenerator.notificationOccurred(.warning)"),
                  Haptic(title: "Error Haptic", type: "Notification", icon: "exclamationmark.octagon.fill", reference: "Notification haptics provide feedback about the outcome of a task or action, such as depositing a check or unlocking a vehicle.\n\nError Haptic indicates that a task or action has failed.", code: "let generator = UINotificationFeedbackGenerator()\ngenerator.notificationOccurred(.error)"),
                  Haptic(title: "Light Haptic", type: "Impact", icon: "circle", reference: "Impact haptics provide a physical metaphor you can use to complement a visual experience. For example, people might feel a tap when a view snaps into place or a thud when two heavy objects collide.\n\nLight Haptic indicates a collision between small or lightweight UI objects.", code: "let generator = UIImpactFeedbackGenerator(style: .light)\ngenerator.impactOccurred()"),
                  Haptic(title: "Medium Haptic", type: "Impact", icon: "circle.circle", reference: "Impact haptics provide a physical metaphor you can use to complement a visual experience. For example, people might feel a tap when a view snaps into place or a thud when two heavy objects collide.\n\nMedium Haptic indicates a collision between medium-sized or medium-weight UI objects.", code: "let generator = UIImpactFeedbackGenerator(style: .medium)\ngenerator.impactOccurred()"),
                  Haptic(title: "Heavy Haptic", type: "Impact", icon: "circle.circle.fill", reference: "Impact haptics provide a physical metaphor you can use to complement a visual experience. For example, people might feel a tap when a view snaps into place or a thud when two heavy objects collide.\n\nHeavy Haptic indicates a collision between large or heavyweight UI objects.", code: "let generator = UIImpactFeedbackGenerator(style: .heavy)\ngenerator.impactOccurred()"),
                  Haptic(title: "Rigid Haptic", type: "Impact", icon: "record.circle", reference: "Impact haptics provide a physical metaphor you can use to complement a visual experience. For example, people might feel a tap when a view snaps into place or a thud when two heavy objects collide.\n\nRigid Haptic indicates a collision between hard or inflexible Ul objects.", code: "let generator = UIImpactFeedbackGenerator(style: .rigid)\ngenerator.impactOccurred()"),
                  Haptic(title: "Soft Haptic", type: "Impact", icon: "circle.dashed", reference: "Impact haptics provide a physical metaphor you can use to complement a visual experience. For example, people might feel a tap when a view snaps into place or a thud when two heavy objects collide.\n\nSoft Haptic indicates a collision between soft or flexible UI objects.", code: "let generator = UIImpactFeedbackGenerator(style: .soft)\ngenerator.impactOccurred()"),
                  Haptic(title: "Selection Haptic", type: "Default", icon: "hand.tap", reference: "Selection haptics provide feedback while the values of a Ul element are changing.", code: "let generator = UISelectionFeedbackGenerator()\ngenerator.selectionChanged()")]



