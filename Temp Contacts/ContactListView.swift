//
//  ContentView.swift
//  Temp Contacts
//
//  Created by Arthur Lee on 5/9/20.
//  Copyright © 2020 Skies Lab. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var userData: UserData
    
    @ViewBuilder
    var body: some View {
        if userData.contacts.count > 0 {
            List {
                ForEach(userData.contacts, id: \.id) { contact in
                    ContactRow(contact: contact)
                }
                .onDelete(perform: onDelete)
            }
        } else {
            EmptyContactsView()
        }
    }
    
    private func onDelete(offsets: IndexSet) {
        offsets.forEach { (i) in
            let contact = self.userData.contacts[i]
            let phoneNumber = contact.getNormalizedNumber()
            if (phoneNumber != nil) {
                self.userData.contactsToRemove.append(phoneNumber!)
            }
        }
        self.userData.contacts.remove(atOffsets: offsets)
    }
}

struct ContactListView: View {
    @EnvironmentObject var userData: UserData
    @Environment(\.presentationMode) var presentationMode // to fix modal dismiss bug
    @State private var editMode = EditMode.inactive
    @State private var isAddContactModalVisible = false
    
    var body: some View {
        MainView()
        .navigationBarTitle(Text("Temp Contacts"))
        .navigationBarItems(leading: Button(action: {
                self.isAddContactModalVisible.toggle()
            }) {
                Image(systemName: "plus").imageScale(.large)
            }, trailing: EditButton())
        .sheet(isPresented: $isAddContactModalVisible) {
            AddContactView(isModalVisible: self.$isAddContactModalVisible).environmentObject(self.userData)
            }
        .environment(\.editMode, $editMode)
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContactListView().environmentObject(UserData())
        }
    }
}
