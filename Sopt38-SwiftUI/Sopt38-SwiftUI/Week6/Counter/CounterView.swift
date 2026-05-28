//
//  CounterView.swift
//  Sopt38-SwiftUI
//
//  Created by 신서연 on 5/16/26.
//

import SwiftUI

struct CounterView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("카운트: \(count)")
            CounterButton(count: $count)
        }
    }
}

struct CounterButton: View {
    @Binding var count: Int

    var body: some View {
        Button("올리기") {
            count += 1
        }
    }
}
