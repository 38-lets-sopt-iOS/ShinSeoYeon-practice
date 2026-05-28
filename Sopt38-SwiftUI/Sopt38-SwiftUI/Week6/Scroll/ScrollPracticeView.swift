//
//  ScrollPracticeView.swift
//  Sopt38-SwiftUI
//
//  Created by 신서연 on 5/16/26.
//

import SwiftUI

struct ScrollPracticeView: View {
    var body: some View {
        ScrollView() {
            VStack {
                ForEach(1..<100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }

            .frame(maxWidth: .infinity)
        }
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(1..<100) {
                    Text("숫자 \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
        
    }
}
