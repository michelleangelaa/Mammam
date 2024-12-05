//
//  ButtonStyles.swift
//  Mammam
//
//  Created by Evelyn Santoso on 05/12/24.
//

import SwiftUI

enum ButtonState {
    case enabled
    case disabled
//    case blocked
}

func foregroundColorButton(for state: ButtonState) -> Color {
    switch state {
    case .enabled, .disabled:
        return Color.theme.secondaryTextColor
    }
}

func backgroundColorButton(for state: ButtonState) -> Color {
    switch state {
    case .enabled:
        return Color.rose.rose600
    case .disabled:
        return Color.gray.gray300
    }
}
