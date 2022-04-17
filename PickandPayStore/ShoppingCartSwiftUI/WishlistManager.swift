//
//  WishlistManager.swift
//  PickandPayStore
//
//  Created by admin on 4/12/22.
//

import SwiftUI

class WishlistManager {
    @Published private(set) var udWishlist: [String] = UserDefaults.standard.object(forKey: "Wishlist") as? [String] ?? []
    
    static let sharedWishlist = WishlistManager()
    
    private init(){}
    
    func addToWishlist(productName: String){
        udWishlist.append(productName)
        UserDefaults.standard.set(udWishlist, forKey: "Wishlist")
    }
    
    func removeFromWishlist(productName: String){
        udWishlist.removeAll{ $0 == productName }
        UserDefaults.standard.set(udWishlist, forKey: "Wishlist")
    }
    
    func getCount() -> Int{
        return udWishlist.count
    }
    
    func getWishlist() -> [String]{
        //udWishlist = UserDefaults.standard.object(forKey: "Wishlist") as? [String] ?? []
        return udWishlist
    }
}



