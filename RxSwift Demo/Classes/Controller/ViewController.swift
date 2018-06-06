//
//  ViewController.swift
//  RxSwift Demo
//
//  Created by 冯晓林 on 2018/5/19.
//  Copyright © 2018年 WeShion. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UITableViewController {
    
    @IBOutlet var mTableView: UITableView!
    let mViewModel = LViewModel()
    
//    var dataAray = Variable<NewsList>()
    var dataArray = [Story]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            mViewModel.getDataObservable()
                      .subscribe(onSuccess: { model in
                        self.dataArray = model.stories
                        self.mTableView.reloadData()
                print(model)
            }) { error in
                print("error --- \(error.localizedDescription)")
        }
        .disposed(by: disposbag)

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as CustomCell
        cell.setData(cellData: self.dataArray[indexPath.row])
        return cell
    }



}

