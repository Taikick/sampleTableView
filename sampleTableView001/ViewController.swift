//
//  ViewController.swift
//  sampleTableView001
//
//  Created by 加藤　大起 on 2017/10/30.
//  Copyright © 2017年 Taiki Kato. All rights reserved.
//

import UIKit


//1.プロトコルの設定(DataSourse, Delegate)
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{

    
    @IBOutlet weak var myTableView: UITableView!
    
    // 表示したいデータ（配列）
    var teaList = ["ダージリン","アールグレイ","アッサム","オレンジペコ"]
    
    //何行目が選択されたかを保存する関数
    //何も行番号が押されて居ない
    var selectedIndex = -1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Storyboadで設定する(PickerViewの時はプログラムで指定)
        
        //4.TableViewに指示を出すのがViewcOntrollerだと設定する
        
//        myTableView.delegate = self　プログラムで書く場合
        
//        myTableView.dataSource = self プログラムで書く場合
        
        //５.TableViewにCellオブジェクトをついかしてidentifierに「Cell」という名前をつける
    }

    //２.行数の決定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let retValue:Int = teaList.count
        
//        if section == 0 {
//            retValue = 10
////            return retValue; //１０行表示
//        } else {
//            retValue = 20
////            return retValue
//        }
        
        
        return retValue
    }
    
    //３.リストに表示する文字列を決定し、表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //文字列を表示するセルの取得(セルの再利用)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath)
        //＊表示したい文字の設定
        cell.textLabel?.textColor = UIColor.blue
        cell.textLabel?.text = teaList[indexPath.row]
        
        //文字を設定したセルを返す
        return cell
        
    }
    
    //セルをタップしたら発動するメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)が行目、\(teaList[indexPath.row])がタップされました")
        //セグウェを使って移動する時に値を渡す
        selectedIndex = indexPath.row
        //選択された行番号をほぞん
        
        //セグエに名前を指定して画面遷移処理を発動
        performSegue(withIdentifier: "showDetail", sender: nil)
        
    }
    
    
    
        
    
    
    //セグエを使って画面遷移している時発動
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //次の画面のインスタンス(オブジェクト)を取得
        //as!DetailViewControllerがダウンキャスト変換している箇所
        let dvc: DetailViewController =
            segue.destination
            as!DetailViewController
        
        //次の画面のプロパティ（メンバ変数）passedIndexに選択された行番号を渡す
        dvc.passedIndex = selectedIndex
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

