//
//  SocioBoxSwiftUIApp.swift
//  SocioBoxSwiftUI
//
//  Created by Edwin Odesseiron on 3/2/21.
//

import SwiftUI

@main
struct SocioBoxSwiftUIApp: App {
	
	private let diContainer = DIContainer();
	
    var body: some Scene {
        WindowGroup {
		MainScreenView()
        }
    }
}
