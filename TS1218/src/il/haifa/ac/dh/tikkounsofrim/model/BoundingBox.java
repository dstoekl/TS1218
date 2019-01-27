package il.haifa.ac.dh.tikkounsofrim.model;

public class BoundingBox {
	public BoundingBox(int left, int top, int width, int height) {
		super();
		
		this.x = left;
		this.y = top;
		this.height = height;
		this.width = width;
	}
	//0,105,243,33
public	int y =0;
public	int x=105;
public	int height=243;
public	int width=33;
	
	public String toString() {
		return x +","+ y+","+width+"," + height;
		
	}

}
