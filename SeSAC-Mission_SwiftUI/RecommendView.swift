//
//  RecommendView.swift
//  SeSAC-Mission_SwiftUI
//
//  Created by 원태영 on 4/15/24.
//

import SwiftUI

struct RecommendView: View {
  var body: some View {
    
    VStack(alignment: .leading, spacing: 30) {
      Image(systemName: "fireworks")
        .font(.largeTitle)
        .foregroundStyle(.red, .yellow, .blue)
      
      Text("포인트를 더 모을 수 있게 맞춤 혜택을 추천해드릴까요?")
        .modifier(PrimaryText())
      
      HStack(spacing: 15) {
        Image(systemName: "checkmark.square.fill")
          .foregroundStyle(.white, .blue)
          .modifier(LabelImage())
        
        Text("매일 포인트 받는 출석체크 퀴즈")
          .modifier(SecondaryText())
        
        Spacer()
      }
      
      HStack(spacing: 15) {
        Image(systemName: "n.circle.fill")
          .foregroundStyle(.white, .red)
          .modifier(LabelImage())
        
        Text("새로운 이벤트")
          .modifier(SecondaryText())
        
        Spacer()
      }
      
      HStack(spacing: 15) {
        Image(systemName: "star.fill")
          .foregroundStyle(.yellow)
          .modifier(LabelImage())
        
        Text("미션 추천")
          .modifier(SecondaryText())
        
        Spacer()
      }
      
      Spacer()
        
      Text("[선택] 맞춤형 서비스 이용 동의")
        .modifier(SecondaryText())
      
      VStack(alignment: .center, spacing: 20) {
        Button("동의하기") {
          
        }
        .modifier(PrimaryButton())
        
        Button("다음에 하기") {
          
        }
        .foregroundStyle(.gray)
        .bold()
      }
    }
    .padding()
  }
}

#Preview {
  RecommendView()
    .preferredColorScheme(.dark)
}
