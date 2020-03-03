//
//  CoreDataWorker.swift
//  TinkoffProject
//
//  Created by Gennady Stepanov on 03/03/2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import CoreData

protocol CoreDataWorkerProtocol {
  func get<Entity: ManagedObjectConvertible>
    (with predicate: NSPredicate?,
     sortDescriptors: [NSSortDescriptor]?,
     fetchLimit: Int?,
     completion: @escaping (Result<[Entity], Error>) -> Void)
  func createOrUpdate<Entity: ManagedObjectConvertible>
    (entities: [Entity],
     completion: @escaping (Error?) -> Void)
  func deleteAll<T: ManagedObjectProtocol>(managedObjectType: T.Type)
  
}

extension CoreDataWorkerProtocol {
  func get<Entity: ManagedObjectConvertible>
    (with predicate: NSPredicate? = nil,
     sortDescriptors: [NSSortDescriptor]? = nil,
     fetchLimit: Int? = nil,
     completion: @escaping (Result<[Entity], Error>) -> Void) {
    get(with: predicate,
        sortDescriptors: sortDescriptors,
        fetchLimit: fetchLimit,
        completion: completion)
  }
}

enum CoreDataWorkerError: Error {
  case cannotFetch(String)
  case cannotSave(Error)
}

class CoreDataWorker: CoreDataWorkerProtocol {
  let coreData: CoreDataServiceProtocol
  
  init(coreData: CoreDataServiceProtocol = CoreDataService.shared) {
    self.coreData = coreData
  }
  
  func get<Entity: ManagedObjectConvertible>
    (with predicate: NSPredicate?,
     sortDescriptors: [NSSortDescriptor]?,
     fetchLimit: Int?,
     completion: @escaping (Result<[Entity], Error>) -> Void) {
    coreData.performForegroundTask { context in
      do {
        let fetchRequest = Entity.ManagedObject.fetchRequest()
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDescriptors
        if let fetchLimit = fetchLimit {
          fetchRequest.fetchLimit = fetchLimit
        }
        let results = try context.fetch(fetchRequest) as? [Entity.ManagedObject]
        let items: [Entity] = results?.compactMap { $0.toEntity() as? Entity } ?? []
        completion(.success(items))
      } catch {
        let fetchError = CoreDataWorkerError.cannotFetch("Cannot fetch error: \(error))")
        completion(.failure(fetchError))
      }
    }
  }
  
  func createOrUpdate<Entity: ManagedObjectConvertible>
    (entities: [Entity],
     completion: @escaping (Error?) -> Void) {
    
    coreData.performBackgroundTask { context in
      _ = entities.compactMap({ (entity) -> Entity.ManagedObject? in
        return entity.toManagedObject(in: context)
      })
      do {
        try context.save()
        completion(nil)
      } catch {
        completion(CoreDataWorkerError.cannotSave(error))
      }
    }
  }
  
  func deleteAll<T: ManagedObjectProtocol>(managedObjectType: T.Type) {
    let entityName = String(describing: managedObjectType)
    
    coreData.performForegroundTask { context in
      let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
      let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
      
      do {
        try context.execute(deleteRequest)
        try context.save()
      } catch let error as NSError {
        print("[CoreData:] Fetching error: \(error), \(error.userInfo)")
      }
      print("[CoreData:] All tickers removed from CoreData")
    }
  }
}
