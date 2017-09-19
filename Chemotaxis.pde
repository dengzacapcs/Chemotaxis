 //declare bacteria variables here 
 Bacteria[] b;  
 void setup()   
 {   
 	size(500,500)  ;
 	b =new Bacteria[5];
 	for (int i = 0; i<5;i++){
 		b[i] = new Bacteria(250,250,(int)(Math.random()*255));
 	}
 }   
 void draw()   
 {    
 	background(0);
 	for (int i = 0; i<b.length;i++){
 		b[i].move();
 		b[i].show();
 	}
 }  

 int signum(int a){
 	if (a>0){
 		return 1;
 	}
 	else if (a<0){
 		return -1;
 	}
 	return 0;
 }
 void addBacteria(int x, int y){
 	b = java.util.Arrays.copyOf(b, b.length + 1);
 	b[b.length - 1] = new Bacteria(x,y,(int)(Math.random()*255));
 }
 class Bacteria    
 {
 	int x, y, col,age;     
 	Bacteria(int a, int b, int c){
 		x = a;
 		y = b;
 		col = c;

 		age=0;
 	} 


 	void move(){
 		int dx = mouseX -x;
 		int dy = mouseY - y;
 		x += Math.random()*5-2 + 2*signum(dx);
 		y += Math.random()*5-2 + 2*signum(dy);
 		int dist = dx * dx + dy * dy;
 		if (dist < 5&& age>100){
 			addBacteria(mouseX, mouseY);
 		}
 		age++;
 	}
 	void show(){
 		fill(col);
 		ellipse(x,y,age/10,age/10);
 	}

 }    