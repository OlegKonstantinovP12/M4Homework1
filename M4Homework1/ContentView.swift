//
//  ContentView.swift
//  M4Homework1
//
//  Created by Oleg Konstantinov on 05.02.2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @State var position = ScrollPosition()
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.horizontal) {
                header
                    .background(.white)
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .zIndex(1)
            }
            .scrollIndicators(.hidden)
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(viewModel.articles) { article in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                AsyncImage(url: URL(string: article.image ?? ""))
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                                Text(article.title ?? "")
                                    .font(.system(size: 16, weight: .bold))
                                    .lineLimit(3)
                            }
                            Text(article.description ?? "")
                            Text(article.publishedAt ?? "")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundStyle(.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(15)
                        .background(.antiFlashWhite)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding(.horizontal, 20)
                
            }
            .scrollPosition($position)
            .padding(.top, 40)
            .onAppear {
                viewModel.getNews(title: NewsCategory.general.rawValue)
            }
        }
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    var header: some View {
            HStack {
                ForEach(NewsCategory.allCases, id: \.self) { item in
                    Button {
                        viewModel.getNews(title: item.rawValue)
                        withAnimation {
                            position.scrollTo(edge: .top)                            
                        }
                    } label: {
                        Text(item.showTitle(news: item))
                            .frame(maxWidth: .infinity)
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.black)
                            .padding(.vertical, 2)
                            .padding(.horizontal, 6)
                            .background(.antiFlashWhite)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 1)
        }
}
