//
//  ViewModifier.swift
//  SeSAC-Mission_SwiftUI
//
//  Created by 원태영 on 4/15/24.
//

import SwiftUI

struct PrimaryButton: ViewModifier {
  
  func body(content: Content) -> some View {
    content
      .bold()
      .foregroundStyle(.white)
      .padding(.horizontal, 20)
      .padding(.vertical, 15)
      .frame(maxWidth: .infinity)
      .background(.blue)
      .cornerRadius(15)
  }
}

struct PrimaryText: ViewModifier {

  func body(content: Content) -> some View {
    content
      .font(.title2)
      .bold()
  }
}

struct SecondaryText: ViewModifier {

  func body(content: Content) -> some View {
    content
      .font(.headline)
      .foregroundStyle(.gray)
  }
}

struct LabelImage: ViewModifier {
  
  func body(content: Content) -> some View {
    content
      .font(.title2)
  }
}

struct CellModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .bold()
      .padding()
      .frame(maxWidth: .infinity)
      .background(.gray.opacity(0.25))
      .cornerRadius(15)
  }
}

struct BorderStyleModifier: ViewModifier {
  
  func body(content: Content) -> some View {
    content
      .asPrimaryStyle()
      .padding(10)
      .overlay(
        RoundedRectangle(cornerRadius: 8)
          .stroke(.tamagotchiPrimary, lineWidth: 1.5)
      )
  }
}

struct PrimaryStyleModifier: ViewModifier {
  
  func body(content: Content) -> some View {
    content
      .font(.title3)
      .bold()
      .foregroundStyle(.tamagotchiPrimary)
  }
}
