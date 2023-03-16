//
// Copyright 2022 New Vector Ltd
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

import Foundation

/// Information about a homeserver that is ready for display in the authentication flow.
struct AuthenticationHomeserverViewData: Equatable {
    /// The homeserver string to be shown to the user.
    let address: String
    /// Whether or not to display the username and password text fields during login.
    let showLoginForm: Bool
    /// Whether or not to display the username and password text fields during registration.
    let showRegistrationForm: Bool
    /// Whether or not to display the QR login button during login.
    let showQRLogin: Bool
}

// MARK: - Mocks

// julia убрана логика для кнопок авторизации SSO провайдеров

extension AuthenticationHomeserverViewData {
    /// A mock homeserver that is configured just like matrix.org.
    static var mockMatrixDotOrg: AuthenticationHomeserverViewData {
        AuthenticationHomeserverViewData(address: "matrix.org",
                                         showLoginForm: true,
                                         showRegistrationForm: true,
                                         showQRLogin: false)
    }
    
    /// A mock homeserver that supports login and registration via a password but has no SSO providers.
    static var mockBasicServer: AuthenticationHomeserverViewData {
        AuthenticationHomeserverViewData(address: "example.com",
                                         showLoginForm: true,
                                         showRegistrationForm: true,
                                         showQRLogin: false)
    }

    /// A mock homeserver that supports only supports authentication via fallback.
    static var mockFallback: AuthenticationHomeserverViewData {
        AuthenticationHomeserverViewData(address: "company.com",
                                         showLoginForm: false,
                                         showRegistrationForm: false,
                                         showQRLogin: false)
    }
}
