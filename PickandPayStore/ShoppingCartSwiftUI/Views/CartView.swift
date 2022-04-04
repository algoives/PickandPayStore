//
//  CartView.swift
//  PickandPayStore
//
//  Created by costin popescu on 3/31/22.
//

import SwiftUI

struct CartView: View {
    
    // Environment object modifier of CartManager type.
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        
        ScrollView {
            
            if cartManager.products.count > 0
            {
                ForEach(cartManager.products, id: \.id){
                    product in
                    ProductInCart(product: product)
                }
                
                HStack {
                    Text("Your cart total is")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                }
                .padding()
            }
            else
            {
                Text("Your cart is empty")
            }
            
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}