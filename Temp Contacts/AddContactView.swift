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
    @State private var showAlert = false;
    
    private func isDirty() -> Bool {
        return self.name != "" || self.number != ""
    }
    
    private func warnAndDismiss() {
        if self.isDirty() {
            self.showAlert = true
        } else {
            self.isModalVisible.toggle()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Attach a short name to a phone number, which will be used as Caller ID")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                Form {
                    Section(footer: Text("Contacts are saved on your device and are only used to identify incoming calls")) {
                        PhoneNumberTextFieldView(phoneNumber: $number)
                            .keyboardType(.phonePad)
                        TextField("Name", text: $name)
                    }
                }
            }
            .navigationBarTitle(Text("Add contact"))
            .navigationBarItems(leading: Button(action: {
                self.warnAndDismiss()
            }, label: {
                Text("Cancel")
            }), trailing: Button(action: {
                let contact = Contact.init(name: self.name, number: self.number)
                
                self.userData.contacts.append(contact)
                self.userData.contacts = self.userData.contacts // fix swift 5.2 bug
                
                self.userData.contactsToAdd.append(contact)
                self.isModalVisible.toggle()
            }, label: {
                Text("Done")
            }))
            .alert(
                isPresented: $showAlert,
                content: { Alert(title: Text("Hello world")) }
            )
        }
        .presentation(shouldDismiss: { () -> Bool in
            return !self.isDirty()
        }, onDismissalAttempt: {
            self.warnAndDismiss()
        })
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView(isModalVisible: .constant(true)).environmentObject(UserData())
    }
}
