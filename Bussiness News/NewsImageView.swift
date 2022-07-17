//
//  NewsImageView.swift
//  Bussiness News
//
//  Created by Daichi Morihara on 2022/07/17.
//

import SwiftUI

struct NewsImageView: View {
    @ObservedObject var vm: NewsImageViewModel
    let article: Article
    
    init(article: Article) {
        self.article = article
        self.vm = NewsImageViewModel(article: article)
    }
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 70, height: 70)
        .clipped()
        .task {
            await vm.getImage()
        }
    }
}

struct NewsImageView_Previews: PreviewProvider {
    static var previews: some View {
        NewsImageView(article: Article(title: "Elon VS Twitter. Why he wants to walk away.", url: "", urlToImage: "https://cdn.cnn.com/cnnnext/dam/assets/220716073629-05-biden-saudi-arabia-0716-super-tease.jpg"))
    }
}
