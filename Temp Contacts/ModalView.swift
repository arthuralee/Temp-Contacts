//
//  ModalView.swift
//  Temp Contacts
//
//  Created by Arthur Lee on 5/20/20.
//  Copyright © 2020 Skies Lab. All rights reserved.
//

import SwiftUI

// based on https://stackoverflow.com/questions/56615408/prevent-dismissal-of-modal-view-controller-in-swiftui

struct ModalView<T: View>: UIViewControllerRepresentable {
    let view: T

    func makeUIViewController(context: Context) -> UIHostingController<T> {
        UIHostingController(rootView: view)
    }

    func updateUIViewController(_ uiViewController: UIHostingController<T>, context: Context) {
        uiViewController.parent?.presentationController?.delegate = context.coordinator
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIAdaptivePresentationControllerDelegate {
        let modalView: ModalView

        init(_ modalView: ModalView) {
            self.modalView = modalView
        }

        func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
            return false
        }
    }
}

extension View {
    func disableSwipeDown() -> some View {
        ModalView(view: self)
    }
}
