//
//  CoewDataHandler.swift
//  StudentAdmissionCoreDataApp
//
//  Created by DCS on 22/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//
import Foundation
import UIKit
import CoreData

class CoewDataHandler {
    static let shared = CoreDataHandler()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let manageObjContext : NSManagedObjectContext?
    private init() {
        manageObjContext = appDelegate.persistentContainer.viewContext
    }
    func save(){
        appDelegate.saveContext()
    }
}
