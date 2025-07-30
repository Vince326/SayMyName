//
//  QuoteView.swift
//  SayMyName
//
//  Created by Vincent Hunter on 6/2/25.
//

import SwiftUI

struct QuoteView: View {
    let vm = ViewModel()
    let show: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .frame(width: geometry.size.width * 2.7, height: geometry.size.height * 1.2)
                
                VStack {
                    //Character Quote design
                    Text("\"\(vm.quote.quote)\"")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .clipShape(.rect(cornerRadius: 25))
                        .padding(.horizontal)
                    
                    //Character Image VStack Design
                    ZStack(alignment: .bottom) {
                        AsyncImage(url: vm.character.images[0]) {image in
                            image
                                .resizable()
                                .scaledToFill()
                            
                        }
                    }
                } .frame(width:geometry.size.width)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    QuoteView(show:"Breaking Bad")
        .preferredColorScheme(.dark)
}
