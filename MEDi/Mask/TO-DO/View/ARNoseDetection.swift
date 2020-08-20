//
//  ARNoseDetection.swift
//  MEDi
//
//  Created by 하창진 on 2020/08/01.
//  Copyright © 2020 MEDi. All rights reserved.
//

import ARKit
import Vision
import UIKit
import SwiftUI

class ARNoseDetection : UIViewController, ARSessionDelegate{
    let noseDetector = NoseDetection()
    let captureSession = AVCaptureSession()
    let status = NoseDetection().isNoseDetected
    var timer: Timer?
    var count = 10
    
    @IBOutlet weak var imageView: UIImageView!
    @IBSegueAction func addSwiftUI(_ coder: NSCoder) -> UIViewController? {
        let hostingController = UIHostingController(coder: coder, rootView: MaskTODO_NoseDetect())
        hostingController!.view.backgroundColor = UIColor.clear
        
        return hostingController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDevice()
        
        self.startTimer()
    }
    
    func startTimer(){
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
    }
    
    @objc func timerCallback(){
        count-=1
        
        if count == 0{
            self.stopTimer()
        }
    }
    
    func stopTimer(){
        self.timer?.invalidate()
        self.timer = nil
        
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Mask_TODO", bundle: nil)
        
        let arnoseDetect = storyboard.instantiateViewController(withIdentifier: "MaskTODO_Final") as! MaskTODO_FinishAR
        
        self.present(arnoseDetect, animated: true, completion: nil)
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

extension ARNoseDetection: AVCaptureVideoDataOutputSampleBufferDelegate {
    
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
