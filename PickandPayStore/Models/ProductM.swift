//
//  Product.swift
//  PickandPayStore
//
//  Created by iMac on 3/29/22.
//

import Foundation

struct ProductM {
    var id: Int = 0
    var departmentID: Int = 0
    var categoryID: Int = 0
    var name: String = ""
    var price: Float = 0.0
    var imageName: String = ""
    var description: String = ""
    
    static let product = ProductM()
    
    // Convert query result set to Array of Product
    static func convert(productsResultSet: [[String]]) -> [ProductM]? {
        var products = [ProductM]()
        for product_row in productsResultSet {
            let columns = product_row
            
            var product = ProductM()
            product.id = Int(columns[0])!
            product.departmentID = Int(columns[1])!
            product.categoryID = Int(columns[2])!
            product.name = columns[3]
            product.price = Float(columns[4])!
            product.imageName = columns[5]
            product.description = columns[6]
            
            products.append(product)
        }
        return products
    }
    
    static func getAll() -> [ProductM]? {
        return SQLiteDAL.getAllProducts()
    }
    
    static func getByID(productID: Int) -> [ProductM]? {
        return SQLiteDAL.getProductByID(productID: productID)
    }
    
    static func getByName(name: String) -> [ProductM]? {
        return SQLiteDAL.getProductsByName(name: name)
    }
    
    static func create(departmentID: Int, categoryID: Int, name: String, price: Float, imageName: String, description: String) -> Bool? {
        return SQLiteDAL.createProduct(departmentID: departmentID, categoryID: categoryID, name: name, price: price, imageName: imageName, description: description)
    }
}