//
//  photoImport.swift
//  Project Journal
//
//  Created by Ivianna Feimster  on 3/25/25.
//

//import SwiftUI
//
//struct photoImport: View {

//import SwiftUI
//import PhotosUI
//struct photoImport: View {
//    @State private var avatarImage: Image?
//    @State private var photosPickerItem: PhotosPickerItem?
//    
//    var body: some View {
//        NavigationStack{
//            ZStack{
//                if avatarImage == nil {
//                    Image(.sunsetbackground)
//                        .resizable()
//                        .scaledToFill()
//                } else {
//                    avatarImage?
//                        .resizable()
//                        .scaledToFill()
//                }
//            }
//            .navigationTitle("")
//            
//            .toolbar(){
//                ToolbarItem {
//                    PhotosPicker(selection: $photosPickerItem, matching: .images) {
//                        Image(systemName: "plus")
//                    }
//                    .navigationTitle("")
//                    .onChange(of: photosPickerItem) {_, newItem in
//                        Task {
//                            avatarImage = try await photosPickerItem?.loadTransferable(type: Image.self)
//                        }
//                    }
//                }
//            }
//        }
//        
////        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        
//    }
//}
//
//#Preview {
//    photoImport()
//}
