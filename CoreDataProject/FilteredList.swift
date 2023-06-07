//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Uriel Ortega on 05/06/23.
//

import CoreData
import SwiftUI

enum PredicateOperator: String {
    case beginsWith = "BEGINSWITH"
    case endsWith = "ENDSWITH"
    case contains = "CONTAINS"
    case equals = "=="
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterPredicate: PredicateOperator.RawValue, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(
            sortDescriptors: [],
            predicate: NSPredicate(format: "%K \(filterPredicate) %@", filterKey, filterValue)
        )
        self.content = content
    }
}
