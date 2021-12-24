//
//  State.swift
//  Assignment-13
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//
import Foundation

class State: Decodable {
    var state_id: Int
    var state_name: String
}
class States: Decodable {
    var states: [State]
}
