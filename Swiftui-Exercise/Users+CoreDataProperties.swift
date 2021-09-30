//
//  Users+CoreDataProperties.swift
//  Swiftui-Exercise
//
//  Created by 박윤수 on 2021/09/30.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var wakeupTime: Float
    @NSManaged public var sleepTime: Float

}

extension Users : Identifiable {

}
