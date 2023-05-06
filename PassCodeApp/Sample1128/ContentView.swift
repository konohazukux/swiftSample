//
//  ContentView.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/04/20.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProductViewModel()

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText)
                List {
                    ForEach(viewModel.products, id: \.id) { product in
                        if let idx = viewModel.products.firstIndex(where: { $0.id == product.id }) {
                            let bindingProduct = $viewModel.products[idx]
                            NavigationLink(destination: ProductEditView(product: bindingProduct, viewModel: viewModel)) {
                                VStack(alignment: .leading) {
                                    Text(product.name)
                                        .font(.headline)
                                    Text(product.code)
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
