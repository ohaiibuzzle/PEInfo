//
//  PEOverView.swift
//  PEInfo
//
//  Created by Venti on 05/04/2023.
//

import SwiftUI

struct PEOverView: View {
    @Binding var peFile: PEFile?
    @Binding var coffHeader: COFFFileHeader?
    var body: some View {
        VStack {
            ScrollView {
                // COFF Header Info
                Group {
                    Text("COFF Header")
                        .font(.title)
                    // Print as hex string
                    Text("Machine: \(String(coffHeader?.machine ?? 0, radix: 16))")
                    Text("NumberOfSections: \(coffHeader?.numberOfSections ?? 0)")
                    Text("TimeDateStamp: \(coffHeader?.timeDateStamp ?? 0)")
                    Text("PointerToSymbolTable: \(coffHeader?.pointerToSymbolTable ?? 0)")
                    Text("NumberOfSymbols: \(coffHeader?.numberOfSymbols ?? 0)")
                    Text("SizeOfOptionalHeader: \(coffHeader?.sizeOfOptionalHeader ?? 0)")
                    Text("Characteristics: \(coffHeader?.characteristics ?? 0)")
                }
                // Section Info
                Text("Sections")
                    .font(.title)
                ForEach(coffHeader?.sectionTable.sections ?? []) { section in
                    Group{
                        Text("Name: \(section.name)")
                        Text("VirtualSize: \(String(section.virtualSize, radix: 16))")
                        Text("VirtualAddress: \(String(section.virtualAddress, radix: 16))")
                        Text("SizeOfRawData: \(String(section.sizeOfRawData, radix: 16))")
                        Text("PointerToRawData: \(String(section.pointerToRawData, radix: 16))")
                        Text("PointerToRelocations: \(String(section.pointerToRelocations, radix: 16))")
                        Text("PointerToLinenumbers: \(String(section.pointerToLineNumbers, radix: 16))")
                        Text("NumberOfRelocations: \(String(section.numberOfRelocations, radix: 16))")
                        Text("NumberOfLinenumbers: \(String(section.numberOfLineNumbers, radix: 16))")
                        Text("Characteristics: \(String(section.characteristics, radix: 16))")
                    }
                }
                // Optional Header Info
                if let optionalHeader = peFile?.coffFileHeader.optionalHeader {
                    Group {
                        Text("Optional Header")
                            .font(.title)
                            Group{
                        Text("Magic: \(String(optionalHeader.magic, radix: 16))")
                        Text("MajorLinkerVersion: \(String(optionalHeader.majorLinkerVersion, radix: 16))")
                        Text("MinorLinkerVersion: \(String(optionalHeader.minorLinkerVersion, radix: 16))")
                        Text("AddressOfEntryPoint: \(String(optionalHeader.addressOfEntryPoint, radix: 16))")
                        Text("BaseOfCode: \(String(optionalHeader.baseOfCode, radix: 16))")
                        Text("BaseOfData: \(String(optionalHeader.baseOfData, radix: 16))")
                        Text("SectionAlignment: \(String(optionalHeader.sectionAlignment, radix: 16))")
                        Text("FileAlignment: \(String(optionalHeader.fileAlignment, radix: 16))")
                        Text("MajorOperatingSystemVersion: \(String(optionalHeader.majorOperatingSystemVersion, radix: 16))")
                        Text("MinorOperatingSystemVersion: \(String(optionalHeader.minorOperatingSystemVersion, radix: 16))")
                            }
                    }
                }
            }
        }
    }
}
