//
//  ContentView.swift
//  PEInfo
//
//  Created by Venti on 05/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State var currentFile: URL?
    @State var peFile: PEFile?
    @State var coffFileHeader: COFFFileHeader?
    var body: some View {
        VStack{
            Button("Open File") {
                let panel = NSOpenPanel()
                panel.canChooseFiles = true
                panel.canChooseDirectories = false
                panel.allowsMultipleSelection = false
                panel.allowedFileTypes = ["exe", "dll"]
                panel.begin { result in
                    if result == .OK {
                        currentFile = panel.url
                        loadFile()
                    }
                }
            }
            if let file = currentFile {
                Text(file.path)
            }
        }
        TabView {
            PEOverView(peFile: $peFile, coffHeader: $coffFileHeader)
                .tabItem {
                    Text("Overview")
                }
            // If the file have a Resource Section, show the Resource View
            if peFile?.resourceSection != nil {
                ResourcesView(peFile: $peFile)
                    .tabItem {
                        Text("Resource")
                    }
            }
        }
    }
    func loadFile() {
        guard let file = currentFile else { return }
        do {
            let data = try Data(contentsOf: file)
            peFile = try PEFile(data: data)
            coffFileHeader = try COFFFileHeader(data: data)
        } catch {
            print(error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
