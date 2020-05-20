//
//  Contact.swift
//  Temp Contacts
//
//  Created by Arthur Lee on 5/9/20.
//  Copyright © 2020 Skies Lab. All rights reserved.
//

import SwiftUI

struct Contact: Identifiable, Codable, Hashable {
    var id: UUID
    var name: String
    var number: String
    
    init(name: String, number: String) {
        self.id = UUID()
        self.name = name;
        self.number = number;
    }
}
