//
//  ProductEditView.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/05/06.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import SwiftUI

struct ProductEditView: View {
    @Binding var product: Product

    var body: some View {
        Form {
            TextField("Product Name", text: $product.name)
            TextField("Product Code", text: $product.code)
        }
        .navigationBarTitle("Edit Product", displayMode: .inline)
    }
}
