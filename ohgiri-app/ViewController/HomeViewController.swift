//
//  HomeViewController.swift
//
//
//  Created by 小田倉真弘 on 2017/10/28.
//
//

import UIKit

class HomeViewController: UIViewController,UIImagePickerControllerDelegate{
    
    /// こいつでUITableViewとか描画するテストするといいですよ
    private let debugList = BokeData.getDebugList()
    //写真のライブラリに接続して設定
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    //グループ内で一位が何回か
    @IBOutlet weak var groupRecordLabel: UILabel!
    //総得票数
    @IBOutlet weak var recordLabel: UILabel!
    
    @IBOutlet weak var votesLabel: UILabel!
    var userInfo: UserInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 記録を更新
        
        groupRecordLabel.text =  "グループ一位\(userInfo?.rankRecord)回"
        if userInfo?.rankRecord == nil {
            groupRecordLabel.text = nil
            recordLabel.text = "全国ランク最高\(userInfo?.allRecord)位"
            votesLabel.text = "合計投票数\(userInfo?.votesRecord)票"
            if userInfo?.votesRecord == nil {
                votesLabel.text = nil
            }
        }
        if userInfo?.rankRecord == nil{
            recordLabel.text = nil
            
        }
        // Do any additional setup after loading the view.
        
        // デバッグデータ
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //プロフィール画像変更　写真のライブラリに接続して設定　無でもいい
    
    
    @IBAction func settingButton(_ sender: Any) {
        // ライブラリ（カメラロール）を指定してピッカーを開く
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
            pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(pickerController, animated: true, completion: nil)
            
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        if info[UIImagePickerControllerOriginalImage] != nil {
            // 撮影/選択された画像を取得する
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            myImageView.image=image
            // あとでAdobeUXImageEditorを起動する
            picker.dismiss(animated: true, completion: nil)
        }
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 閉じる
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
