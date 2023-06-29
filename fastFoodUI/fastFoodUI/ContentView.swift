//
//  ContentView.swift
//  fastFoodUI
//
//  Created by Yazan Ghunaim on 6/28/23.
//

import SwiftUI


struct FoodItem: Hashable {
    
    private var _price: Int
    private var _itemName: String
    private var _itemImageURL: String
    
    var price: Int
    {
        get {return _price}
    }
    var itemName: String {
        get {return _itemName}
    }
    var itemImageURL: String {
        get { return _itemImageURL }
    }
    
    init(_price: Int, _itemName: String, _itemImageURL: String) {
        self._price = _price
        self._itemName = _itemName
        self._itemImageURL = _itemImageURL
    }
    
    static func == (lhs: FoodItem, rhs: FoodItem) -> Bool {
        return lhs.price == rhs.price && lhs.itemName == rhs.itemName && lhs.itemImageURL == rhs.itemImageURL
    }
}

struct Main: View {
    
    var body: some View {
        
        RadialGradient(stops: [.init(color: Color(red: 0.961, green: 0.451, blue: 0.627) , location: 0.3),
                               .init(color: Color(red: 0.98, green: 0.906, blue: 0.745) , location: 0.3)],
                       center: .topLeading,
                       startRadius: 200, endRadius: 700)
        .ignoresSafeArea()
        
        VStack (spacing: 15) {
            
            Spacer()
            
            HStack {
                Image(systemName: "chevron.backward")
                    .padding(.horizontal, 30)
                    .foregroundColor(.black)
                
                Spacer()
            }
            
            HStack {
                Text("Restaurant")
                    .foregroundColor(Color(red: 0.098, green: 0.114, blue: 0.129))
                    .font(.headline.weight(.light))
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.white)
                
                Text("Takeaway")
                    .foregroundColor(Color(red: 0.098, green: 0.114, blue: 0.129))
                    .font(.headline.weight(.light))
                
                Spacer()
                
            } .padding(.horizontal)
            
            HStack {
                Text("Fast Food")
                    .font(.system(size: 40).weight(.bold))
                    .foregroundColor(.black)
                
                Spacer()
                
            } .padding(.horizontal)
            
            HStack() {
                Spacer()
                Spacer()
                
                Image("Beep Beep - Large Vehicle")
                    .resizable()
                    .frame(width: 200,height: 200)
                
                Spacer()
            }
            
            Group {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            
            Group {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
        }
    }
}

struct Tile: View {
    
    let item: FoodItem
    let color: Color
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 150, height: 200)
                .foregroundColor(color)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            
            VStack {
                VStack (spacing: 10) {
                    
                    HStack {
                        Text("\(item.itemName)")
                            .font(.title)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .minimumScaleFactor(0.5)
                            .padding(.leading)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("$\(item.price)")
                            .font(.subheadline.weight(.thin))
                            .frame(width: 40, height: 25)
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(20)
                            .padding(.leading)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Image("\(item.itemImageURL)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }.padding(.top)
                
                Spacer()
            }
            .frame(width: 150,height: 200)
        }
    }
}

struct BodyTiles: View {
    
    let items = [FoodItem(_price: 5, _itemName: "Pizza", _itemImageURL: "You are fuego - Pizza"),
                 FoodItem(_price: 2, _itemName: "Doughnut", _itemImageURL: "Happy Pride! - Donut"),
                 FoodItem(_price: 10, _itemName: "Burger", _itemImageURL:  "The Munchies - Plate")]
    
    let colors = [Color(red: 0.871, green: 0.824, blue: 0.976),
                  Color(red: 0.961, green: 0.831, blue: 0.757),
                  Color(red: 0.816, green: 0.945, blue: 0.922)]
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                HStack (spacing: 20) {
                    ForEach(items.indices, id: \.self) { index in
                        Tile(item: items[index], color: colors[index % colors.count])
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct MainPage: View {
    var body: some View {
        ZStack {
            Main()
            BodyTiles()
        }
    }
}

struct navigationTab: View {
    var body: some View {
        
        TabView {
            MainPage()
                .tabItem() {
                    Image(systemName: "house")
                    Text("home")
                }
            Color.green
                .tabItem() {
                    Image(systemName: "bag.circle.fill")
                    Text("orders")
                }
            Color.blue
                .tabItem() {
                    Image(systemName: "person.fill")
                    Text("profile")
                }
        }.accentColor(.black)
            .onAppear{
                UITabBar.appearance().unselectedItemTintColor = UIColor(.gray)
            }
    }
}

struct ContentView: View {
    var body: some View {
        navigationTab()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
