package com.tongji.onlinetutor.server.utils;

import java.util.ArrayList;
import java.util.Collections;

public class BetterPerformance extends GenerateStrategy{
	private final int start = Integer.MIN_VALUE+1;
	private final int slotrange = 500;
	private final int maxslots = 858993;
	private final int maxbuckets = 10;
	@Override
	public void init(ArrayList<TokenGenerator> buckets) {
		TokenGenerator t;
		for(int i = 0; i < maxbuckets; i++){
			t = new TokenGenerator(start,slotrange, maxslots);
			buckets.add(t);
		}
		Collections.shuffle(buckets);
	}
}