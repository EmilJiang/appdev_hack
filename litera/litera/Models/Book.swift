//
//  Book.swift
//  litera
//
//  Created by Angelina Chen on 12/6/24.
//

import SwiftUI

struct Book: Codable {
    let id: UUID
    let author: String
    let summary: String
    let title: String
}
