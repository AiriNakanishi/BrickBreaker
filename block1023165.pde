float bw, bh = 40.0;//blockのたてとよこの長さ

int blockWidth = 10;//ブロックがよこに10個
int blockHeight = 4;//ブロックがたてに4個
int[][] by=new int[blockWidth][blockHeight];
int blockNum = blockWidth*blockHeight;//ブロックの数が40個

int block[][] = new int[blockWidth][blockHeight]; // 10個のブロックの余命カウンター
int apple[][]=new int[blockWidth][blockHeight];// リンゴの寿命カウンター

float x, y; // ボールの左上の座標
float b_w = 15, b_h = 15; // ボールの幅と高さ
float dx, dy; // ボールの移動速度
float r_w = 50.0, r_h = 6.0; // ラケットの幅と高さ

int hit=0;//0=ラケットに何も当たっていない、1=ボールが当たっている、2=りんごが当たっている

PImage img_tree;//木のイラスト
PImage img_apple;//りんごのイラスト

//import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.effects.*;
//import ddf.minim.signals.*;
//import ddf.minim.spi.*;
//import ddf.minim.ugens.*;

//Minim minim;
//AudioPlayer BGM;

void setup() {
  size(400, 300);

  initBall(); // ボールの初期化
  initBlocks(); // ブロックの初期化

  img_tree=loadImage("tree_image.png");//木のイラスト
  img_apple=loadImage("apple_image.png");//りんごのイラスト

  //minim = new Minim(this);
  //BGM = minim.loadFile("ルンルンピクニック.mp3");
}


void draw() {
  //BGM.play();//BGMを流す

  //ボールを動かす//
  x += dx;
  y += dy;

  background(185, 230, 255);//背景の色
  image(img_tree, -35, -38, width*1.2, height*1.2);//木のイラスト

  stroke(0);
  fill(255, 255, 150);
  rect(x, y, b_w, b_h); // ボールの表示

  if (checkAndShowRacket(height-50)==2) {//hit=2のとき
  }


  checkBlocks(); // ブロックによるボールの跳ね返り処理
  showBlocks(); //　命が残っているブロックを表示する


  if (y + b_h >= height) { // ボールが落ちたとき
    background(0);
    textSize(70);
    fill(0, 255, 0);
    text("GAME OVER", 30, 165);//ゲームオーバーの表示
  }




  if (x < 0 || x+b_w >=width) {
    dx = -dx;
  } // ボールが左右の壁に当たったら跳ね返る
  if (y < 0) {
    dy = -dy;
  } //　ボールが上部の壁に当たったら跳ね返る

  if ( blockNum==0 ) {//すべてのブロックを壊したときクリア画面を出す
    background(255);
    for (int i=0; i<10; i++) {
      for (int j=0; j<10; j++) {
        image(img_apple, i*50-100, j*50-100, 100, 100);//りんごを敷き詰める
      }
    }
    textSize(70);
    fill(255, 255, 0);
    text("GAME CLEAR", 15, 165);
  }
}

void gameOver() {
  background(0);
  textSize(70);
  fill(0, 255, 0);
  text("GAME OVER", 30, 165);//gameover を表示
}
