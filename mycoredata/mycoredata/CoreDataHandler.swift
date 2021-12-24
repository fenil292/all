//
//  CoreDataHandler.swift
//  mycoredata
//
//  Created by DCS on 16/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class CoreDataHandler {
    static let shared = CoreDataHandler()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let manageObjContext : NSManagedObjectContext?
    private init() {
        manageObjContext = appDelegate.persistentContainer.viewContext
    }
    func save(){
        appDelegate.saveContext()
    }
    func insert(name: String, age: Int, phone: String , completion : @escaping () -> Void) {
        let emp = Employee(context: manageObjContext!)
        emp.age = Int64(age)
        emp.name = name
        emp.phone = phone
        save()
        completion()
    }
    func  update(emp:Employee, name: String, age: Int, phone: String, completion : @escaping () -> Void) {
        emp.age = Int64(age)
        emp.name = name
        emp.phone = phone
        save()
        completion()
    }
    func delete(emp:Employee, completion: @escaping () -> Void) {
        manageObjContext!.delete(emp)
        save()
        completion()
    }
    func fetch() -> [Employee] {
        let fetchRequest:NSFetchRequest<Employee> = Employee.fetchRequest()
        do {
            let empArray = try manageObjContext?.fetch(fetchRequest)
            return empArray!
        } catch {
            print(error)
            return [Employee]()
        }
    }
}
