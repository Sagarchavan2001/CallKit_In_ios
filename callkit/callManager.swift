//
//  callManager.swift
//  callkit
//
//  Created by STC on 09/02/23.
//
import CallKit
import Foundation
final class callmanager : NSObject,CXProviderDelegate{
    func providerDidReset(_ provider: CXProvider) {

    }
    
    let provider = CXProvider(configuration: CXProviderConfiguration())
    let callController = CXCallController()
    override init() {
        super.init()
        provider.setDelegate(self, queue: nil)
        
    }
    public func reportIncommingcall(id : UUID,handle : String){
        print("call repoted")
     let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: handle)
        provider.reportNewIncomingCall(with: id, update: update){ error in
            if let error = error{
                print(String(describing: error))
            }else{
                print("call repoted")
            }
        }
    }
    public func startCall(id : UUID, handle : String){
        print("call started")
      let handle  = CXHandle(type: .generic, value: handle)
        let action = CXStartCallAction(call: id, handle: handle)
        let transaction = CXTransaction(action: action)
        callController.request(transaction){
            error in
            if let error = error{
                print(String(describing: error))
            }
            else{
                print("call started")
            }
        }
    }
}
