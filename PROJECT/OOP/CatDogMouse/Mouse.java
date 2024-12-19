// Mouse.java 				Written by David Wagner
// This Class Describes a Mouse

import java.util.Random;

public class Mouse extends Animal {

	int myNumber;
	House house;
	Animal player;
	Random randomNum;
	static int numMouses = 0;

	// Define an axis to be either vertical (NORTHSOUTH)
	// or horizontal (EASTWEST)
	static final int NORTHSOUTH = 0;
	static final int EASTWEST = 1;

	/////////////////////////////////////////////////////////////////////////
	//
	// This is the constructor for the Mouse class
	//
	/////////////////////////////////////////////////////////////////////////

	public Mouse(int newMouseNumber, House newHouse,
			Animal newPlayer, char newMouseChar) {
		super();
		myNumber = newMouseNumber;
		setChar(newMouseChar);
		house = newHouse;
		player = newPlayer;
		randomNum = new Random();
		numMouses++;
	}

	/////////////////////////////////////////////////////////////////////////
	//
	// This function returns a count of how many Mouses were created
	//
	/////////////////////////////////////////////////////////////////////////

	public static int getNumMouses() {
		return numMouses;
	}

	/////////////////////////////////////////////////////////////////////////
	//
	// This function changes the location of the Mouse to x,y
	//
	/////////////////////////////////////////////////////////////////////////

	public void changeLocation(int x, int y) {
		house.setChar(this.getX(), this.getY(), ' ');
		house.setChar(x, y, getChar());
		this.setXY(x, y);
	}

	/////////////////////////////////////////////////////////////////////////
	//
	// This is a boolean function. It can return true or false
	//
	// This function checks if the Mouse is at location x,y.
	// If the Mouse is at this location it returns true
	//
	/////////////////////////////////////////////////////////////////////////

	public boolean atLocation(int x, int y) {
		if (x == this.getX() && y == this.getY()) {
			return true;
		}
		return false;
	}

	/////////////////////////////////////////////////////////////////////////
	//
	// This function moves the Mouse either North or South
	//
	// The Mouse always moves North or South towards the player
	// unless there is an obstacle in that location. If there is an obstacle
	// blocking the way then the Mouse does not move
	//
	// This function returns true if the Mouse actually moved
	//
	/////////////////////////////////////////////////////////////////////////

	public boolean moveNS(boolean state) {
		int newX = this.getX();
		int newY = this.getY();
		if (!state) {
			if (newX < player.getX()) {
				newX--;
			} else if (newX > player.getX()) {
				newX++;
			}
		} else {
			if (newX < player.getX()) {
				newX++;
			} else if (newX > player.getX()) {
				newX--;
			}
		}
		// System.out.println("Hi");

		if (house.emptyLocation(newX, newY) ||
				CatDogMouse.playerLocation(newX, newY)) {
			this.changeLocation(newX, newY);
			return true;
		}
		return false;
	}

	/////////////////////////////////////////////////////////////////////////
	//
	// This function moves the Mouse either East or West
	//
	// The Mouse always moves East or West towards the player
	// unless there is an obstacle in that location. If there is an obstacle
	// blocking the way then the Mouse does not move
	//
	// This function returns true if the Mouse actually moved
	//
	/////////////////////////////////////////////////////////////////////////

	public boolean moveEW(boolean state) {
		int newX = this.getX();
		int newY = this.getY();
		if (!state) {
			if (newY < player.getY()) {
				newY--;
			} else if (newY > player.getY()) {
				newY++;
			}
		} else {
			if (newY < player.getY()) {
				newY++;
			} else if (newY > player.getY()) {
				newY--;
			}
		}

		if (house.emptyLocation(newX, newY) ||
				CatDogMouse.playerLocation(newX, newY)) {
			this.changeLocation(newX, newY);
			return true;
		}

		return false;
	}

	/////////////////////////////////////////////////////////////////////////
	//
	// This function moves the Mouse either along the specified axis.
	// The axis can be NORTHSOUTH or EASTWEST
	//
	// The Mouse always moves along that axis towards the player
	// unless there is an obstacle in that location. If there is an obstacle
	// blocking the way then the Mouse does not move
	//
	// This function returns true if the Mouse actually moved
	//
	/////////////////////////////////////////////////////////////////////////

	public boolean moveOnAxis(int axis, boolean state) {
		boolean moved = false;

		if (axis == NORTHSOUTH) {
			moved = moveNS(state);
		} else if (axis == EASTWEST) {
			moved = moveEW(state);
		}

		return moved;

	}

	/////////////////////////////////////////////////////////////////////////
	//
	// This function moves the Mouse towards the player.
	// The direction is chosen to be North-South or
	// East-West at random. If the Mouse cannot move in that direction
	// then the other direction is attempted. If the Mouse cannot move in
	// either direction, then it does not move.
	//
	/////////////////////////////////////////////////////////////////////////

	public void moveMouse(boolean state) {
		boolean moved;
		int axis;

		// Choose the vertical or horizontal axis at random
		axis = randomNum.nextInt(2);

		moved = moveOnAxis(axis, state);

		// If the Mouse was not successfully moved
		// try again in the other direction
		if (!moved) {
			axis++;
			axis %= 2;
			moveOnAxis(axis, state);
		}
	}

}
