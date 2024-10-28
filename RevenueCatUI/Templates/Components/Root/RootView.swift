//
//  Copyright RevenueCat Inc. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  RootView.swift
//
//  Created by Jay Shortway on 24/10/2024.

import Foundation
import RevenueCat
import SwiftUI

#if PAYWALL_COMPONENTS

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
struct RootView: View {
    private let viewModel: RootViewModel
    private let onDismiss: () -> Void

    internal init(viewModel: RootViewModel, onDismiss: @escaping () -> Void) {
        self.viewModel = viewModel
        self.onDismiss = onDismiss
    }

    var body: some View {
        ScrollView {
            StackComponentView(viewModel: viewModel.stackViewModel, onDismiss: onDismiss)
        }.applyIfLet(viewModel.stickyFooterViewModel) { stackView, stickyFooterViewModel in
            stackView.safeAreaInset(edge: .bottom) {
                StackComponentView(viewModel: stickyFooterViewModel.stackViewModel, onDismiss: onDismiss)
            }

        }
    }

}

#endif