//
//  ContentView.swift
//  LMTestProject
//
//  Created by Егор Яковин on 27.04.2021.
//

import SwiftUI

struct product : Identifiable {
    var id : Int
    let productName, price, productImage : String
}

struct ContentView: View {
    @State var selected = 0
    @State var searchItem: String = ""
    @State var time = Timer.publish(every: 0.1, on: .current, in: .tracking).autoconnect()
    @State var show = false
    
    //TODO: add database
    let products: [product] = [
        .init(id: 0, productName: "Ламинат", price: "1500 р/кор.", productImage: "ImageExample1"),
        .init(id: 1, productName: "Обои", price: "1000 р/шт.", productImage: "ImageExample2"),
        .init(id: 2, productName: "Стеллаж", price: "2000 р/шт.", productImage: "ImageExample3"),
        .init(id: 3, productName: "Кашпо", price: "1350 р/шт.", productImage: "ImageExample4"),
        .init(id: 4, productName: "Грунтовка", price: "700 р/шт.", productImage: "ImageExample5"),
        .init(id: 5, productName: "Салфетки из микрофибры", price: "70 р/шт.", productImage: "ImageExample6"),
        .init(id: 6, productName: "Бетоносмеситель", price: "15000 р/шт.", productImage: "ImageExample7"),
        .init(id: 7, productName: "Очиститель стекол", price: "120 р/шт.", productImage: "ImageExample8"),
        
    ]
    
    var body: some View {
        
        ZStack{
            
            VStack(spacing: 0) {
                
                ScrollView{
                    
                    VStack{
                        GeometryReader{g in
                            VStack(alignment: .leading) {
                                
                                Text ("Поиск товаров")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.leading)
                                    .font(.largeTitle)
                                HStack {
                                    Spacer()
                                    TextField("   Поиск", text:$searchItem)
                                        .padding(.vertical, 14)
                                        .background(Color(.white))
                                        .cornerRadius(8)
                                        .overlay(
                                            HStack {
                                                Spacer()
                                                Image(systemName: "magnifyingglass")
                                                    .padding(.vertical, 12.5)
                                                    .padding(.horizontal, 16)
                                                    .background(Color("LMColor"))
                                                    .cornerRadius(8)
                                                    .padding(.trailing, 3)
                                            })
                                    Spacer()
                                    Image(systemName: "barcode")
                                        .padding(.all, 17)
                                        .background(Color(.white))
                                        .cornerRadius(6)
                                    Spacer()
                                }
                            }
                            .padding(.vertical)
                            
                            .onReceive(self.time) { (_) in
                                
                                let y = g.frame(in: .global).minY
                                
                                if -y > (UIScreen.main.bounds.height / 7) - 20 {
                                    withAnimation{
                                        self.show = true
                                    }
                                }
                                else {
                                    withAnimation{
                                        self.show = false
                                    }
                                }
                            }
                        }
                    }
                    .frame(height: UIScreen.main.bounds.height / 7)
                    
                    VStack(alignment: .leading){
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 15){
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color("LMColor"))
                                    .frame(width: 150, height: 150)
                                    .overlay(
                                        VStack{
                                            HStack{
                                                Text("Каталог")
                                                    .fontWeight(.bold)
                                                    .padding(.all, 15)
                                                    .foregroundColor(.white)
                                                Spacer()
                                            }
                                            Spacer()
                                            HStack{
                                                Spacer()
                                                Image(systemName: "list.dash")
                                                    .padding(.all, 30)
                                                    .scaleEffect(3)
                                                    .foregroundColor(.white)
                                            }
                                            
                                        })
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color(.systemGray5))
                                    .frame(width: 150, height: 150)
                                    .overlay(
                                        VStack{
                                            HStack{
                                                Text("Стройматериалы")
                                                    .fontWeight(.regular)
                                                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 0))
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                            HStack{
                                                Spacer()
                                                Image("ImageExample1.1")
                                                    //обрезать контур изображения
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                            }
                                            
                                        })
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color(.systemGray5))
                                    .frame(width: 150, height: 150)
                                    .overlay(
                                        VStack{
                                            HStack{
                                                Text("Сад")
                                                    .fontWeight(.regular)
                                                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 0))
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                            HStack{
                                                Spacer()
                                                Image("ImageExample1.2")
                                                    //обрезать контур изображения
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                            }
                                            
                                        })
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color(.systemGray5))
                                    .frame(width: 150, height: 150)
                                    .overlay(
                                        VStack{
                                            HStack{
                                                Text("Электроинструменты")
                                                    .fontWeight(.regular)
                                                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 0))
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                            HStack{
                                                Spacer()
                                                Image("ImageExample1.3")
                                                    //обрезать контур изображения
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                            }
                                            
                                        })
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color(.systemGray5))
                                    .frame(width: 150, height: 150)
                                    .overlay(
                                        VStack{
                                            HStack{
                                                Text("Сантехника")
                                                    .fontWeight(.regular)
                                                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 0))
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                            HStack{
                                                Spacer()
                                                Image("ImageExample1.4")
                                                    //обрезать контур изображения
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                            }
                                            
                                        })
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color(.systemGray5))
                                    .frame(width: 150, height: 150)
                                    .overlay(
                                        VStack{
                                            HStack{
                                                Text("Освещение")
                                                    .fontWeight(.regular)
                                                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 0))
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                            HStack{
                                                Spacer()
                                                Image("ImageExample1.5")
                                                    //обрезать контур изображения
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                            }
                                            
                                        })
                                
                            }.padding(EdgeInsets(top: 30, leading: 15, bottom: 0, trailing: 0))
                        }
                        
                        Text("Предложение ограничено").padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 0))
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 15){
                                ForEach(products) {product in
                                    Button(action: {
                                        //TODO: add action
                                    })
                                    {
                                        VStack(alignment: .leading){
                                            Image(product.productImage).resizable()
                                                .frame(width: 150, height: 150, alignment: .center)
                                            Text(product.price).padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                                                .foregroundColor(.black)
                                            Text(product.productName)
                                                .frame(width: 150, alignment: .leading).lineLimit(2)
                                                .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                                                .foregroundColor(.black)
                                        }}
                                }
                                
                            }.padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                        }
                        
                        Text("Лучшая цена").padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 0))
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 15){
                                ForEach(products) {product in
                                    Button(action: {
                                        //TODO: add action
                                    })
                                    {
                                        VStack(alignment: .leading){
                                            Image(product.productImage).resizable()
                                                .frame(width: 150, height: 150, alignment: .center)
                                            Text(product.price).padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                                                .foregroundColor(.black)
                                            Text(product.productName)
                                                .frame(width: 150, alignment: .leading).lineLimit(2)
                                                .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                                                .foregroundColor(.black)
                                        }}
                                }
                                
                            }.padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                        }
                    }.background(Color(.white))
                    
                    
                }.background(Color("LMColor").edgesIgnoringSafeArea(.top))
                
                
                
                Divider()
                //TODO: add action
                HStack{
                    Button(action: {
                        self.selected = 0
                    }) {
                        VStack{
                            Image(systemName: "magnifyingglass")
                            Text("Main")
                                .font(.footnote)}.padding()
                    }.foregroundColor(self.selected == 0 ? .green : .gray)
                    
                    Spacer()
                    
                    Button(action: {
                        self.selected = 1
                    }) {
                        VStack{
                            Image(systemName: "bookmark")
                                .frame(width: nil)
                            Text("Favorite")
                                .font(.footnote)}.padding()
                    }.foregroundColor(self.selected == 1 ? .green : .gray)
                    
                    Spacer()
                    
                    Button(action: {
                        self.selected = 2
                    }) {
                        VStack{
                            Image(systemName: "house")
                            Text("Shops")
                                .font(.footnote)}.padding()
                    }.foregroundColor(self.selected == 2 ? .green : .gray)
                    
                    Spacer()
                    
                    Button(action: {
                        self.selected = 3
                    }) {
                        VStack{
                            Image(systemName: "person")
                            Text("Profile")
                                .font(.footnote)}.padding()
                    }.foregroundColor(self.selected == 3 ? .green : .gray)
                    
                    Spacer()
                    
                    Button(action: {
                        self.selected = 4
                    }) {
                        VStack{
                            Image(systemName: "cart")
                            Text("Cart")
                                .font(.footnote)}.padding()
                    }.foregroundColor(self.selected == 4 ? .green : .gray)
                }
                .frame(height: 40.0)
                .padding(.top, 5)
                
                
                
            }
            
            if self.show{
                TopView()
                
            }}
    }
}
struct TopView : View {
    @State var searchItem: String = ""
    var body: some View{
        VStack(spacing: 0){
            TextField("Поиск", text:$searchItem)
                .padding()
                .background(Color(.white).edgesIgnoringSafeArea(.top))
            Divider()
                .shadow(radius: 500)
            Spacer()
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
