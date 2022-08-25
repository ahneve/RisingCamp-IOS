//
//  HomeContent.swift
//  RC_week3
//
//  Created by 소정의 Mac on 2022/08/25.
//

import Foundation
import RealmSwift

class HomeContent : Object {
    @objc dynamic var id : Int = 0
    @objc dynamic var title : String = ""
    @objc dynamic var content : String = ""
    @objc dynamic var buy : Int = 0
    @objc dynamic var like : Int = 0
    @objc dynamic var userLike : Bool = false
    @objc dynamic var state :Int = 0
}
