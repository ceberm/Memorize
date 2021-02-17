//
//  Grid.swift
//  Memorize
//
//  Created by Cesar on 11/26/20.
//

import SwiftUI

struct Grid<Item,ItemView>: View where Item: Identifiable, ItemView: View{
    //Identifiable and View are protocols used to constrain the dont cares or generics to work
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items){ item in
            self.body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)!
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
    
}
