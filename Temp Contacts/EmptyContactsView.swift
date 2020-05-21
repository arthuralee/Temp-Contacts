//
//  EmptyContactsView.swift
//  Temp Contacts
//
//  Created by Arthur Lee on 5/20/20.
//  Copyright © 2020 Skies Lab. All rights reserved.
//

import SwiftUI

struct EmptyContactsView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "person.crop.circle.badge.plus")
                .foregroundColor(Color.gray)
                .padding(.bottom)
                .font(.system(size: 75))
            Text("Tap + to add a new contact")
                .fontWeight(.bold)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.all)
            Text("Add phone numbers to this app so you can identify them during incoming calls.")
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding([.top, .leading, .trailing])
        }
    }
}

struct EmptyContactsView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyContactsView()
    }
}
