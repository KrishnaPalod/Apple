//
//  ContentView.swift
//  srm
//
//  Created by krishna  on 13/09/2023.
//

import SwiftUI

//node1
struct Product: Identifiable{
    let id = UUID()
    let name: String
    let price: Double
    let imageName: String
}
let sampleProducts = [
    Product(name: "Macboook M2",price: 900.99 ,imageName: "mac m2"),
    Product(name: "Iphone 14",price: 700.99 ,imageName: "iphone 14"),
    Product(name: "Ipad",price: 400.99 ,imageName: "iPad"),
    Product(name: "Iwatch",price: 700.99 ,imageName: "iwatch"),
    
]
struct ProductTile: View{
    let product: Product
    
    var body: some View{
        
        
        VStack(alignment: .leading, spacing: 12){
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 120, maxHeight: 120)
            Text(product.name)
                .font(.headline)
            Text("$\(String(format: "%.2f", product.price))")
                .font(.subheadline)
                .foregroundColor(.secondary)
                
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 4, x: 0, y: 0)
        
    }
    
}
struct ContentView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 100,
                           maximum: 200), spacing: 15),
        
        GridItem(.flexible(minimum: 100,
                            maximum: 200), spacing: 15),
        //.padding(20)
    ]
       
    
    var body: some View {
        ZStack {
            Color(red: 0.8745098114013672, green: 0.8392156958580017, blue: 0.7960784435272217)
            //illustration-of-embossed-a...
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 393, height: 262)
                .clipped()
            NavigationView{
                ScrollView{
                   
                
                        LazyVGrid(columns: columns){
                            ForEach(sampleProducts)
                            {Product in
                                NavigationLink {
                                    ProductDetail(product: Product)
                                } label: {
                                    ProductTile(product: Product)
                                    
                                    
                                }
                                
                            }
                        
                    }
                   
                   
                }
                
                .navigationTitle("Apple Store")
                .background(Color(red: 0.8745098114013672, green: 0.8392156958580017, blue: 0.7960784435272217))
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ProductDetail: View{
    
    let product: Product
    
    var body: some View{
        VStack{
            Image(product.imageName)
                .resizable()

            .aspectRatio(contentMode: .fit)
            .frame(height: 300)
            Text(product.name)
                .font(.title)
                .padding()
            
            Text("Price : S\(String(format: "%.2f", product.price))")
                .   font(.headline)
                .padding()
            
            Spacer()
        }
    }
}
