//
//  JSONLoaderProtocol.swift
//  WidgetsApp
//
//  Created by Mahmoud Alaa on 25/08/2023.
//

import Foundation

protocol JSONLoaderProtocol: AnyObject {
    
    func loadJSON<T: Decodable>(fileName: String, type: T.Type) -> T
    
}

extension JSONLoaderProtocol {
    
    private
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadJSON<T: Decodable>(fileName: String, type: T.Type) -> T {

        guard let path = bundle.url(forResource: fileName, withExtension: "json") else {
            fatalError("cann't load \(fileName) json file")
        }
        
        do {
            let data = try Data(contentsOf: path)
            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            return decodedObject
        } catch {
            fatalError("cann't decode file with \(path)")
        }
        
    }
    
}
