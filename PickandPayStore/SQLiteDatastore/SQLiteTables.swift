//
//  SQLiteTables.swift
//  PickAndPayStore
//
//  Created by iMac on 3/29/22.
//

import Foundation

class SQLiteTables {
    
   private static var dropUserTable = "DROP TABLE IF EXISTS User;"
   private static var createUserTable = """
             CREATE TABLE IF NOT EXISTS User
             (ID INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
             username TEXT NOT NULL,
             email TEXT NOT NULL,
             password TEXT NOT NULL,
             phone_number TEXT NOT NULL,
             balance DECIMAL(10,3) NOT NULL);
             """
    private static var insertIntoUserTable = """
             INSERT INTO User ( username, email, password, phone_number, balance )
             VALUES ('tester1', 't1@gmail.com', 'Password!', 9812778590, 0.000),
                    ('gary', 'gary@gmail.com', 'Gassword!', 3242334560, 0.000),
                    ('admin', 'admin@gmail.com', 'superSecret!', 2393648760, 0.000);
             """
    static var userTableScripts = [dropUserTable, createUserTable, insertIntoUserTable]
    
    
    
    private static var dropDepartmentTable = "DROP TABLE IF EXISTS Department;"
    private static var createDepartmentTable = """
             CREATE TABLE IF NOT EXISTS Department
             (ID INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
             name TEXT NOT NULL,
             imageName TEXT NOT NULL);
             """
    private static var insertIntoDepartmentTable = """
             INSERT INTO Department ( name, imageName )
             VALUES ( 'Home & Kitchen', 'imHomeKitchen' ),
                    ( 'Beauty & Personal Care', 'imBeautyPersonalCare'),
                    ( 'Clothing, Shoes & Jewelry','imClothingShoesJewelry'),
                    ( 'Electronics', 'imElectronics' ),
                    ( 'Video Games','imVideoGames'),
                    ( 'Pet Supplies', 'imPetSupplies'),
                    ( 'Sports & Outdoors', 'imSportsOutdoors'),
                    ( 'Books', 'imBooks'),
                    ( 'Camera & Photography', 'imCameraPhotography');
             """
    static var departmentTableScripts = [dropDepartmentTable, createDepartmentTable, insertIntoDepartmentTable]
    
    
    
    private static var dropCategoryTable = "DROP TABLE IF EXISTS Category;"
    private static var createCategoryTable = """
             CREATE TABLE IF NOT EXISTS Category
             (ID INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
             departmentID INTEGER NOT NULL,
             name TEXT NOT NULL,
             imageName TEXT NOT NULL,
             FOREIGN KEY(departmentID) REFERENCES Department(ID));
             """
    private static var insertIntoCategoryTable = """
             INSERT INTO Category ( departmentID, name, imageName)
             VALUES ( 1, 'Kitchen Appliances', 'imKitchenAppliances'),
                    ( 1, 'Pots & Pans', 'imPotsPans'),
                    ( 1, 'Plates & Bowls', 'imPlatesBowls'),
                    ( 2, 'Makeup', 'imMakeup'),
                    ( 2, 'Skin Care', 'imSkinCare'),
                    ( 2, 'Bath & Body', 'imBathBody'),
                    ( 3, "Women's Fashion", 'imWomenFashion'),
                    ( 3, "Men's Fashion", 'imMenFashion');
             """
    static var categoryTableScripts = [dropCategoryTable, createCategoryTable, insertIntoCategoryTable]
    
    
    
    private static var dropProductTable = "DROP TABLE IF EXISTS Product;"
    private static var createProductTable = """
             CREATE TABLE IF NOT EXISTS Product
             (ID INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
             departmentID INTEGER NOT NULL,
             categoryID INTEGER NOT NULL,
             name TEXT NOT NULL,
             price DECIMAL(10,3) NOT NULL,
             imageName TEXT NOT NULL,
             FOREIGN KEY(departmentID) REFERENCES Department(ID),
             FOREIGN KEY(categoryID) REFERENCES Category(ID));
             """
    private static var insertIntoProductTable = """
             INSERT INTO Product ( departmentID, categoryID, name, price, imageName )
             VALUES ( 1, 1, 'Microwave', 45.50, 'imMicrowave' ),
                    ( 2, 2, 'Eyeliner', 12.50, 'imEyeliner' );
             """
    static var productTableScripts = [dropProductTable, createProductTable, insertIntoProductTable]
    
    
    
    private static var dropWishlistTable = "DROP TABLE IF EXISTS Wishlist;"
    private static var createWishlistTable = """
             CREATE TABLE IF NOT EXISTS Wishlist
             (ID INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
             userID INTEGER NOT NULL,
             productID INTEGER NOT NULL,
             date_added TEXT DEFAULT (date()) NOT NULL,
             FOREIGN KEY(userID) REFERENCES User(ID),
             FOREIGN KEY(productID) REFERENCES Product(ID));
             """
    private static var insertIntoWishlistTable = """
             INSERT INTO Wishlist ( userID, productID, date_added )
             VALUES ( 1, 1, '2022-03-29' ),
                    ( 1, 2, '2022-03-28' );
             """
    static var wishlistTableScripts = [dropWishlistTable, createWishlistTable, insertIntoWishlistTable]
    
    
    
    private static var dropShoppingCartTable = "DROP TABLE IF EXISTS ShoppingCart;"
    private static var createShoppingCartTable = """
             CREATE TABLE IF NOT EXISTS ShoppingCart
             (ID INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
             userID INTEGER NOT NULL,
             productID INTEGER NOT NULL,
             date_added TEXT DEFAULT (date()) NOT NULL,
             FOREIGN KEY(userID) REFERENCES User(ID),
             FOREIGN KEY(productID) REFERENCES Product(ID));
             """
    private static var insertIntoShoppingCartTable = """
             INSERT INTO ShoppingCart ( userID, productID, date_added )
             VALUES ( 1, 1, '2022-03-29' ),
                    ( 1, 2, '2022-03-28' );
             """
    static var shoppingCartTableScripts = [dropShoppingCartTable, createShoppingCartTable, insertIntoShoppingCartTable]
    
    
    
    private static var dropPurchaseOrderTable = "DROP TABLE IF EXISTS PurchaseOrder;"
    private static var createPurchaseOrderTable = """
             CREATE TABLE IF NOT EXISTS PurchaseOrder
             (ID INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
             userID INTEGER NOT NULL,
             paymentType TEXT NOT NULL,
             date_purchased TEXT DEFAULT (date()) NOT NULL,
             FOREIGN KEY(userID) REFERENCES User(ID));
             """
    private static var insertIntoPurchaseOrderTable = """
             INSERT INTO Wishlist ( userID, productID, date_added )
             VALUES ( 1, 1, '2022-03-29' ),
                    ( 1, 2, '2022-03-28' );
             """
    static var purchaseOrderTableScripts = [dropPurchaseOrderTable, createPurchaseOrderTable, insertIntoPurchaseOrderTable]
    
    
    
    private static var dropOrderItemTable = "DROP TABLE IF EXISTS OrderItem;"
    private static var createOrderItemTable = """
             CREATE TABLE IF NOT EXISTS OrderItem
             (ID INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
             purchaseOrderID INTEGER NOT NULL,
             productID INTEGER NOT NULL,
             purchasePrice DECIMAL(10,3) NOT NULL,
             FOREIGN KEY(purchaseOrderID) REFERENCES PurchaseOrder(ID),
             FOREIGN KEY(productID) REFERENCES Product(ID));
             """
    private static var insertIntoOrderItemTable = """
             INSERT INTO OrderItem ( purchaseOrderID, productID, purchasePrice )
             VALUES ( 1, 1, 10.23 ),
                    ( 1, 2, 25.60 );
             """
    static var orderItemTableScripts = [dropOrderItemTable, createOrderItemTable, insertIntoOrderItemTable]
}