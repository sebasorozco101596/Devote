//
//  CheckboxStyle.swift
//  Devote
//
//  Created by Juan Sebastian Orozco Buitrago on 2/14/22.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundColor(configuration.isOn ? .pink : .primary)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
        } //: HSTACK
    }
}

struct CheckboxStyle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle("Placeholder label", isOn: .constant(true))
            .toggleStyle(CheckboxStyle())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
