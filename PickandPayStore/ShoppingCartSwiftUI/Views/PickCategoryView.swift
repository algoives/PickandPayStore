//
//  PickCategoryView.swift
//  PickandPayStore
//
//  Created by costin popescu on 4/5/22.
//

import SwiftUI
import MapKit

struct PickCategoryView: View {
    
    //State variables for searchbar
    @State var searchText = ""
    @State var searching = false
    @State var pastSearches = [String]()
    
    // State variables for side menu.
    @State var showMenu = false
    
    //State variable for cart button
    @State var numberInCart = 0
    // Observable objects.
    @StateObject var productsManager: ProductsManager = ProductsManager()
   
    
    var body: some View {
        
        NavigationView {
            ZStack{
                
                if showMenu {
                    SideMenuView(isShowing: $showMenu)
                }
                ScrollView{
                    ZStack {
                       
                        VStack{
                                //Create search bar at top of Vstack
                                SearchBar(searchText: $searchText, searching: $searching, pastSearches: $pastSearches)

                                ForEach(productsManager.categories.filter({ (category: Category) -> Bool in
                                    return category.name.lowercased().hasPrefix(searchText.lowercased()) || searchText == ""
                                }), id: \.id){ category in
                                    NavigationLink(destination: CategoryContentView(numberInCart: $numberInCart, category: category, productsList: productsManager.getProductsOfCategory(category: category.id))
                                            .environmentObject(productsManager))
                                        {
                                            CategoryCard(category: category)
                                                
                                    }
                            }
                            .padding()
                        }
                            .toolbar{
                                ToolbarItem {
                                    if searching {
                                        Button("Cancel Search"){
                                            searchText = ""
                                            withAnimation{
                                                searching = false
                                                UIApplication.shared.dismissKeyboard()
                                            }
                                        }
                                        .foregroundColor(.black)
                                        .padding()
                                    }
                                    
                                    //Navigate to the CartView
                                    NavigationLink {
                                        // This is the destination.
                                        CartView()
                                            
                                    } label: {
                                        //On CartButton click go to CartView.
                                        CartButton(numberInCart: $numberInCart)
                                    }
                                    
                                }
                                ToolbarItem(placement: .navigationBarLeading){
                                    
                                    MenuButton(isOpen: $showMenu).onTapGesture {
                                        withAnimation(.spring())
                                        {
                                            showMenu.toggle()
                                        }
                                    }
                                }
                        }
                        .navigationTitle(Text("Categories"))
                    }
                }
                .offset(x: showMenu ? 200 : 0, y: 0)
            }
            .onAppear(){
                showMenu = false
                numberInCart = CartManager.sharedCart.products.count
            }
        }
    }
}

struct PickCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        PickCategoryView()
    }
}

