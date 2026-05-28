//
//  LazyVGridExampleView.swift
//  SwiftUI_38
//
//  Created by 신서연 on 5/23/26.
//

import SwiftUI

struct LazyVGridExampleView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(1...20, id: \.self) { value in
                    ZStack {
                        Rectangle()
                            .frame(width: 100, height: 100)
                            .foregroundStyle(Color.blue)
                        
                        VStack {
                            Rectangle()
                                .frame(width: 50, height: 50)
                                .foregroundStyle(Color.mint)
                            Text("아이템 \(value)")
                                .font(.caption)
                        }
                    }
                }
            }
        }
    }
    
    
}
