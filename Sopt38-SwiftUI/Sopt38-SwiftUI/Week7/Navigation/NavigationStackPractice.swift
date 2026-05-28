//
//  NavigationStackPractice.swift
//  SwiftUI_38
//
//  Created by 신서연 on 5/23/26.
//

import SwiftUI



struct NavigationStackPractice: View {
    let friends = Ganadi.friends
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            List(friends) { friend in
                NavigationLink(friend.name, value: friend)
            }
            .navigationDestination(for: Ganadi.self) { friend in
                DetailView(friend: friend)
            }
            .navigationTitle("듀..")
            
            NavigationLink {
                GanadiImageView()
            } label: {
                Text("이동하기 간단버전")
            }
            
            Button("이동하기 state 버전") {
                isPresented = true
            }
            .navigationDestination(isPresented: $isPresented) {
                GanadiImageView()
            }
        }
    }
}

struct DetailView: View {
    let friend: Ganadi
    var body: some View {
        Text(friend.detail)
            .navigationTitle(friend.name)
    }
}

struct GanadiImageView: View {
  var body: some View {
      Image(.ganadi)
          .resizable()
          .scaledToFit()
  }
}
