//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Uriel Ortega on 05/06/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    // @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    @FetchRequest(sortDescriptors: []) var candies: FetchedResults<Candy>
    
    @State private var filterKey = "name"
    @State private var filterPredicate: PredicateOperator = .beginsWith
    @State private var filterValue = "T"
    
    var body: some View {
        VStack {
            List {
                Section("All candies") {
                    ForEach(candies, id: \.self) { candy in
                        Text(candy.wrappedName)
                    }
                }
            }
            
            Divider()
            
            FilteredList(filterKey: filterKey, filterPredicate: filterPredicate.rawValue, filterValue: filterValue) { (candy: Candy) in
                Text(candy.wrappedName)
            }
                        
            /* Button("Add examples") {
                let candy1 = Candy(context: moc)
                candy1.name = "Mars"
                candy1.origin = Country(context: moc)
                candy1.origin?.shortName = "UK"
                candy1.origin?.fullName = "United Kingdom"
                
                let candy2 = Candy(context: moc)
                candy2.name = "KitKat"
                candy2.origin = Country(context: moc)
                candy2.origin?.shortName = "UK"
                candy2.origin?.fullName = "United Kingdom"
                
                let candy3 = Candy(context: moc)
                candy3.name = "Twix"
                candy3.origin = Country(context: moc)
                candy3.origin?.shortName = "UK"
                candy3.origin?.fullName = "United Kingdom"
                
                let candy4 = Candy(context: moc)
                candy4.name = "Toblerone"
                candy4.origin = Country(context: moc)
                candy4.origin?.shortName = "CH"
                candy4.origin?.fullName = "Switzerland"
                
                try? moc.save()
            } */
            
            Button("Show candies that begin with 'T'") {
                filterKey = "name"
                filterPredicate = .beginsWith
                filterValue = "T"
            }
            
            Button("Show candies that contain the letter 'a'") {
                filterKey = "name"
                filterPredicate = .contains
                filterValue = "a"
            }
            
            Button("Show candies that end with 'x'") {
                filterKey = "name"
                filterPredicate = .endsWith
                filterValue = "x"
            }
            
            Button("Show candies from UK") {
                filterKey = "origin.shortName"
                filterPredicate = .equals
                filterValue = "UK"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
