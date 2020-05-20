//
//  AddContactView.swift
//  Temp Contacts
//
//  Created by Arthur Lee on 5/18/20.
//  Copyright © 2020 Skies Lab. All rights reserved.
//

import SwiftUI

struct AddContactView: View {
    @Binding var isModalVisible: Bool
    @EnvironmentObject var userData: UserData
    @State private var name = ""
    @State private var number = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Number", text: $number)
                    .keyboardType(.phonePad)
            }
            .navigationBarTitle(Text("Add contact"))
            .navigationBarItems(leading: Button(action: {
                self.isModalVisible.toggle()
            }, label: {
                Text("Cancel")
            }), trailing: Button(action: {
                let contact = Contact.init(name: self.name, number: self.number)
                self.userData.contacts.append(contact)
                self.userData.contactsToAdd.append(contact)
                self.isModalVisible.toggle()
            }, label: {
                Text("Done")
            }))
        }
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddContactView(isModalVisible: .constant(true)).environmentObject(UserData())
        }
    }
}
