//
//  SupportItmeType.swift
//  SecureMarshmallow_V3
//
//  Created by 박준하 on 2023/04/29.
//

import UIKit

// 지원 아이템의 타입을 나타내는 열거형
enum SupportItemType {
    case support  // 지원 전화번호
    
    // 해당 아이템 타입에 대한 제목을 반환하는 계산 프로퍼티
    var title: String {
        switch self {
        case .support:
            return "카카오뱅크 7777-01-5832634"
        }
    }
}

// 공통 아이템 타입 프로토콜 채택
struct SupportItem: CommonItemType {
    typealias ItemType = SupportItemType
    
    let type: ItemType  // 아이템 타입
    let hasSwitch: Bool  // 스위치 여부
    var switchState: Bool  // 스위치 상태
    
    // 초기화 메서드
    init(type: ItemType, hasSwitch: Bool = false, switchState: Bool = false) {
        self.type = type
        self.hasSwitch = hasSwitch
        self.switchState = switchState
    }
}
