//
//  ContactRow.swift
//  Temp Contacts
//
//  Created by Arthur Lee on 5/9/20.
//  Copyright © 2020 Skies Lab. All rights reserved.
//

import SwiftUI

struct ContactRow: View {
    var contact: Contact
    var isEditing: Bool = false
    
    var body: some View {
        return HStack {
            Text(contact.name)
            Text(contact.number)
                .foregroundColor(Color.gray)
        }
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContactRow(contact: Contact.init(name: "Foo", number: "2242791680"))
        }
    }
}
