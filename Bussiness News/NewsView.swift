//
//  NewsView.swift
//  Bussiness News
//
//  Created by Daichi Morihara on 2022/07/17.
//

import SwiftUI

struct NewsView: View {
    @StateObject var vm = NewsViewModel()
    @State private var showWeb = false
    @State private var urlString: String = ""
    
    var body: some View {
        VStack {
            NavigationLink(isActive: $showWeb,
                           destination: { WebUIView(urlString: $urlString) },
                           label: { EmptyView() })
            Text("Trending News")
            List {
                ForEach(vm.articles) { article in
                    NewsRow(article: article)
                        .listRowInsets(.init(top: 5, leading: 5, bottom: 10, trailing: 0))
                        .onTapGesture {
                            urlString = article.url ?? ""
                            showWeb.toggle()
                        }
                }
            }
            
            .listStyle(PlainListStyle())
        }
        .navigationBarHidden(true)
        .task {
            await vm.downloadNews()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
