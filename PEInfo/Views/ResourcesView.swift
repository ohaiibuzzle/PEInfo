//
//  ResourcesView.swift
//  PEInfo
//
//  Created by Venti on 05/04/2023.
//

import SwiftUI

struct ResourcesView: View {
    @Binding var peFile: PEFile?
    var body: some View {
        VStack {
            ScrollView {
//                Group {
//                    Text ("Root Resource Directory Table")
//                        .font(.title)
//                    Text("NumberOfNamedEntries: \(String(peFile?.resourceSection?.rootDirectoryTable.numberOfNamedEntries ?? 0, radix: 16))")
//                    Text("NumberOfIdEntries: \(String(peFile?.resourceSection?.rootDirectoryTable.numberOfIdEntries ?? 0, radix: 16))")
//                }
                ForEach(peFile?.resourceSection?.rootDirectoryTable.subtables ?? []) { subtables in
                    SubtablesView(subtables: subtables)                
                }
            }
        }
    }
}

struct SubtablesView: View {
    var subtables: ResourceDirectoryTable
    var body: some View {
//        Group {
//            Text("Name: \(subtables.id)")
//            Text("NumberOfNamedEntries: \(String(subtables.numberOfNamedEntries, radix: 16))")
//            Text("NumberOfIdEntries: \(String(subtables.numberOfIdEntries, radix: 16))")
//        }
        ForEach(subtables.subtables) { subtables in
            SubtablesView(subtables: subtables)
        }
        ForEach(subtables.entries) { entry in
            Group {
                Text("Name: \(entry.name)")
                Text("DataRVA: \(String(entry.dataRVA, radix: 16))")
                Text("DataSize: \(String(entry.size, radix: 16))")
            }
        }
    }
}

//struct NameResourceDirView: View {
//    var nameResourceDirectoryTable: NameResourceDirectoryTable
//    var body: some View {
//        Group {
//            Text("Name: \(nameResourceDirectoryTable.name)")
//            Text("NumberOfNamedEntries: \(String(nameResourceDirectoryTable.numberOfNamedEntries, radix: 16))")
//            Text("NumberOfIdEntries: \(String(nameResourceDirectoryTable.numberOfIdEntries, radix: 16))")
//        }
//        ForEach(nameResourceDirectoryTable.languageResourceDirectoryTables ) { languageResourceDirectoryTable in
//            LanguageResourceDirView(languageResourceDirectoryTable: languageResourceDirectoryTable)
//        }
//    }
//}

//struct LanguageResourceDirView: View {
//    var languageResourceDirectoryTable: LanguageResourceDirectoryTable
//    var body: some View {
//        Group {
//            Text("Name: \(languageResourceDirectoryTable.name)")
//            Text("NumberOfNamedEntries: \(String(languageResourceDirectoryTable.numberOfNamedEntries, radix: 16))")
//            Text("NumberOfIdEntries: \(String(languageResourceDirectoryTable.numberOfIdEntries, radix: 16))")
//        }
//        ForEach(languageResourceDirectoryTable.entries ) { dataEntry in
//            Group {
//                Text("OffsetToData: \(String(dataEntry.offsetToData, radix: 16))")
//                Text("ID: \(String(dataEntry.id, radix: 16))")
//                Text("Name: \(dataEntry.name)")
//            }
//        }
//    }
//}

