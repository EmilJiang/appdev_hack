//
//  HomeBook.swift
//  litera
//
//  Created by Angelina Chen on 12/6/24.
//

import Foundation

struct HomeBook: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let imageName: String
    let rating: Double
    let genre: String
}

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}
