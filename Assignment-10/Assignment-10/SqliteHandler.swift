//
//  SqliteHandler.swift
//  Assignment-10
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
import SQLite3

class SqliteHandler {
    static let shared = SqliteHandler()                                                 //singleturn
    let dbPath = "empdb.sqllite"
    var db:OpaquePointer?
    private init() {
        db = openDatabase()
        createTable()
    }
    
    private func openDatabase() -> OpaquePointer? {
        let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = docURL.appendingPathComponent(dbPath)
        
        var database:OpaquePointer? = nil
        
        if sqlite3_open(fileURL.path, &database) == SQLITE_OK {
            print("Opened connection to the database successfully at: \(fileURL)")
            return database
        } else {
            print("error connecting to the databse")
            return nil
        }
    }
    private func createTable() {
        /*int sqlite3_prepare_v2(
         sqlite3 *db,            /* Database handle */
         const char *zSql,       /* SQL statement, UTF-8 encoded */
         int nByte,              /* Maximum length of zSql in bytes. */
         sqlite3_stmt **ppStmt,  /* OUT: Statement handle */
         const char **pzTail     /* OUT: Pointer to unused portion of zSql */
         );*/
        let createTableString = """
            CREATE TABLE IF NOT EXISTS emp(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            age INTEGER,
            phone TEXT);
        """
        
        var createTableStatement:OpaquePointer? = nil
        //prepare statement
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            //evaluate statement
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("emp table created")
            } else {
                print("emp table could not be created")
            }
        } else {
            print("emp Table could not be prepared")
        }
        
        //delete statement
        sqlite3_finalize(createTableStatement)
    }
    
    func insert(e:Emp, completion: @escaping ((Bool) -> Void)) {
        let insertstr = "INSERT INTO emp (name,age,phone) VALUES (?, ?, ?);"
        
        var insertst:OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, insertstr, -1, &insertst, nil) == SQLITE_OK {
            //int sqlite3_bind_text(sqlite3_stmt*,int,const char*,int,void(*)(void*));
            sqlite3_bind_text(insertst, 1, (e.name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertst, 2, Int32(e.age))
            sqlite3_bind_text(insertst, 3, (e.phone as NSString).utf8String, -1, nil)
            if sqlite3_step(insertst) == SQLITE_DONE {
                print("inserted")
                completion(true)
            } else {
                print("not inserted")
                completion(false)
            }
            
        } else {
            print("Insert statement could not be prepared")
            completion(false)
        }
        sqlite3_finalize(insertst)
    }
    
    func update(e:Emp, completion: @escaping ((Bool) -> Void)) {
        let updatestr = "UPDATE emp SET name = ?, age = ?, phone = ? WHERE id = ?;"
        
        var updatest:OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, updatestr, -1, &updatest, nil) == SQLITE_OK {
            //int sqlite3_bind_text(sqlite3_stmt*,int,const char*,int,void(*)(void*));
            sqlite3_bind_text(updatest, 1, (e.name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(updatest, 2, Int32(e.age))
            sqlite3_bind_text(updatest, 3, (e.phone as NSString).utf8String, -1, nil)
            sqlite3_bind_int(updatest, 4, Int32(e.id))
            if sqlite3_step(updatest) == SQLITE_DONE {
                print("updated")
                completion(true)
            } else {
                print("not updated")
                completion(false)
            }
            
        } else {
            print("update statement could not be prepared")
            completion(false)
        }
        sqlite3_finalize(updatest)
    }
    
    func delete(for id:Int, completion: @escaping ((Bool) -> Void)) {
        let deletestr = "DELETE FROM emp WHERE id = ?;"
        
        var deletest:OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, deletestr, -1, &deletest, nil) == SQLITE_OK {
            //int sqlite3_bind_text(sqlite3_stmt*,int,const char*,int,void(*)(void*));
            
            sqlite3_bind_int(deletest, 1, Int32(id))
            if sqlite3_step(deletest) == SQLITE_DONE {
                print("deleted")
                completion(true)
            } else {
                print("not deleted")
                completion(false)
            }
            
        } else {
            print("delete statement could not be prepared")
            completion(false)
        }
        sqlite3_finalize(deletest)
    }
    
    func fetch() -> [Emp] {
        let fetchstr = "SELECT * FROM emp;"
        var emp = [Emp]()
        var fetchst:OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, fetchstr, -1, &fetchst, nil) == SQLITE_OK {
            
            while sqlite3_step(fetchst) == SQLITE_ROW {
                print("fetched")
                let id = Int(sqlite3_column_int(fetchst, 0))
                let name = String(cString: sqlite3_column_text(fetchst, 1))
                let age = Int(sqlite3_column_int(fetchst, 2))
                let phone = String(cString: sqlite3_column_text(fetchst, 3))
                emp.append(Emp(id: id, name: name, age: age, phone: phone))
            }
            
        } else {
            print("fetch statement could not be prepared")
    
        }
        sqlite3_finalize(fetchst)
        return emp
    }
}
