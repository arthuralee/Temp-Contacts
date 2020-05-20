//
//  UserData.swift
//  Temp Contacts
//
//  Created by Arthur Lee on 5/18/20.
//  Copyright © 2020 Skies Lab. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    let dataStore = DataStore()
    
    private let contacts_key = "Contacts"
    private let contactsToAdd_key = "contactsToAdd"
    private let contactsToRemove_key = "contactsToRemove"

    @Published
    var contacts: [Contact] {
        didSet {
            dataStore.setKey(key: contacts_key, value: self.contacts)
        }
    }
    var contactsToAdd: [Contact] {
        didSet {
            dataStore.setKey(key: contactsToAdd_key, value: self.contactsToAdd)
        }
    }
    var contactsToRemove: [Int64] {
        didSet {
            dataStore.setKey(key: contactsToRemove_key, value: self.contactsToRemove)
        }
    }
    
    init() {
        self.contacts = dataStore.getKey(key: contacts_key, defaultValue: [])
        self.contactsToAdd = dataStore.getKey(key: contactsToAdd_key, defaultValue: [])
        self.contactsToRemove = dataStore.getKey(key: contactsToRemove_key, defaultValue: [])
    }
}
