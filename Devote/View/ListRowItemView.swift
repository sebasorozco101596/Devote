//
//  ListRowItemView.swift
//  Devote
//
//  Created by Juan Sebastian Orozco Buitrago on 2/14/22.
//

import SwiftUI

struct ListRowItemView: View {
    
    //MARK: - PROEPRTIES
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    
    //MARK: - BODY
    
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.pink : Color.primary)
                .padding(.vertical, 12)
                .animation(.default, value: item.completion)
        } //: TOGGLE
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange) { _ in
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        }
    }
}
