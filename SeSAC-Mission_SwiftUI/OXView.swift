//
//  OXView.swift
//  SeSAC-Mission_SwiftUI
//
//  Created by 원태영 on 4/15/24.
//

import SwiftUI

struct OXView: View {
  var body: some View {
    
    VStack(alignment: .leading, spacing: 30) {
      
      Image(systemName: "newspaper.fill")
        .font(.largeTitle)
        .foregroundStyle(.teal)
      
      Text("등기부등본은 집주인만 발급받을 수 있다?")
        .modifier(PrimaryText())
      
      Text("매일 푸는 금융 퀴즈 290,300명 참여중")
        .modifier(SecondaryText())
      
      HStack(spacing: 20) {
        SelectionView(text: "그렇다", image: "checkmark", color: .blue)
        SelectionView(text: "아니다", image: "xmark", color: .red)
      }
      .frame(maxWidth: .infinity)
      
      HStack(spacing: 10) {
        CellView(image: "b.square.fill", text: "토스뱅크")
          .foregroundStyle(.white, .blue)
        
        CellView(image: "chart.line.uptrend.xyaxis", text: "토스증권")
          .foregroundStyle(.red, .red.opacity(0.25))
        
        CellView(image: "beats.headphones", text: "고객센터")
          .foregroundStyle(.gray, .blue)
      }
      .frame(maxWidth: .infinity)
      
      Spacer()
    }
    .padding(25)
  }
}

struct CellView: View {
  
  let image: String
  let text: String
  
  var body: some View {
    VStack(spacing: 10) {
      Image(systemName: image)
        .font(.title)
      Text(text)
        .foregroundStyle(.white)
    }
    .modifier(CellModifier())
  }
}

struct SelectionView: View {
  
  let text: String
  let image: String
  let color: Color
  
  init(text: String, image: String, color: Color) {
    self.text = text
    self.image = image
    self.color = color
  }
  
  var body: some View {
    VStack(spacing: 20) {
      Image(systemName: image)
        .font(.largeTitle)
        .fontWeight(.black)
        .foregroundStyle(color)
      
      Text(text)
        .font(.title3)
        .foregroundStyle(color)
        .bold()
    }
    .padding(25)
    .frame(maxWidth: .infinity)
    .background(color.opacity(0.25))
    .cornerRadius(20)
  }
}

#Preview {
  OXView()
    .preferredColorScheme(.dark)
}
