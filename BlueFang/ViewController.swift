//
//  ViewController.swift
//  BlueFang
//
//  Created by Sebastian Kazakov on 8/18/23.
//

import UIKit
import SwiftUI
import CoreBluetooth

// MARK: FRONTEND CONTROLLER

class ViewController: UIViewController, CBPeripheralDelegate {
    
    
    //@IBOutlet weak var ConnectButton: UIButton!
    
    @IBOutlet weak var DeviceNameLabel: UILabel!
    
    @IBOutlet weak var DiscoveredDevices: UIButton!
    
    @IBOutlet weak var InputFeild: UITextField!
    
    @IBOutlet weak var SendDataButton: UIButton!
    
    @IBOutlet weak var UUIDLabel: UILabel!
    
    @IBOutlet weak var DistanceLabel: UILabel!
    
    private var centralManager: CBCentralManager!
    var connectedPeripheral: CBPeripheral?
    var emptyString = ""
    var ConnectedCurrentPeripheral: CBPeripheral!
    var ConnectedCurrentCharacteristic: CBCharacteristic!
    var device1: UIAction!
    var device2: UIAction!
    var device3: UIAction!
    var device4: UIAction!
    var device5: UIAction!
    var device6: UIAction!
    var device7: UIAction!
    var device8: UIAction!
    var device9: UIAction!
    var device10: UIAction!
    var device11: UIAction!
    var device12: UIAction!
    var device13: UIAction!
    var device14: UIAction!
    var device1Name: String = ""
    var device2Name: String = ""
    var device3Name: String = ""
    var device4Name: String = ""
    var device5Name: String = ""
    var device6Name: String = ""
    var device7Name: String = ""
    var device8Name: String = ""
    var device9Name: String = ""
    var device10Name: String = ""
    var device11Name: String = ""
    var device12Name: String = ""
    var device13Name: String = ""
    var device14Name: String = ""
    var device1Peripheral: CBPeripheral?
    var device2Peripheral: CBPeripheral?
    var device3Peripheral: CBPeripheral?
    var device4Peripheral: CBPeripheral?
    var device5Peripheral: CBPeripheral?
    var device6Peripheral: CBPeripheral?
    var device7Peripheral: CBPeripheral?
    var device8Peripheral: CBPeripheral?
    var device9Peripheral: CBPeripheral?
    var device10Peripheral: CBPeripheral?
    var device11Peripheral: CBPeripheral?
    var device12Peripheral: CBPeripheral?
    var device13Peripheral: CBPeripheral?
    var device14Peripheral: CBPeripheral?
    var device1Characteristics: CBCharacteristic?
    var device2Characteristics: CBCharacteristic?
    var device3Characteristics: CBCharacteristic?
    var device4Characteristics: CBCharacteristic?
    var device5Characteristics: CBCharacteristic?
    var device6Characteristics: CBCharacteristic?
    var device7Characteristics: CBCharacteristic?
    var device8Characteristics: CBCharacteristic?
    var device9Characteristics: CBCharacteristic?
    var device10Characteristics: CBCharacteristic?
    var device11Characteristics: CBCharacteristic?
    var device12Characteristics: CBCharacteristic?
    var device13Characteristics: CBCharacteristic?
    var device14Characteristics: CBCharacteristic?
    var deviceList: [UIAction?] = []
    
    
    var publicMenuClosure = {(action: UIAction) in }
    var priorityNumber: Int!
    var selectedNumber: Int!
    var defaultString: String!
    var timer = Timer()
    var isConnectedAndReady: Bool = false
    let noDevice = "no device"
    var UUIDString: String = ""
    var rssiTimer = Timer()
    var deviceNameList: [String] = []
    var matchCounter: Int = 0
    var requiredNumForNilMatch = 14
    var dMenu = UIMenu()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.removeKeyboard(_:)))
        view.addGestureRecognizer(tap)
        
        priorityNumber = 1
        
        let menuClosure = {(action: UIAction) in
            self.update(name: action.title)
           }
        
        publicMenuClosure = menuClosure
        
        device1 = UIAction(title: "Discovered Device(s):", handler: publicMenuClosure)
        device2 = UIAction(title: "", handler: publicMenuClosure)
        device3 = UIAction(title: "", handler: publicMenuClosure)
        device4 = UIAction(title: "", handler: publicMenuClosure)
        device5 = UIAction(title: "", handler: publicMenuClosure)
        device6 = UIAction(title: "", handler: publicMenuClosure)
        device7 = UIAction(title: "", handler: publicMenuClosure)
        device8 = UIAction(title: "", handler: publicMenuClosure)
        device9 = UIAction(title: "", handler: publicMenuClosure)
        device10 = UIAction(title: "", handler: publicMenuClosure)
        device11 = UIAction(title: "", handler: publicMenuClosure)
        device12 = UIAction(title: "", handler: publicMenuClosure)
        device13 = UIAction(title: "", handler: publicMenuClosure)
        device14 = UIAction(title: "", handler: publicMenuClosure)
        
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
        updateMenuChildren()
        
        DiscoveredDevices.showsMenuAsPrimaryAction = true
        DiscoveredDevices.changesSelectionAsPrimaryAction = true
        
        defaultString = "helloBoiAintNobodyGonnaGuessThisRandomA*sString"
        
        SendDataButton.isEnabled = false
        
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(readIncomingSerial), userInfo: nil, repeats: true)
        
        rssiTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(detectRSSI), userInfo: nil, repeats: true)
        
    }

    // MARK: MENU CONTROLLER
    func update(name:String) {
        
        if name == "\(device14Name)"{
            if name != emptyString{
                connectEverythingAndEnableButton(peripheral: device14Peripheral!, userSelectedNumber: 14)
            }
        }
        if name == "\(device13Name)"{
            if name != emptyString{
                connectEverythingAndEnableButton(peripheral: device13Peripheral!, userSelectedNumber: 13)
            }
        }
        if name == "\(device12Name)"{
            if name != emptyString{
                connectEverythingAndEnableButton(peripheral: device12Peripheral!, userSelectedNumber: 12)
            }
        }
        if name == "\(device11Name)"{
            if name != emptyString{
                connectEverythingAndEnableButton(peripheral: device11Peripheral!, userSelectedNumber: 11)
            }
        }
        if name == "\(device10Name)"{
            if name != emptyString{
                connectEverythingAndEnableButton(peripheral: device10Peripheral!, userSelectedNumber: 10)
            }
        }
        if name == "\(device9Name)"{
            if name != emptyString{
                connectEverythingAndEnableButton(peripheral: device9Peripheral!, userSelectedNumber: 9)
            }
        }
        if name == "\(device8Name)"{
            if name != emptyString{
                connectEverythingAndEnableButton(peripheral: device8Peripheral!, userSelectedNumber: 8)
            }
        }
        if name == "\(device7Name)"{
            if name != emptyString{
                connectEverythingAndEnableButton(peripheral: device7Peripheral!, userSelectedNumber: 7)
            }
        }
        if name == "\(device6Name)"{
            if name != emptyString{
                connectEverythingAndEnableButton(peripheral: device6Peripheral!, userSelectedNumber: 6)
            }
        }
        if name == "\(device5Name)"{
            if name != emptyString{
                connectEverythingAndEnableButton(peripheral: device5Peripheral!, userSelectedNumber: 5)
            }
        }
        if name == "\(device4Name)"{
            if name != emptyString{
                connectEverythingAndEnableButton(peripheral: device4Peripheral!, userSelectedNumber: 4)
            }
        }
        if name == "\(device3Name)"{
            if name != emptyString{
                connectEverythingAndEnableButton(peripheral: device3Peripheral!, userSelectedNumber: 3)
            }
        }
        if name == "\(device2Name)"{
            if name != emptyString{
                connectEverythingAndEnableButton(peripheral: device2Peripheral!, userSelectedNumber: 2)
            }
        }
        if name == emptyString{
            DiscoveredDevices.titleLabel?.text = "No device"
            print("no device selected")
        }
        if name == "Discovered Device(s):" {
            //print("Nothing to see here, keep searching")
            SendDataButton.isEnabled = false
        }else{
            DiscoveredDevices.titleLabel?.text = "No device"
            print("please choose a real device")
        }
   }
    

    // MARK: SCAN FOR SERVICES
    func beginScan(){
       // let device = CBUUID(string: "DAB7ADE9-64D5-13C3-A1BE-B275FF5F3E8B")
        let options: [String: Any] = [CBCentralManagerScanOptionAllowDuplicatesKey:NSNumber(value: false)]
        centralManager.scanForPeripherals(withServices: nil, options: options)
        //print("radar: ON!")
    }
    
    // MARK: CHARACTERISTICS
    func discoverCharacteristics(peripheral: CBPeripheral){
        guard let services = peripheral.services else{
            return
        }
        for service in services{
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    // MARK: SERVICES
    func DiscoverServices(peripheral: CBPeripheral){
        peripheral.discoverServices(nil)
    }
    
    // MARK: Descriptors
    func discoverDescriptors(peripheral: CBPeripheral, characteristic: CBCharacteristic){
        peripheral.discoverDescriptors(for: characteristic)
    }
    
    // MARK: CONNECT
    func connectToDevice(peripheral: CBPeripheral){
        centralManager.connect(peripheral, options: nil)
    }
    
    // MARK: DISCONNECT ACTION
    func disconnectFromDevice(peripheral: CBPeripheral){
        centralManager.cancelPeripheralConnection(peripheral)
    }
        
    // MARK: SUBSCRIBE / STALK
    func subscribeToNotifications(peripheral: CBPeripheral, characteristic: CBCharacteristic){
        peripheral.setNotifyValue(true, for: characteristic)
    }

    
    // MARK: SEND COMMAND
    func write(command: String, characteristic: CBCharacteristic){
            let stringBoi = command
            let dataToSend: Data = stringBoi.data(using: String.Encoding.utf8)!
            
            ConnectedCurrentPeripheral.writeValue(dataToSend, for: characteristic, type: .withResponse)
            //print("\(dataToSend) ----------------------------------- dis is da one")
            print("sent to all connected")
    }
    
    // MARK: READ RECEPTION
    @objc func readIncomingSerial(){
        if SendDataButton.isEnabled{
            if isConnectedAndReady{
                ConnectedCurrentPeripheral.readValue(for: ConnectedCurrentCharacteristic)
            }
        }
    }
    
    //MARK: SENSE RSSI
    @objc func detectRSSI(){
        if isConnectedAndReady{
            ConnectedCurrentPeripheral.readRSSI()
        }
    }

    // MARK: DISCONNECT BUTTON
    @IBAction func Disconnect(_ sender: Any) {
        HapticsManager.shared.beginVibration(type: .error)
        disconnectFromDevice(peripheral: device1Peripheral ?? connectedPeripheral!)
        disconnectFromDevice(peripheral: device2Peripheral ?? connectedPeripheral!)
        disconnectFromDevice(peripheral: device3Peripheral ?? connectedPeripheral!)
        disconnectFromDevice(peripheral: device4Peripheral ?? connectedPeripheral!)
        disconnectFromDevice(peripheral: device5Peripheral ?? connectedPeripheral!)
        disconnectFromDevice(peripheral: device6Peripheral ?? connectedPeripheral!)
        disconnectFromDevice(peripheral: device7Peripheral ?? connectedPeripheral!)
    }
    
    
    // MARK: SEND BUTTON
    @IBAction func SendData(_ sender: Any) {
        HapticsManager.shared.beginVibration(type: .warning)
        let inputText = InputFeild.text!
        write(command: inputText, characteristic: ConnectedCurrentCharacteristic)
        //print(ConnectedCurrentCharacteristic ?? emptyString)
        //print("sent!")
        InputFeild.text = emptyString
       
    }
    
 
    
}




// MARK: BACKEND CONTROLLER:



// MARK: THE REAL HERO

extension ViewController: CBCentralManagerDelegate {
    
    // MARK: BLUETOOTH STATUS
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state{
        case .poweredOn:
            print("on")
            beginScan()
            print("scanning")
        case .poweredOff:
            print("off")
        case .unauthorized:
            print("not allowed")
        case .unknown:
            print("no idea")
        case .resetting:
            print("reset")
        case .unsupported:
            print("no suport")
        default:
            break
        }
    }
    
    // MARK: DISCOVERING PERIPHERAL
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        connectedPeripheral = peripheral
        
        fillNameList()

        switch priorityNumber{
            
        case 13:
            for name in deviceNameList{
                if peripheral.name != name{
                    matchCounter += 1
                }
                if matchCounter == requiredNumForNilMatch && peripheral.name != nil && peripheral.name != ""{
                    slideInLocalVariables(peripheral: peripheral, deviceAction: &device14, deviceName: &device14Name, devicePeripheral: &device14Peripheral, priorityNumberSlot: &priorityNumber, actaulNumber: 1)
                    updateMenuChildren()
                }
            }
            matchCounter = 0
        case 12:
            for name in deviceNameList{
                if peripheral.name != name{
                    matchCounter += 1
                }
                if matchCounter == requiredNumForNilMatch && peripheral.name != nil && peripheral.name != ""{
                    slideInLocalVariables(peripheral: peripheral, deviceAction: &device13, deviceName: &device13Name, devicePeripheral: &device13Peripheral, priorityNumberSlot: &priorityNumber, actaulNumber: 13)
                    updateMenuChildren()
                }
            }
            matchCounter = 0
        case 11:
            for name in deviceNameList{
                if peripheral.name != name{
                    matchCounter += 1
                }
                if matchCounter == requiredNumForNilMatch && peripheral.name != nil && peripheral.name != ""{
                    slideInLocalVariables(peripheral: peripheral, deviceAction: &device12, deviceName: &device12Name, devicePeripheral: &device12Peripheral, priorityNumberSlot: &priorityNumber, actaulNumber: 12)
                    updateMenuChildren()
                }
            }
            matchCounter = 0
        case 10:
            for name in deviceNameList{
                if peripheral.name != name{
                    matchCounter += 1
                }
                if matchCounter == requiredNumForNilMatch && peripheral.name != nil && peripheral.name != ""{
                    slideInLocalVariables(peripheral: peripheral, deviceAction: &device11, deviceName: &device11Name, devicePeripheral: &device11Peripheral, priorityNumberSlot: &priorityNumber, actaulNumber: 11)
                    updateMenuChildren()
                }
            }
            matchCounter = 0
        case 9:
            for name in deviceNameList{
                if peripheral.name != name{
                    matchCounter += 1
                }
                if matchCounter == requiredNumForNilMatch && peripheral.name != nil && peripheral.name != ""{
                    slideInLocalVariables(peripheral: peripheral, deviceAction: &device10, deviceName: &device10Name, devicePeripheral: &device10Peripheral, priorityNumberSlot: &priorityNumber, actaulNumber: 10)
                    updateMenuChildren()
                }
            }
            matchCounter = 0
        case 8:
            for name in deviceNameList{
                if peripheral.name != name{
                    matchCounter += 1
                }
                if matchCounter == requiredNumForNilMatch && peripheral.name != nil && peripheral.name != ""{
                    slideInLocalVariables(peripheral: peripheral, deviceAction: &device9, deviceName: &device9Name, devicePeripheral: &device9Peripheral, priorityNumberSlot: &priorityNumber, actaulNumber: 9)
                    updateMenuChildren()
                }
            }
            matchCounter = 0
        case 7:
            for name in deviceNameList{
                if peripheral.name != name{
                    matchCounter += 1
                }
                if matchCounter == requiredNumForNilMatch && peripheral.name != nil && peripheral.name != ""{
                    slideInLocalVariables(peripheral: peripheral, deviceAction: &device8, deviceName: &device8Name, devicePeripheral: &device8Peripheral, priorityNumberSlot: &priorityNumber, actaulNumber: 8)
                    updateMenuChildren()
                }
            }
            matchCounter = 0
            
        case 6:
            for name in deviceNameList{
                if peripheral.name != name{
                    matchCounter += 1
                }
                if matchCounter == requiredNumForNilMatch && peripheral.name != nil && peripheral.name != ""{
                    slideInLocalVariables(peripheral: peripheral, deviceAction: &device7, deviceName: &device7Name, devicePeripheral: &device7Peripheral, priorityNumberSlot: &priorityNumber, actaulNumber: 1)
                    updateMenuChildren()
                }
            }
            matchCounter = 0
        case 5:
            for name in deviceNameList{
                if peripheral.name != name{
                    matchCounter += 1
                }
                if matchCounter == requiredNumForNilMatch && peripheral.name != nil && peripheral.name != ""{
                    slideInLocalVariables(peripheral: peripheral, deviceAction: &device6, deviceName: &device6Name, devicePeripheral: &device6Peripheral, priorityNumberSlot: &priorityNumber, actaulNumber: 6)
                    updateMenuChildren()
                }
            }
            matchCounter = 0
        case 4:
            for name in deviceNameList{
                if peripheral.name != name{
                    matchCounter += 1
                }
                if matchCounter == requiredNumForNilMatch && peripheral.name != nil && peripheral.name != ""{
                    slideInLocalVariables(peripheral: peripheral, deviceAction: &device5, deviceName: &device5Name, devicePeripheral: &device5Peripheral, priorityNumberSlot: &priorityNumber, actaulNumber: 5)
                    updateMenuChildren()
                }
            }
            matchCounter = 0
        case 3:
            for name in deviceNameList{
                if peripheral.name != name{
                    matchCounter += 1
                }
                if matchCounter == requiredNumForNilMatch && peripheral.name != nil && peripheral.name != ""{
                    slideInLocalVariables(peripheral: peripheral, deviceAction: &device4, deviceName: &device4Name, devicePeripheral: &device4Peripheral, priorityNumberSlot: &priorityNumber, actaulNumber: 4)
                    updateMenuChildren()
                }
            }
            matchCounter = 0
        case 2:
            for name in deviceNameList{
                if peripheral.name != name{
                    matchCounter += 1
                }
                if matchCounter == requiredNumForNilMatch && peripheral.name != nil && peripheral.name != ""{
                    slideInLocalVariables(peripheral: peripheral, deviceAction: &device3, deviceName: &device3Name, devicePeripheral: &device3Peripheral, priorityNumberSlot: &priorityNumber, actaulNumber: 3)
                    updateMenuChildren()
                }
            }
            matchCounter = 0
        case 1:
            for name in deviceNameList{
                if peripheral.name != name{
                    matchCounter += 1
                }
                if matchCounter == requiredNumForNilMatch && peripheral.name != nil && peripheral.name != ""{
                    slideInLocalVariables(peripheral: peripheral, deviceAction: &device2, deviceName: &device2Name, devicePeripheral: &device2Peripheral, priorityNumberSlot: &priorityNumber, actaulNumber: 2)
                    updateMenuChildren()
                }
            }
            matchCounter = 0
        default:
            break
        }
        
        deviceNameList.removeAll()
    
    }
    
    // MARK: SCRAPING FOR SERVICES
    //
    //
    //
    // MARK: CONNECTED TO PERIPHERAL
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        //print("let's go!!!")
        peripheral.delegate = self
        connectedPeripheral = peripheral
        DeviceNameLabel.text = "Connected Device: \(peripheral.name ?? noDevice)"
        DeviceNameLabel.textColor = .green
        DiscoverServices(peripheral: peripheral)
     
        SendDataButton.isEnabled = true
    }
    
    // MARK: COLLECT SERVICES
    //
    //
    //
    // MARK: CONNECT
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else{
            return
        }
        print(services)
        let id = peripheral.identifier.uuidString
        UUIDString = String(id)
        print(UUIDString)
        UUIDLabel.text = "UUID: \(UUIDString)"
        discoverCharacteristics(peripheral: peripheral)
        ////print("service discovered")
    }
    
    // MARK: RETURN UUID && CBUUID
    func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {
      
        guard let descriptors = characteristic.descriptors else{return}
        //print(descriptors)
        if let userDescriptionDescriptor = descriptors.first(where: {
            
            return $0.uuid.uuidString == CBUUIDCharacteristicUserDescriptionString
            
        }) {
            peripheral.readValue(for: userDescriptionDescriptor)
        }
        
        subscribeToNotifications(peripheral: peripheral, characteristic: characteristic)
        //print("descriptors discovered!")
        isConnectedAndReady = true
    }
    
    // MARK: UPDATE DESCRIPTORS
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor descriptor: CBDescriptor, error: Error?) {
        if descriptor.uuid.uuidString == CBUUIDCharacteristicUserDescriptionString,
           let userDescription = descriptor.value as? String{
            print("Characteristic \(descriptor.characteristic?.uuid.uuidString ?? emptyString) is also known as \(userDescription)")
        }
    }
    
    // MARK: CHARACTERISTICS
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else{
            return
        }
        discoverDescriptors(peripheral: peripheral, characteristic: characteristics.first!)
        ConnectedCurrentPeripheral = peripheral
        ConnectedCurrentCharacteristic = characteristics.first!
        isConnectedAndReady = true
    }
    
    // MARK: UPDATE CHARACTERISTIC
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        //let dataToRead: Data = (characteristic.value?.description.data(using: String.Encoding.utf8))!
        //let dataToRead = String(decoding: characteristic.value!, as: UTF8.self)
        guard let data = characteristic.value else {
            return
        }
        guard let oneByte = data.first else{
            return
        }
        print("\(oneByte) -----------> Read string from \(peripheral)")
    }
    
    // MARK: SUBSCRIBE TO UPDATES
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error{
            //print("you actually suck, no subscribe")
            print(error)
        }else{
            print("#subscribed boi")
        }
    }
    
    // MARK: WRITE VALUE MANAGER
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error{
            //print("God Motherfuzzin Damnit!!!")
            print(error)
        }else{
            print("Yay!!!")
        }
    }

    // MARK: DISCONNECT MANAGER
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        DeviceNameLabel.text = "Connected Device: \(noDevice)"
        //print("disconnected")
        SendDataButton.isEnabled = false
        isConnectedAndReady = false
        DeviceNameLabel.textColor = .red
    }
    
    // MARK: FAIL MANAGER
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        //print("failed to connect")
        SendDataButton.isEnabled = false
        isConnectedAndReady = false
        DeviceNameLabel.textColor = .red
    }
    
    // MARK: CHECK SIGNAL STRENGTH
    func peripheral(_ peripheral: CBPeripheral, didReadRSSI RSSI: NSNumber, error: Error?) {
        let initialNum = (Int(truncating: RSSI) * -1)
        DistanceLabel.text = "Connection(rssi) = \(initialNum)"
        if initialNum >= 90{
            DistanceLabel.textColor = .red
        }else if initialNum >= 70{
            DistanceLabel.textColor = .orange
        }else if initialNum >= 50{
            DistanceLabel.textColor = .yellow
        }else if initialNum >= 30{
            DistanceLabel.textColor = .green
        }else{
            DistanceLabel.textColor = .green
        }
    }
    
    // MARK: REMOVE KEYBOARD
    @objc func removeKeyboard(_ sender: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    // MARK: UPDATE MENU
    func updateMenuChildren(){
        DiscoveredDevices.menu = UIMenu(children: [
            device1, device2, device3, device4, device5, device6, device7, device8, device9, device10, device11, device12, device13, device14
        ])
    }
    
    // MARK: CONNECT LOCAL TO MAIN
    func connectEverythingAndEnableButton(peripheral: CBPeripheral, userSelectedNumber: Int){
        connectToDevice(peripheral: peripheral)
        connectedPeripheral = peripheral
        selectedNumber = userSelectedNumber
        SendDataButton.isEnabled = true
    }
    
    func slideInLocalVariables(peripheral: CBPeripheral, deviceAction: inout UIAction, deviceName: inout String, devicePeripheral: inout CBPeripheral?, priorityNumberSlot: inout Int, actaulNumber: Int){
            deviceAction = UIAction(title: peripheral.name ?? emptyString, handler: publicMenuClosure)
            deviceName = peripheral.name!
            devicePeripheral = peripheral
            priorityNumberSlot = actaulNumber
    }
    
    func fillNameList(){
        deviceNameList.append(contentsOf: [device1Name, device2Name, device3Name, device4Name, device5Name, device6Name, device7Name, device8Name, device9Name, device10Name, device11Name, device12Name, device13Name, device14Name])
    }
    

}




//for name in deviceNameList{
//    if peripheral.name != name{
//        matchCounter += 1
//    }
//    if matchCounter == requiredNumForNilMatch && peripheral.name != nil && peripheral.name != ""{
//
//    }
//}
//matchCounter = 0
