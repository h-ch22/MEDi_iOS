//
//  ARSessionController.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/29.
//  Copyright © 2020 MEDi. All rights reserved.
//

import ARKit
import SceneKit
import UIKit
import SwiftUI

class ARSessionController : UIViewController, ARSessionDelegate{
    @IBOutlet weak var sessionView: ARSCNView!
    
    var contentControllers: [VirtualContentType: VirtualContentController] = [:]
    
    var selectedVirtualContent: VirtualContentType! {
        didSet {
            guard oldValue != nil, oldValue != selectedVirtualContent
                else { return }
            
            contentControllers[oldValue]?.contentNode?.removeFromParentNode()
            
            if let anchor = currentFaceAnchor, let node = sessionView.node(for: anchor),
                let newContent = selectedContentController.renderer(sessionView, nodeFor: anchor) {
                node.addChildNode(newContent)
            }
        }
    }
    var selectedContentController: VirtualContentController {
        if let controller = contentControllers[selectedVirtualContent] {
            return controller
        } else {
            let controller = selectedVirtualContent.makeController()
            contentControllers[selectedVirtualContent] = controller
            return controller
        }
    }
    
    var currentFaceAnchor: ARFaceAnchor?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        sessionView.delegate = self
        sessionView.session.delegate = self
        sessionView.automaticallyUpdatesLighting = true
        
        selectedVirtualContent = VirtualContentType(rawValue: 0)
    }
    
    @IBSegueAction func importSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        let hostingController = UIHostingController(coder: coder, rootView: MaskTODO_1())
        hostingController!.view.backgroundColor = UIColor.clear
        
        return hostingController
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.shared.isIdleTimerDisabled = true
        
        resetTracking()
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]){
        for anchor in anchors{
            if let faceAnchor = anchor as? ARFaceAnchor{
                if !faceAnchor.isTracked{
                    print("No Face")
                    
                    let storyboard : UIStoryboard = UIStoryboard(name: "Mask_TODO", bundle: nil)
                    
                    let arnoseDetect = storyboard.instantiateViewController(withIdentifier: "NoseDetection") as! ARNoseDetection
                    
                    self.present(arnoseDetect, animated: true, completion: nil)
                }
            }
        }
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        guard error is ARError
            else{
                return
        }
        
        let errorWithInfo = error as NSError
        let messages = [
            errorWithInfo.localizedDescription,
            errorWithInfo.localizedFailureReason,
            errorWithInfo.localizedRecoverySuggestion
        ]
        
        let errorMessage = messages.compactMap({$0}).joined(separator: "\n")
        
        print(errorMessage)
        
        DispatchQueue.main.async{
            self.displayErrorMessage(title: "AR 세션 오류", message: errorMessage)
        }
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        print("AR Session interrupted")
    }
    
    func resetTracking(){
        guard ARFaceTrackingConfiguration.isSupported
            else{ return }
        
        let configuration = ARFaceTrackingConfiguration()
        configuration.isLightEstimationEnabled = true
        sessionView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func displayErrorMessage(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "세션 다시 시작", style: .default){_ in
            alertController.dismiss(animated: true, completion: nil)
            self.resetTracking()
        }
        
        alertController.addAction(restartAction)
        present(alertController, animated:true, completion: nil)
    }
}

extension ARSessionController: ARSCNViewDelegate{
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor){
        DispatchQueue.global().async{
            guard let faceAnchor = anchor as? ARFaceAnchor else{ return }
            
            self.currentFaceAnchor = faceAnchor
            
            DispatchQueue.main.async{
                    if node.childNodes.isEmpty, let contentNode = MaskRenderer().renderer(renderer, nodeFor: faceAnchor){
                        node.addChildNode(contentNode)
                    }
            }
        }
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard anchor == currentFaceAnchor,
            let contentNode = MaskRenderer().contentNode,
            contentNode.parent == node

            else{
                return
        }

        MaskRenderer().renderer(renderer, didUpdate: contentNode, for: anchor)
    }
}
