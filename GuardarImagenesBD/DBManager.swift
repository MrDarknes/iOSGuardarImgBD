//
//  DBManager.swift
//  GuardarImagenesBD
//
//  Created by Mac16 on 08/11/20.
//  Copyright © 2020 oscar. All rights reserved.
//

import Foundation
import UIKit //UIAplication
import CoreData //NSFetchRequest

class DBManager {
    static let shareInstance = DBManager()
    
    func conexion() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
        
    }
    func saveImage(data: Data) {
        let context = conexion()
        let imageInstance = Imagen(context: context) //OBJETO ENTIDAD
        imageInstance.imgBinary = data //ATRIBUTO DEL OBJETO ENTIDAD
        do {
            try context.save()
            print("Imagen Guardada")
        } catch {
            print(error.localizedDescription)
        }
    }

    func fetchImage() -> [Imagen] {
        let context = conexion()
        var fetchingImage = [Imagen]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Imagen")
        do {
            fetchingImage = try context.fetch(fetchRequest) as! [Imagen]
        } catch {
            print("Error al consultar imagen")
        }
        return fetchingImage
    }
}

