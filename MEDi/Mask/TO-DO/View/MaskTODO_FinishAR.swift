//
//  MaskTODO_FinishAR.swift
//  MEDi
//
//  Created by 하창진 on 2020/08/02.
//  Copyright © 2020 MEDi. All rights reserved.
//

import ARKit
import Vision
import UIKit
import SwiftUI

class MaskTODO_FinishAR : UIViewController, ARSessionDelegate{
    let noseDetector = NoseDetection()
    let captureSession = AVCaptureSession()
    let status = NoseDetection().isNoseDetected
    
    @IBOutlet weak var imageView: UIImageView!
    @IBSegueAction func insertSwiftUI(_ coder: NSCoder) -> UIViewController? {
        let hostingController = UIHostingController(coder: coder, rootView: MaskTODO_Finish())
        hostingController!.view.backgroundColor = UIColor.clear
        
        return hostingController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDevice()
        

    }
    
    private func getDevice() -> AVCaptureDevice? {
        let discoverSession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera, .builtInTelephotoCamera, .builtInWideAngleCamera], mediaType: .video, position: .front)
        return discoverSession.devices.first
    }

    private func configureDevice() {
        if let device = getDevice() {
            do {
                try device.lockForConfiguration()
                
                if device.isFocusModeSupported(.continuousAutoFocus) {
                    device.focusMode = .continuousAutoFocus
                }
                
                device.unlockForConfiguration()
            } catch { print("failed to lock config") }

            do {
                let input = try AVCaptureDeviceInput(device: device)
                captureSession.addInput(input)
            } catch { print("failed to create AVCaptureDeviceInput") }

            captureSession.startRunning()

            let videoOutput = AVCaptureVideoDataOutput()
            videoOutput.videoSettings = [String(kCVPixelBufferPixelFormatTypeKey): Int(kCVPixelFormatType_32BGRA)]
            videoOutput.alwaysDiscardsLateVideoFrames = true
            videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue.global(qos: .utility))

            if captureSession.canAddOutput(videoOutput) {
                captureSession.addOutput(videoOutput)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MaskTODO_FinishAR: AVCaptureVideoDataOutputSampleBufferDelegate {

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {

        let maxSize = CGSize(width: 1024, height: 1024)

        if let image = UIImage(sampleBuffer: sampleBuffer)?.flipped()?.imageWithAspectFit(size: maxSize) {
            noseDetector.highlightFaces(for: image) { (resultImage) in
                DispatchQueue.main.async {
                    self.imageView?.image = resultImage
                }
            }
        }
    }
}
