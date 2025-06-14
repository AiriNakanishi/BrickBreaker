/*
  checkAndShowRacket()
  float r_y;  // r_hはラケットのy座標
*/
int checkAndShowRacket(float r_y) {
  float r_x = mouseX; // r_x はラケットの左側のx座標
  
  if (r_x + r_w > width) { // 右に寄りすぎていたら補正する
    r_x = width - r_w;
  } 
  
  /* ラケットにボールが当たったらボールを上方へ跳ね返す */
  if (blockHitCheck(r_x,r_y,r_w,1,x,y,b_w,b_h,dx,dy) > 0) {
    dy = -dy;
    hit=1;
    
    }
  
 //りんごがラケットに当たったら//
 for(int j=0; j<4; j++){ 
  for(int i=0;i < block.length ; i++){
    if(blockHitCheck(r_x,r_y,r_w,r_h,i*bw,j*40-40+by[i][j]+bh-4,46,46,0,1) > 0) {
      hit=2;
      apple[i][j]=0;//りんごを消す
  }
  }
 }
  
  noStroke();
  fill(210,105,30);
  rect(r_x, r_y, r_w, r_h); // ラケットを表示する
  return hit;
}
