//
//  ReadingDetails.swift
//
//
//  Created by Mohamed Afifi on 2023-02-14.
//

import Localization
import NoorUI
import SwiftUI

struct ReadingDetails<Value: Hashable, ImageView: View>: View {
    // MARK: Internal

    let reading: ReadingInfo<Value>
    let imageView: ImageView
    let useAction: () -> Void
    let closeAction: () -> Void

    @ScaledMetric var cornerRadius = Dimensions.cornerRadius

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    setCurrentMushafButton
                        .padding(.top)

                    Text(reading.description)
                        .padding(.top)

                    propertiesList
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    ReadingImage(imageView: imageView)
                        .padding(.top)

                    setCurrentMushafButton
                        .padding(.top)
                }
                .padding(.horizontal)
            }
            .navigationTitle(reading.title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: setCurrentMushafBarButton,
                trailing: closeButton
            )
        }
    }

    // MARK: Private

    private var propertiesList: some View {
        VStack {
            ForEach(reading.properties, id: \.self) { property in
                HStack(alignment: .top) {
                    switch property.type {
                    case .supports:
                        Image(systemName: "checkmark.seal")
                            .foregroundColor(Color.appIdentity)
                    case .lacks:
                        Image(systemName: "xmark.seal")
                            .foregroundColor(Color.red)
                    }
                    Text(property.property)
                    Spacer()
                }
            }
        }
    }

    private var setCurrentMushafBarButton: some View {
        Button(action: useAction) {
            Text(l("reading.selector.selectMushaf.short"))
        }
    }

    private var closeButton: some View {
        Button(action: closeAction) {
            Image(systemName: "xmark.circle")
        }
        .accentColor(.label)
    }

    private var setCurrentMushafButton: some View {
        Button(action: useAction) {
            HStack {
                Spacer()
                Text(l("reading.selector.selectMushaf.long"))
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [Color.appIdentity, Color.appIdentity.opacity(0.7)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            )
        }
        .buttonStyle(.plain)
    }
}

struct ReadingDetails_Previews: PreviewProvider {
    struct Preview: View {
        // MARK: Internal

        let reading: ReadingInfo = ReadingInfoTestData.readings[0]

        var body: some View {
            ReadingDetails(
                reading: reading,
                imageView: imageView,
                useAction: {},
                closeAction: {}
            )
        }

        // MARK: Private

        private var imageView: some View {
            Image(uiImage: UIImage(contentsOfFile: testResourceURL("images/page604.png").absoluteString)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }

    // MARK: Internal

    static var previews: some View {
        Preview()
            .accentColor(.appIdentity)
    }
}
