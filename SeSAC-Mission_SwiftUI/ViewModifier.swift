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
