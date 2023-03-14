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

/// The splash screen shown at the beginning of the onboarding flow.
struct OnboardingSplashScreen: View {
    // MARK: - Properties
    
    // MARK: Private
    
    @Environment(\.theme) private var theme
    
    // MARK: Public
    
    @ObservedObject var viewModel: OnboardingSplashScreenViewModel.Context
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Spacer()
                    .frame(height: OnboardingMetrics.spacerHeight(in: geometry))
                OnboardingSplashScreenPage(content: viewModel.viewState.content)
                    .frame(width: geometry.size.width)
                Spacer()
                Button { viewModel.send(viewAction: .login) } label: {
                    Text(VectorL10n.authLogin)
                        .font(theme.fonts.body)
                        .padding(6)
                }
                .buttonStyle(PrimaryActionButtonStyle(customColor: Color.blue))
                .padding(.horizontal, 16)
                Spacer()
                    .frame(height: 50)
            }
            .frame(maxHeight: .infinity)
            .navigationBarHidden(true)
        }
        .background(viewModel.viewState.background.ignoresSafeArea())
        .track(screen: .welcome)
    }
}

// MARK: - Previews

struct OnboardingSplashScreen_Previews: PreviewProvider {
    static let stateRenderer = MockOnboardingSplashScreenScreenState.stateRenderer
    static var previews: some View {
        stateRenderer.screenGroup()
    }
}
