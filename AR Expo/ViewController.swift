import UIKit
import AVFoundation

/*open sources
developer.apple.com/documentation/avfoundation/cameras_and_media_capture/avcam_building_a_camera_app
hackingwithswift.com/example-code/media/how-to-scan-a-qr-code
appcoda.com/sidebar-menu-swift/
appcoda.com/ios-programming-sidebar-navigation-menu/
*/


class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    
    @IBOutlet weak var RealTimeCamera: UIView!
    
    @IBAction func cameraButton(_ sender: Any) {
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        RealTimeCamera.backgroundColor = UIColor.black
                captureSession = AVCaptureSession()

                guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
                let videoInput: AVCaptureDeviceInput

                do {
                    videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
                } catch {
                    return
                }

                if (captureSession.canAddInput(videoInput)) {
                    captureSession.addInput(videoInput)
                } else {
                    failed()
                    return
                }

                let metadataOutput = AVCaptureMetadataOutput()

                if (captureSession.canAddOutput(metadataOutput)) {
                    captureSession.addOutput(metadataOutput)

                    metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                    metadataOutput.metadataObjectTypes = [.qr]
                } else {
                    failed()
                    return
                }

                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer.frame = RealTimeCamera.layer.bounds
                previewLayer.videoGravity = .resizeAspectFill
                RealTimeCamera.layer.addSublayer(previewLayer)

                captureSession.startRunning()

            }

            func failed() {
                let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                present(ac, animated: true)
                captureSession = nil
            }

            override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)

                if (captureSession?.isRunning == false) {
                    captureSession.startRunning()
                }
            }

            override func viewWillDisappear(_ animated: Bool) {
                super.viewWillDisappear(animated)

                if (captureSession?.isRunning == true) {
                    captureSession.stopRunning()
                }
            }

            func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
                captureSession.stopRunning()

                if let metadataObject = metadataObjects.first {
                    guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
                    guard let stringValue = readableObject.stringValue else { return }
                    AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                    found(code: stringValue)
                }

                dismiss(animated: true)
            }

            func found(code: String) {
                print(code)
            }

            override var prefersStatusBarHidden: Bool {
                return true
            }

            override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
                return .portrait
            }
        }

        // Do any additional setup after loading the view.
