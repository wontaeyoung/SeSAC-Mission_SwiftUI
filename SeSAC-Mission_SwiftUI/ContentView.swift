//
//  ContentView.swift
//  SeSAC-Mission_SwiftUI
//
//  Created by 원태영 on 4/15/24.
//

import SwiftUI

struct ContentView: View {
  
  var body: some View {
    NavigationStack {
      VStack(spacing: 40) {
        NavigationLink("포인트 혜택 추천 뷰") {
          RecommendView()
        }
        .modifier(PrimaryButton())
        
        NavigationLink("OX 퀴즈 뷰") {
          OXView()
        }
        .modifier(PrimaryButton())
      }
      .padding()
    }
  }
}

#Preview {
  ContentView()
    .preferredColorScheme(.dark)
}
