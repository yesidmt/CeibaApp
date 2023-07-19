//
//  ListUserInteractor.swift
//  CeibaApp
//
//  Created by yesid mendoza on 18/07/23.
//

import Foundation
import CoreData
/// ListUserInteractor Module Interactor
class ListUserInteractor: ListUserInteractorProtocol {
    func getAllUsers(completion: @escaping ((_ users: Users) -> Void)){
       
        let usersDB = getUserDB()
        if usersDB.isEmpty {
           //no hay datos, consumir servicio"
            let link = Endpoint.baseURL + "/\(Endpoint.users)"
            
            guard let url = URL(string: link) else { return }
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                guard let dataResult = data else { return }
                do {
                    let users = try JSONDecoder().decode([User].self, from: dataResult)
                    for element in users {
                        var post : UserEnt
                        let context = self.persistentContainer.viewContext
                        post = UserEnt(context: context)
                        
                        post.id = Int16(element.id)
                        post.name = element.name
                        post.email = element.email
                        post.phone = element.phone
                        self.saveContext()
                        do {
                            try context.save()
                            // El guardado fue exitoso
                        } catch {
                            // Error al guardar el contexto
                            print("Error al guardar el contexto: \(error)")
                        }
                    }
                
                    let data = Users(data: users)
                    completion(data)
                } catch {
                    print(error)
                }
            }).resume()
            
            
          
        } else {
            //hay datos locales, retornar y pintar
            let data = Users(data: usersDB)
            completion(data)
        }
    }
    func getUserDB () -> [User] {
        var returnUsers = [User]()
        do{
            let context = self.persistentContainer.viewContext
            let users : [UserEnt] = try context.fetch(UserEnt.fetchRequest())
            if !users.isEmpty {
                for element in users {
                    let u = User(id: Int(element.id), name: element.name!, username: "", email: element.email!, address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: element.phone!, website: "", company: Company(name: "", catchPhrase: "", bs: ""))
                    returnUsers.append(u)
                }
            }
          
        }catch{
           
        }
        return returnUsers
    }
    // MARK: - Core Data stack

    lazy var persistentContainer: PersistentContainer = {
    
        let container = PersistentContainer(name: "UserModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
            
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    // MARK: - Core Data Saving support

    func saveContext () -> Error? {
        let context = persistentContainer.viewContext
        if context.hasChanges {
           do {
                try context.save()
                return nil
            } catch {
               let nserror = error as NSError
                return nserror
            }
        }else{
            print("no changes")
            return nil
        }
    }
    
    func deleteAllEnt () {
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserModel")
           fetchRequest.returnsObjectsAsFaults = false
           do {
               let results = try context.fetch(fetchRequest)
               for managedObject in results {
                   if let managedObjectData: NSManagedObject = managedObject as? NSManagedObject {
                       context.delete(managedObjectData)
                        try context.save()
                   }
               }
           } catch let error as NSError {
               print("Deleted all my data in myEntity error : \(error) \(error.userInfo)")
           }
    }
    
    func deleteAllRegisters() {
        
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserModel")
        let deleteBatch = NSBatchDeleteRequest(fetchRequest: fetchRequest )
        do {
        
            try context.execute(deleteBatch)
            try context.save()
           }catch {
           }
       }
}

final class PersistentContainer: NSPersistentContainer { }
