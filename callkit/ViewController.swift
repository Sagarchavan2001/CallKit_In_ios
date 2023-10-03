//
//  ViewController.swift
//  callkit
//
//  Created by STC on 09/02/23.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        startDemo()
    }
    func startDemo(){
        DispatchQueue.main.asyncAfter(deadline: .now()+10, execute: {
            let callManager = callmanager()
            let id = UUID()
            callManager.reportIncommingcall(id: id, handle: "Tim Cook")
            //callManager.startCall(id: id, handle: "sagar")
        })
    }

}

