//
//  NavigationPathPractice.swift
//  SwiftUI_38
//
//  Created by 신서연 on 5/23/26.
//

import SwiftUI

struct NavigationPathPractice: View {
    let ganadi = Ganadi.friends
    @State private var path = NavigationPath() // path 선언
    
    var body: some View {
            // path를 NavigationStack에 연결하는 법
        NavigationStack(path: $path) {
            List(ganadi, id: \.self) { friend in
                Button(friend.name) {
                    path.append(friend) // 버튼을 누르면 Ganadi 구조체가 path에 들어감
                }
            }
            .navigationTitle("\(path.count)번째 view") // 타이틀
            
            // path에 담긴 타입을 보고 그에 맞는 View로 이동
            .navigationDestination(for: Ganadi.self) { ganadi in
                EmojiView(ganadi: ganadi, path: $path) // path가 Ganadi라면 EmojiView로 이동
            }
            .navigationDestination(for: String.self) { info in
                InfoView(info: info, path: $path) // path가 String이라면 InfoView로 이동
            }
        }
    }
}

struct EmojiView: View {
    let ganadi: Ganadi
    @Binding var path: NavigationPath // path를 Binding으로 받음
    // path는 루트 뷰에서 선언되었기 때문에, 하위 뷰에서 수정하려면 @Binding으로 받아야 함!
    
    var body: some View {
        VStack {
            Text(ganadi.name)
            Text(ganadi.emoji)
            
            Button("상세 정보 보기") {
                path.append(ganadi.detail)
            }
        }
        .navigationTitle("\(path.count)번째 view")
    }
}

struct InfoView: View {
    let info: String
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Text(info)
            
            Button("루트로 돌아가기") {
                path.removeLast(path.count) // path가 빈 배열이 되면서 루트로 이동
            }
        }
        .navigationTitle("\(path.count)번째 view")
    }
}
