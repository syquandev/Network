//
//  ViewController.swift
//  Network
//
//  Created by 95286760 on 02/08/2023.
//  Copyright (c) 2023 95286760. All rights reserved.
//

import UIKit
import Network

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        api()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func api(){
        let rq = AuthAPI.Login()
        HUDLoading.showLoading(self.view,.infinity)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            rq.request { status, model in
                HUDLoading.dismiss()
                if status.isError{
                    HUDBuilder.showAlert(message: status.message)
                }
                else{
                    print(status.code)
                    print(model?.name)
                }
            }
        }
        
    }
    
    func upload(){
//        Network.shared.uploadVideoLimit(url, handler: { (status, info) in
//            self?.uploadMediaSuccess(media, info: info)
//        }, process:{ (written, total) in
//            media.uploadTotal = total
//            media.uploadWritten = written
//            self?.updateUploadPercent()
//        })
    }

}

