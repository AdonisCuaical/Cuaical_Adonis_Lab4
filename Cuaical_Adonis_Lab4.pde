import processing.serial.*; 
int matriz[][] = {
  {170, 67}, 
  {180, 80}, 
  {170, 65}, 
  {178, 75}, 
  {160, 55}, 
  {163, 60}, 
  {165, 63}, 
  {170, 70}, 
  {164, 62}, 
  {176, 77}, 
  {164, 60}, 
  {170, 76}, 
  {170, 56}, 
  {168, 60}, 
};

int col = 0;
int fil = 0;
int Ex = 0;
int Ey = 0;
float Sx = 0;
float Slny = 0;
float ExElny;
float x_2 = 0;
float Sx_2 = 0;
float Sxlny = 0;
int Exy = 0;
float Ex2 = 0;
float Ex_2 = 0;
int n = 14;
float Bo;
float B;
float lnA;
float m;
String dato;
int estatura;
int peso;
int peso1;
int m1;
float lny;
float A;
String imp;
String dato_e;
int datoIN; 
Serial port; 

void setup() {
  size(1000, 600);
  background(#FCEDED);  
  textSize(32);
  fill(0, 102, 153);  // Set fill to black
  textLeading(40);  // Set leading to 10
  text("Laboratorio_4 Cuaical Adonis ", 240, 35);
  textSize(20);
  fill(0);  // Set fill to black
  textLeading(40);  // Set leading to 10
  text(" Regresión lineal  ", 180, 75);
  fill(0);  // Set fill to black
  textLeading(40);  // Set leading to 10
  text(" Regresión exponencial ", 180+width/2, 75);
  port=new Serial(this, "COM12", 9600);
  regresionLineal();
  regresionExponencial(); 
  plano(); 
  dibujopts();
  dbj();
}
void draw() {
  if (port.available()>0) {
    int d=port.read(); 
    float d1=Bo+m*d; 
    float d2=A*exp(B*d); 
    //datoIN=Integer.parseInt(port.readString());
    fill(#0AFFE9); 
    ellipse(map(d, 150, 190, 50, width/2-50), map(d1, 50, 88, 475, 100)-3, 7, 7); 
    textSize(12);
    fill(255,0,0);  // Set fill to black
    textLeading(40);  // Set leading to 10
    text("("+d+";"+d1+")",map(d, 150, 190, 50, width/2-50)+5, map(d1, 50, 88, 475, 100)+5);
    fill(#0AFFE9); 
    ellipse(map(d, 150, 190, 50, width/2-50)+width/2, map(d2, 50, 88, 475, 100)-3, 7, 7);
    textSize(10);
    fill(255,0,0);  // Set fill to black
    textLeading(40);  // Set leading to 10
    text("("+d+";"+d2+")",map(d, 150, 190, 50, width/2-50)+5+width/2, map(d1, 50, 88, 475, 100)+5);
  }
}


void regresionLineal() {
  for (fil = 0; fil < n; fil++) {
    Ex = Ex + matriz[fil][0];
    Ey = Ey + matriz[fil][1];
    Exy = Exy + (matriz[fil][0] * matriz[fil][1]);
    Ex2 = Ex2 + pow(matriz[fil][0], 2);
  }

  Ex_2 = pow(Ex, 2);
  Bo = ((Ex2 * Ey) - float(Ex * Exy)) / ((n * Ex2 - Ex_2));
  m1 = (n * Exy) - (Ex * Ey);
  m = (m1) / ((n * Ex2 - Ex_2));
  fill(0);  // Set fill to black
  textLeading(40);  // Set leading to 10
  text("y="+m+"x"+Bo, 100, 575);
}
void regresionExponencial() {
  for (fil = 0; fil < n; fil++) {
    Sxlny = Sxlny + matriz[fil][0] * log(matriz[fil][1]);
    Sx = Sx + matriz[fil][0];
    Slny = Slny + log(matriz[fil][1]);
    x_2 = x_2 + pow(matriz[fil][0], 2);
    lny = lny + log(matriz[fil][1]);
  }
  ExElny = Sx * lny;
  Sx_2 = pow(Sx, 2);
  B = (((n * Sxlny) - (ExElny)) / (((n * x_2) - Sx_2)));
  lnA = (lny / n) - (B * (Sx / n));
  A = (exp(lnA));
  fill(0);  // Set fill to black
  textLeading(40);  // Set leading to 10
  text("y="+A+"e^("+B+"x)", width/2+100, 575);
} 
void plano() {
  int cont=150; 
  int conti=50; 
  textSize(10);
  fill(0);  // Set fill to black
  textLeading(30);  // Set leading to 10
  text(" peso(Kg) ", 20, 75);
  text(" estatura(cm) ", width/2-100, 500);
  text(" peso(Kg) ", width/2+20, 75);
  text(" estatura(cm) ", width-100, 500);
  fill(0); 
  strokeWeight(5); 
  line(width/2, 50, width/2, height); 
  fill(0); 
  strokeWeight(3); 
  line(50, 100, 50, 500); 
  line(25, 475, width/2-50, 475); 
  line(width/2+50, 100, width/2+50, 500); 
  line(25+width/2, 475, width-50, 475); 
  triangle(45, 100, 55, 100, 50, 90); 
  triangle(45+width/2, 100, 55+width/2, 100, width/2+50, 90); 
  triangle(width/2-50, 480, width/2-50, 470, width/2-40, 475); 
  triangle(width-50, 470, width-50, 480, width-40, 475); 
  for (int i=0; i<width/2-100; i+=20) {
    strokeWeight(0.5);
    line(50+i, 100, 50+i, 477); 
    line(50+i+width/2, 100, 50+i+width/2, 477); 
    textSize(8);
    fill(0);  // Set fill to black
    //textLeading(40);  // Set leading to 10
    text(cont, 50+i-5, 490);
    text(cont, 50+i-5+width/2, 490); 
    cont+=2;
  }
  for (int i=475; i>100; i-=20) {

    strokeWeight(0.5);
    line(width/2-50, i, 48, i); 
    line(width-50, i, width/2+48, i); 
    textSize(8);
    fill(0);  // Set fill to black
    //textLeading(40);  // Set leading to 10
    text(conti, 30, i);
    text(conti, width/2+30, i); 
    conti+=2;
  }
}
void dibujopts() {
  for (int i=0; i<14; i++) {
    fill(0, 255, 0); 
    ellipse(map(matriz[i][0], 150, 190, 50, width/2-50), map(matriz[i][1], 50, 88, 475, 100)-3, 5, 5); 
    fill(255, 0, 0);
    ellipse(map(matriz[i][0], 150, 190, 50, width/2-50)+width/2, map(matriz[i][1], 50, 88, 475, 100)-3, 5, 5);
  }
}
void dbj() {
  float y=0; 
  float y1=0; 
  float i=152; 

  for (; i<186; i+=0.1)

  {
    fill(255, 0, 0); 
    y=Bo+m*i;
    y1=A*exp(B*i); 
    ellipse(map(i, 150, 190, 50, width/2-50), map(y, 50, 88, 475, 100)-3, 1, 1); 
    ellipse(map(i, 150, 190, 50, width/2-50)+width/2, map(y1, 50, 88, 475, 100)-3, 1, 1);
  }
}
