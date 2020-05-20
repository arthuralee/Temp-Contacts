//
//  UserDefaultsValue.swift
//  Temp Contacts
//
//  Created by Arthur Lee on 5/18/20.
//  Copyright © 2020 Skies Lab. All rights reserved.
//

import Foundation

class DataStore {
    private var sharedDefaults: UserDefaults = UserDefaults.init(suiteName: "group.io.skieslab.Temp-Contacts")!
    
    func getKey<T: Decodable>(key: String, defaultValue: T) -> T {
        let data = sharedDefaults.data(forKey: key)
        let value = data.flatMap { try? JSONDecoder().decode(T.self, from: $0) }
        return value ?? defaultValue
    }
    
    func setKey<T: Encodable>(key: String, value: T) {
        let data = try? JSONEncoder().encode(value)
        sharedDefaults.set(data, forKey: key)
    }
}
