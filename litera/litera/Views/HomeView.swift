//
//  HomeView.swift
//  litera
//
//  Created by Angelina Chen on 12/6/24.
//

import SwiftUI

struct HomeView: View {
    //let genres = ["Fiction", "Non-fiction", "Mystery", "Fantasy", "Romance"]
    let genres = [
           ("Fiction", "fiction"),
           ("Non-fiction", "nonfiction"),
           ("Mystery", "mystery"),
           ("Fantasy", "fantasy"),
           ("Romance", "romance")
       ]
    let books = [
        HomeBook(title: "The Handmaid's Tale", author: "Margaret Atwood", imageName: "book1", rating: 4.5, genre: "Fiction"),
        HomeBook(title: "The Great Gatsby", author: "F. Scott Fitzgerald",  imageName: "book2", rating: 4.0, genre: "Fiction"),
        HomeBook(title: "Dune", author: "Frank Herbert", imageName: "book3", rating: 5.0,genre: "Fiction"),
        HomeBook(title: "The Da Vinci Code ", author: "Dan Brown", imageName: "book4", rating: 3.5, genre: "Fiction")
    ]
    
    @State private var selectedGenre: String? = nil
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                
                
                Text("Explore Books")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.top, 20)
                    .padding(.horizontal)
                
                
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 15) {
//                        ForEach(genres, id: \.self) { genre in
//                            Button(action: {
//                                selectedGenre = genre
                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 15) {
                                        ForEach(genres, id: \.0) { genre, imageName in
                                            Button(action: {
                                                selectedGenre = genre
                                
                            }) {
                                VStack {
                                    //Image("Fiction")
                                    Image(imageName )
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .foregroundColor(.red)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                                    Text(genre)
                                        .font(.footnote)
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(.leading,10)
                        }
                    }
                }
            }
            
            
            
            HStack {
                Text("Featured Books")
                    .font(.system(size: 20, weight: .bold))
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("Show All")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                }
            }
            //            .padding(.top, 100)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(books) { book in
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
                        
                        
                        HStack {
                            ForEach(0..<5) { index in
                                if index < Int(book.rating) {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                                                    } else if index < Int(book.rating.rounded(.down)) + 1 && book.rating - floor(book.rating) >= 0.5 {
                                                                        Image(systemName: "star.leadinghalf.fill")
                                                                            .foregroundColor(.yellow)
                                                                    } else {
                                                                        Image(systemName: "star")
                                                                            .foregroundColor(.yellow)
                                                                    }
                                }
                                Button(action: {
                                    
                                }) {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.top, 5)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
                
            }
        }
        //                                    .navigationTitle("home")
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
    
    
    
    
    
    
    
    


