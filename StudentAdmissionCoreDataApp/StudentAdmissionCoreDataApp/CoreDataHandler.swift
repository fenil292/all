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
    func insert(spid: Int,pwd: String,name: String,phone: String,gmail: String,gender: String,course: String,dob: String,completion : @escaping () -> Void)
    {
        let stud = Student(context: manageObjContext!)
        stud.spid = Int16(spid)
        stud.pwd = pwd
        stud.name = name
        stud.phone = phone
        stud.gmail = gmail
        stud.gender = gender
        stud.course = course
        stud.dob = dob
        save()
        completion()
    }
    func update(stud:Student, name: String,phone: String,gmail: String,gender: String,course: String,dob: String,completion : @escaping () -> Void)
    {
        stud.name = name
        stud.phone = phone
        stud.gmail = gmail
        stud.gender = gender
        stud.course = course
        stud.dob = dob
        save()
        completion()
    }
    func delete(stud:Student, completion: @escaping () -> Void)
    {
        manageObjContext!.delete(stud)
        save()
        completion()
    }
    func fetch() -> [Student] {
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        do {
            let studArray = try manageObjContext?.fetch(fetchRequest)
            return studArray!
        } catch {
            print(error)
            return [Student]()
        }
    }
    func fetch_id() -> [Student] {
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        //fetchRequest.fetchLimit = 1
        fetchRequest.sortDescriptors? = [NSSortDescriptor(key: "spid", ascending: true)]
         //[[NSSortDescriptor sortDescriptorWithKey:@"spid"ascending:NO]]
        do {
            let studArray = try manageObjContext?.fetch(fetchRequest)
            //let c = studArray?.count ?? 0
            
            /*if c > 0 {
                studArray?[0] = studArray![c-1] ?? Student
            }*/
            return studArray!
        } catch {
            print(error)
            return [Student]()
        }
    }
    func insert_notice(name: String,course: String,date: String,desc: String,completion : @escaping () -> Void)
    {
        let notice = Notice(context: manageObjContext!)
        notice.name = name
        notice.course = course
        notice.notice_date = date
        notice.desc = desc
        save()
        completion()
    }
    func update_notice(notice: Notice,name: String,course: String,date: String,desc: String,completion : @escaping () -> Void)
    {
        notice.name = name
        notice.course = course
        notice.notice_date = date
        notice.desc = desc
        save()
        completion()
    }
    func delete_notice(notice:Notice, completion: @escaping () -> Void)
    {
        manageObjContext!.delete(notice)
        save()
        completion()
    }
    func fetch_notice() -> [Notice] {
        let fetchRequest:NSFetchRequest<Notice> = Notice.fetchRequest()
        do {
            let noticeArray = try manageObjContext?.fetch(fetchRequest)
            return noticeArray!
        } catch {
            print(error)
            return [Notice]()
        }
    }
    func check_login(spid:Int,pass: String)->[Student]
    {
        var sdata = [Student]()
        
        
        let fetchreq:NSFetchRequest = Student.fetchRequest()
        let cpredict = NSPredicate(format: "spid contains %i AND pwd contains %@",spid,pass)
        fetchreq.predicate = cpredict
        
        do{
            sdata = try (manageObjContext?.fetch(fetchreq))!
            print(sdata.count)
            return sdata
        }
        catch{
            print("Error")
            return [Student]()
        }
    }
    func fetch_stud_course(spid:Int)->[Student]
    {
        var sdata = [Student]()
        
        
        let fetchreq:NSFetchRequest = Student.fetchRequest()
        let cpredict = NSPredicate(format: "spid contains \(spid)")
        fetchreq.predicate = cpredict
        
        do{
            sdata = try (manageObjContext?.fetch(fetchreq))!
            print(sdata.count)
            return sdata
        }
        catch{
            print("Error")
            return [Student]()
        }
    }
    func fetch_stud_notice(course: String)->[Notice]
    {
        var sdata = [Notice]()
        print(course)
        let c = "All Course"
        let fetchreq:NSFetchRequest = Notice.fetchRequest()
        let cpredict = NSPredicate(format: "course contains %@ OR course contains %@",course,c)
        fetchreq.predicate = cpredict
        do{
            sdata = try (manageObjContext?.fetch(fetchreq))!
            print(sdata.count)
            return sdata
        }
        catch{
            print("Error")
            return [Notice]()
        }
    }
    func fetch_stud_info(spid:Int)->[Student]
    {
        var sdata = [Student]()
        
        
        let fetchreq:NSFetchRequest = Student.fetchRequest()
        let cpredict = NSPredicate(format: "spid contains \(spid)")
        fetchreq.predicate = cpredict
        
        do{
            sdata = try (manageObjContext?.fetch(fetchreq))!
            print(sdata.count)
            return sdata
        }
        catch{
            print("Error")
            return [Student]()
        }
    }
    func update_password(stud:Student, pass: String,completion : @escaping () -> Void)
    {
        stud.pwd = pass
        save()
        completion()
    }
}
