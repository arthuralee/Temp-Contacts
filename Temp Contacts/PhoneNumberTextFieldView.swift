//
//  PhoneNumberTextFieldView.swift
//  Temp Contacts
//
//  Created by Arthur Lee on 5/20/20.
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
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),
            for: .editingChanged)
        }
        
        @objc func textFieldDidChange(_ textField: UITextField) {
            self.text.wrappedValue = textField.text ?? ""
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            self.textFieldDidChange(textField)
        }
    }
}
