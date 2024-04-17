//
//  TamagotchiView.swift
//  SeSAC-Mission_SwiftUI
//
//  Created by 원태영 on 4/17/24.
//

import SwiftUI

struct TamagotchiView: View {
  
  @State private var level: Int = 1
  @State private var grain: Int = 1 {
    didSet {
      calculateLevel(value: grain, feedCase: .grain)
    }
  }
  
  @State private var waterDrop: Int = 1 {
    didSet {
      calculateLevel(value: waterDrop, feedCase: .water)
    }
  }
  
  @State private var feedResultText: String = "다마고치에게 먹이를 주세요 ^-^"
  @FocusState private var isFocuesed: Bool
  
  var tamagotchiInfoView: some View {
    VStack(spacing: 20) {
      Text("방실방실 다마고치")
        .asBorderStyle()
      
      Text("LV \(level) · \(FeedCase.grain.name) \(grain)개 · \(FeedCase.water.name) \(waterDrop)개")
        .asPrimaryStyle()
      
      Text(feedResultText)
        .asPrimaryStyle()
    }
  }
  
  var body: some View {
    ZStack {
      VStack(spacing: 40) {
        tamagotchiInfoView
        
        FeedView(feedCase: .grain, level: $level, count: $grain, feedResultText: $feedResultText)
          .focused($isFocuesed)
        
        FeedView(feedCase: .water, level: $level, count: $waterDrop, feedResultText: $feedResultText)
          .focused($isFocuesed)
      }
    }
    .ignoresSafeArea()
    .frame(maxHeight: .infinity)
    .background(.tamagotchiBackground)
    .onTapGesture {
      isFocuesed = false
    }
  }
  
  private func calculateLevel(value: Int, feedCase: FeedCase) {
    
    if value >= feedCase.levelUpRequired {
      let newLevel = value / feedCase.levelUpRequired
      let remainValue = value % feedCase.levelUpRequired
      
      level += newLevel
      feedResultText = "레벨이 \(newLevel) 올랐어요!"
      
      switch feedCase {
        case .grain:
        grain = remainValue
        case .water:
          waterDrop = remainValue
      }
    }
  }
}

fileprivate struct FeedView: View {
  
  let feedCase: FeedCase
  
  @State private var input: String = ""
  @Binding var level: Int
  @Binding var count: Int
  @Binding var feedResultText: String
  
  var body: some View {
    HStack(spacing: 20) {
      TextField(feedCase.placeholder, text: $input)
        .autocorrectionDisabled()
        .textInputAutocapitalization(.never)
        .asPrimaryStyle()
        .overlay(alignment: .bottom) {
          Rectangle()
            .foregroundStyle(.tamagotchiPrimary)
            .frame(height: 2)
            .offset(y: 10)
        }
      
      Button(feedCase.actionText, systemImage: feedCase.actionIcon) {
        feed()
        calculateLevel(value: count, feedCase: feedCase)
      }
      .asBorderStyle()
    }
    .padding(.horizontal, 30)
  }
  
  private func feed() {
    defer { clearField() }
    
    guard !input.isEmpty else {
      let defaultFeedValue: Int = 1
      
      count += defaultFeedValue
      feedResultText = "\(feedCase.name)을 \(defaultFeedValue)개 먹였어요!"
      return
    }
    
    guard let newFeed = Int(input) else {
      feedResultText = "숫자만 입력 가능해요. 다시 입력해주세요!"
      return
    }
    
    guard newFeed <= feedCase.maxFeedValue else {
      feedResultText = "\(feedCase.name)은 한 번에 \(feedCase.maxFeedValue)개까지만 먹일 수 있어요!"
      return
    }
    
    count += newFeed
    feedResultText = "\(feedCase.name)을 \(newFeed)개 먹였어요!"
  }
  
  private func clearField() {
    input = ""
  }
  
  private func calculateLevel(value: Int, feedCase: FeedCase) {
    
    if value >= feedCase.levelUpRequired {
      let newLevel = value / feedCase.levelUpRequired
      let remainValue = value % feedCase.levelUpRequired
      
      level += newLevel
      count = remainValue
      feedResultText = "레벨이 \(newLevel) 올랐어요!"
    }
  }
}

fileprivate enum FeedCase: String {
  case grain = "밥알"
  case water = "물방울"
  
  var name: String {
    return self.rawValue
  }
  
  var placeholder: String {
    switch self {
      case .grain: "밥주세용"
      case .water: "물주세용"
    }
  }
  
  var actionText: String {
    switch self {
      case .grain: "밥먹기"
      case .water: "물먹기"
    }
  }
  
  var actionIcon: String {
    switch self {
      case .grain: "leaf.circle"
      case .water: "drop.circle"
    }
  }
  
  var maxFeedValue: Int {
    switch self {
      case .grain: 99
      case .water: 49
    }
  }
  
  var levelUpRequired: Int {
    switch self {
      case .grain: 20
      case .water: 10
    }
  }
}

#Preview {
  TamagotchiView()
}
