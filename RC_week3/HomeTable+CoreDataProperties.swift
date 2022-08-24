//
//  HomeTable+CoreDataProperties.swift
//  RC_week3
//
//  Created by 소정의 Mac on 2022/08/24.
//
//

import Foundation
import CoreData


extension HomeTable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HomeTable> {
        return NSFetchRequest<HomeTable>(entityName: "HomeTable")
    }

    @NSManaged public var title: String?
    @NSManaged public var contents: String?
    @NSManaged public var buy: Int64
    @NSManaged public var like: Int64
    @NSManaged public var userLike: Bool
    @NSManaged public var state: Int64

}

extension HomeTable : Identifiable {

}
