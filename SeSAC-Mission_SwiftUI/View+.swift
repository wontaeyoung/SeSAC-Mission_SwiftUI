//
//  View+.swift
//  SeSAC-Mission_SwiftUI
//
//  Created by 원태영 on 4/17/24.
//

import SwiftUI

extension View {
  
  func asBorderStyle() -> some View {
    modifier(BorderStyleModifier())
  }
  
  func asPrimaryStyle() -> some View {
    modifier(PrimaryStyleModifier())
  }
}
