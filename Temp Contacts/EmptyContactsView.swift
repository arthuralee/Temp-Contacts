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
        Text("No contacts")
    }
}

struct EmptyContactsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmptyContactsView()
        }
    }
}
