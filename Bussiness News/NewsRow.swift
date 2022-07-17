//
//  NewsRow.swift
//  Bussiness News
//
//  Created by Daichi Morihara on 2022/07/17.
//

import SwiftUI

struct NewsRow: View {
    let article: Article
    var body: some View {
        HStack(alignment: .top) {
            Text(article.title ?? "")
                .font(.body)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
                .frame(width: UIScreen.main.bounds.width / 4 * 3, alignment: .leading)
            
            Spacer()
            NewsImageView(article: article)
                .cornerRadius(10)
                
//            Image("biden")
//                .resizable()
//                .scaledToFill()
//                .frame(width: 70, height: 70)
//                .clipped()
//                .cornerRadius(10)
                
        }
        .padding(.trailing)
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(article: Article(title: "Elon Musk reportedly wanted to entrust his fortune to a 34-year-old former pro gambler who dropped out of college to smoke weed - Yahoo Finance", url: "", urlToImage: "https://cdn.cnn.com/cnnnext/dam/assets/220716073629-05-biden-saudi-arabia-0716-super-tease.jpg"))
    }
}
