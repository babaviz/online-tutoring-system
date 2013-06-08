package com.tongji.onlinetutor.server.utils;

import java.util.ArrayList;

public class MinMemory extends GenerateStrategy{
	private final int start = Integer.MIN_VALUE+1;
	private final int slotrange = 500;
	private final int maxslots = 8589934;	//max slots(500 per slot) in 32-bit OS for one integer
	@Override
	public void init(ArrayList<TokenGenerator> buckets) {
		TokenGenerator t = new TokenGenerator(start, slotrange, maxslots);
		buckets.add(t);
	}
}