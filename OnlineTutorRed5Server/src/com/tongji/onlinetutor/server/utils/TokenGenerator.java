package com.tongji.onlinetutor.server.utils;

import java.util.Random;
import java.util.Stack;


public class TokenGenerator{
	public static int ERROR_RESULT = Integer.MIN_VALUE;
	private static int defaultStart = 10000;
	private static int defaultSlotRange = 500;
	private static int defaultMaxSlots = 40;
	private int start;
	private int slotrange;
	private int maxslots;
	private int slots;
	private Stack<Integer> slot;
	
	public TokenGenerator(){
		this.start = defaultStart;
		this.slotrange = defaultSlotRange;
		this.maxslots = defaultMaxSlots;
		slots = 0;
		slot = new Stack<Integer>();
	}
	public TokenGenerator(int start, int slotrange, int maxslots){
		this.start = start;
		this.slotrange = slotrange;
		this.maxslots = maxslots;
		slots = 0;
		slot = new Stack<Integer>();
	}
	
	private boolean NewSlot(){
		if(slots == maxslots)
			return false;
		int[] pack = new int[slotrange];
		Stack<Integer> stack = new Stack<Integer>();
		int offset = start + slots * slotrange;
		for(int i = 0; i < slotrange; i++){
			pack[i] = offset+i;
		}
		Random rand = new Random();
		for(int i = slotrange-1; i > 0; i--){
			int r = rand.nextInt(i);
			stack.push(pack[r]);
			pack[r] = pack[i];
		}
		slot = stack;
		slots++;
		return true;
	}
	
	/**
	 * 
	 * if slots gets to the maxslots,
	 * and the last bucket is out of numbers,
	 * Generate() will return minimal value of Integer as error code
	 */
	public int Generate(){
		if(slot.empty())
			if(!NewSlot())
				return ERROR_RESULT;
		return slot.pop();
	}
	
	public int getSlots(){
		return slots;
	}
}
