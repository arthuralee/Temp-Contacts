//
//  AddContactView.swift
//  Temp Contacts
//
//  Created by Arthur Lee on 5/18/20.
//  Copyright © 2020 Skies Lab. All rights reserved.
//

import SwiftUI
import PhoneNumberKit

struct PhoneNumberTextFieldView: UIViewRepresentable {
    
    @Binding var phoneNumber: String
    
    func makeUIView(context: Context) -> PhoneNumberTextField {
        let textField = PhoneNumberTextField()
        
        textField.delegate = context.coordinator
        textField.withExamplePlaceholder = true
        textField.withPrefix = true
        textField.placeholder = "Phone number"
        textField.becomeFirstResponder()
        
        return textField
    }

    func updateUIView(_ view: PhoneNumberTextField, context: Context) {
        view.text = phoneNumber
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator($phoneNumber)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var text: Binding<String>

        init(_ text: Binding<String>) {
            self.text = text
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            self.text.wrappedValue = textField.text ?? ""
        }
    }
}

struct AddContactView: View {
    @Binding var isModalVisible: Bool
    @EnvironmentObject var userData: UserData
    @State private var name = ""
    @State private var number = ""
    
    var body: some View {
        NavigationView {
            Form {
                PhoneNumberTextFieldView(phoneNumber: $number)
                    .keyboardType(.phonePad)
                TextField("Name", text: $name)
            }
            .navigationBarTitle(Text("Add contact"))
            .navigationBarItems(leading: Button(action: {
                self.isModalVisible.toggle()
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
