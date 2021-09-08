//
//  BookView.swift
//  Library App
//
//  Created by Colton Shoenberger on 9/8/21.
//

import SwiftUI

struct BookView: View {
    
    let ratings = [1, 2, 3, 4, 5]
    var book:Book
    @EnvironmentObject var model:BookModel
    @State var selectedRating = 3
    
    var body: some View {
 
        VStack (alignment: .leading) {
            
            Text("\(book.title)")
                .font(.largeTitle)
                .bold()
                .padding(.leading)
            
            VStack (alignment: .center, spacing: 10){
                
                Text("Read Now!")
                    .font(.title)
                
                Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                Text("Mark for later!")
                    .bold()
                
                Image(systemName: "star")
                    .foregroundColor(.yellow)
                    .padding(.bottom)
                
                Text("Rate \(book.title)")
                    .bold()
                
                Picker("", selection: $selectedRating, content: {
                    ForEach (ratings, id: \.self) { rating in
                        Text("\(rating)").tag(rating)
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 280)
                
                
            }
            .padding()
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = BookModel()
        
        BookView(book: model.books[1])
    }
}
