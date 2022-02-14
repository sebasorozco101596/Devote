//
//  BlankView.swift
//  Devote
//
//  Created by Juan Sebastian Orozco Buitrago on 2/13/22.
//

import SwiftUI

struct BlankView: View {
    
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    
    var body: some View {
        VStack {
            Spacer()
        } //: VSTACK
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(.black)
        .opacity(0.5)
        .edgesIgnoringSafeArea(.all)
    }
}

//MARK: - PREVIEW

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView()
    }
}
