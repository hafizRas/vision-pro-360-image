//
//  ImmersiveView.swift
//  fullVP
//
//  Created by Mohd Hafiz on 22/02/2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            let rootEntity = Entity()
            rootEntity.addSkyboxImage()
            content.add(rootEntity)
        }
        .transition(.opacity)
    }
}

extension Entity {
    func addSkyboxImage() {
        // load texture from xcassets
        guard let texture = try? TextureResource.load(named: "blue_beach") else {
            print("Texture not loaded!")
            return
        }
        var material = UnlitMaterial() // Material without influence of lightning
        material.color = .init(texture: .init(texture))
        
        // generate a sphere make it big so it fills out your whole vision in this example it has the size 1E3 (1* 10^3)
        // add the material to the entity
        self.components.set(ModelComponent(
            mesh: .generateSphere(radius: 1E3),
            materials: [material])
        )
        
        self.scale *= .init(x: -1, y: 1, z: 1)
        self.transform.translation += SIMD3<Float>(0.0, 1.0, 0.0)
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
