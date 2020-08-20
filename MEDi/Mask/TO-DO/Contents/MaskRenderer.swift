//
//  MaskRenderer.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/30.
//  Copyright © 2020 MEDi. All rights reserved.
//

import ARKit
import SceneKit

extension SCNReferenceNode{
    convenience init(named resourceName: String, loadImmediately: Bool = true) {
        let url = Bundle.main.url(forResource: resourceName, withExtension: "scn", subdirectory: "Models.scnassets")!
        self.init(url: url)!
        if loadImmediately {
            self.load()
        }
    }
}

class MaskRenderer: NSObject, VirtualContentController{
    var contentNode: SCNNode?
    var occlusionNode: SCNNode!
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let sceneView = renderer as? ARSCNView,
        anchor is ARFaceAnchor else{
            return nil
        }
        
        print("face detected")
        let faceGeometry = ARSCNFaceGeometry(device: sceneView.device!)!
        faceGeometry.firstMaterial!.colorBufferWriteMask = []
        occlusionNode = SCNNode(geometry: faceGeometry)
        occlusionNode.renderingOrder = -1
        
        let faceOverlayContent = SCNReferenceNode(named: "mask")
        
        contentNode = SCNNode()
        contentNode!.addChildNode(occlusionNode)
        contentNode!.addChildNode(faceOverlayContent)
        
        return contentNode
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceGeometry = occlusionNode.geometry as? ARSCNFaceGeometry,
        let faceAnchor = anchor as? ARFaceAnchor
                
        else{
            return
        }
        
        print("face detected")

        faceGeometry.update(from: faceAnchor.geometry)
    }
}
