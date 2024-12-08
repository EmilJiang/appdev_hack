//
//  SearchView.swift
//  litera
//
//  Created by Angelina Chen on 12/6/24.
//
//
//import SwiftUI
//
//struct SearchView: View {
//    var body: some View {
//        NavigationStack {
//            Text("Search Screen")
//                .navigationTitle("Search")
//        }
//    }
//}


import SwiftUI

struct SearchView: View {
    // Sample data for books (with genres and images)
    @State private var books = [
        HomeBook(title: "The Handmaid's Tale", author: "Margaret Atwood", imageName: "book1", rating: 4.5, genre: "Fiction"),
        HomeBook(title: "The Great Gatsby", author: "F. Scott Fitzgerald",  imageName: "book2", rating: 4.0, genre: "Fiction"),
        HomeBook(title: "Dune", author: "Frank Herbert", imageName: "book3", rating: 5.0 ,genre: "Fiction"),
        HomeBook(title: "The Da Vinci Code ", author: "Dan Brown", imageName: "book4", rating: 3.5, genre: "Fiction")
    ]

    
    // Search query and selected genre
    @State private var searchQuery = ""
    @State private var selectedGenre: String? = nil
    
    // Sample genres
    let genres = [
        Category(name: "Fiction", imageName: "fictionImage"),
        Category(name: "Sci-Fi", imageName: "sciFiImage"),
        Category(name: "Mystery", imageName: "mysteryImage"),
        Category(name: "Romance", imageName: "romanceImage")
    ]
    
    // Filtered books based on genre and search query
    var filteredBooks: [HomeBook] {
        if let genre = selectedGenre {
            return books.filter { $0.genre == genre && $0.title.lowercased().contains(searchQuery.lowercased()) }
        } else {
            return books.filter { $0.title.lowercased().contains(searchQuery.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // Title
                Text("Discover Genres")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.top, 20)
                    .padding(.horizontal)
                
                // Search Bar
                TextField("Search for books...", text: $searchQuery)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                // Genre Scrollable List
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(genres) { category in
                            Button(action: {
                                // Toggle selected genre or reset it
                                if selectedGenre == category.name {
                                    selectedGenre = nil
                                } else {
                                    selectedGenre = category.name
                                }
                            }) {
                                VStack {
                                    Image(category.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150, height: 100)
                                        .cornerRadius(12)
                                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                                    
                                    Text(category.name)
                                        .font(.footnote)
                                        .foregroundColor(.black)
                                }
                            }
                            .frame(width: 150, height: 150)
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Books List Based on Filtered Books
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(filteredBooks) { book in
                        VStack {
                            Image(book.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 200)
                                .cornerRadius(10)
                                .clipped()
                            
                            Text(book.title)
                                .font(.headline)
                                .lineLimit(1)
                            
                            Text(book.author)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("Discover Genres")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}






