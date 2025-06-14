
/*
 40個のブロックを初期化する
*/
void initBlocks() {
  for(int j=0; j<4; j++){
  for (int i = 0; i < block.length ; i++) {
    block[i][j]=1;
    apple[i][j]=1;
  }
  }
  bw = width / block.length; // ブロックの幅を決める
}
  

/*
 ボールが40個のブロックのいずれかにぶつかったら跳ね返る
*/
void checkBlocks() {
  for(int j=0; j<4; j++){
  for (int i = 0; i < block.length ; i++) {
    if (block[i][j] > 0) {
      int ret = blockHitCheck(i*bw,j*40,bw,bh,x,y,b_w,b_h,dx,dy);
      if (ret > 0) {
        if (ret == 1) {
          dx = -dx;//x座標の向きを逆にする
          block[i][j]--;
          blockNum--;
          
        } else if (ret == 2) {//y座標の向きを逆にする
          dy = -dy;
          block[i][j]--;
          blockNum--;
          
        } else if (ret == 3) {//xy座標の向きを逆にする
          dx = -dx;
          dy = -dy;
          block[i][j]--;
          blockNum--;
          
        }
        return;
      }
    }
  }  
}
}

/*
 10個のブロックを表示する
*/

void showBlocks() {
  for(int j=0; j<4; j++){//たてに4個
  for (int i = 0; i < block.length ; i++) {//よこに10個
   if (block[i][j]>0) {
      
      stroke(0);
      fill(0,140,0,230);
      rect(i * bw, j*40, bw, bh); // ブロックの描画
  }
    if(block[i][j]==0){//ブロックが壊れたとき
     if(j*40+by[i][j]+bh<=height){//りんごのｙ座標が一番下より高いとき
       if(apple[i][j]>0){
     image(img_apple,i*bw-4,j*40+by[i][j],50,50);
      by[i][j]=by[i][j]+1;//速度1でりんごが落ちる
       }
       
     }else{//りんごが画面外に行ったとき
       apple[i][j]=0;
       background(0);
       gameOver();
       break;//くりかえしおわり
     }
    }
  }
}
}
