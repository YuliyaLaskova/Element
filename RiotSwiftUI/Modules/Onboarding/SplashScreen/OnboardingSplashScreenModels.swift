//
// Copyright 2021 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import SwiftUI

// MARK: - Coordinator

/// The content displayed in a single splash screen page.
struct OnboardingSplashScreenPageContent {
    let title: String
    let message: String
    let image: ImageAsset
    let darkImage: ImageAsset
}

// MARK: View model

enum OnboardingSplashScreenViewModelResult {
    case register
    case login
}

// MARK: View
// julia редизайн главного экрана 
struct OnboardingSplashScreenViewState: BindableState, CustomDebugStringConvertible {
    
    /// An array containing all content of the carousel pages
    let content: OnboardingSplashScreenPageContent
    var bindings: OnboardingSplashScreenBindings
    
    /// Custom debug description to reduce noise in the logs.
    var debugDescription: String {
        "OnboardingSplashScreenViewState at main page ."
    }
    
    /// The background gradient for all 4 pages and the hidden page at the start of the carousel.
    var background: Color {
//        Color("mainBlue")
        return Color(red: 0.063, green: 0.059, blue: 0.706)    }
    
    init() {
        // The pun doesn't translate, so we only use it for English.
        let locale = Locale.current
        let page4Title = locale.identifier.hasPrefix("en") ? "Cut the slack from teams." : VectorL10n.onboardingSplashPage4TitleNoPun
        
        content =
            OnboardingSplashScreenPageContent(title: "",
                                              message: VectorL10n.onboardingSplashPage1Title,
                                              image: Asset.Images.logoCvaTechnologies,
                                              darkImage: Asset.Images.logoCvaTechnologies)
        
        bindings = OnboardingSplashScreenBindings()
    }
}

struct OnboardingSplashScreenBindings {
}

enum OnboardingSplashScreenViewAction {
    case login
}
