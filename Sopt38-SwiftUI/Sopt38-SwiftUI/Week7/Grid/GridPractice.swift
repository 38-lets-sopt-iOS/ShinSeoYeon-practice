//
//  ContentView.swift
//  SwiftUI_38
//
//  Created by 신서연 on 5/23/26.
//

import SwiftUI

struct GridPractice: View {
    var body: some View {
        Grid {
            GridRow {
                Text("Row 1")
                ForEach(0..<2) { _ in
                    Color.red
                        .frame(width: 50, height: 50)
                }
            }
            GridRow {
                Text("Row 2")
                ForEach(0..<5) { _ in
                    Color.green
                        .frame(width: 50, height: 50)
                }
            }
            GridRow {
                Text("Row 3")
                ForEach(0..<4) { _ in
                    Color.blue
                        .frame(width: 50, height: 50)
                }
            }
        }
    }
}
