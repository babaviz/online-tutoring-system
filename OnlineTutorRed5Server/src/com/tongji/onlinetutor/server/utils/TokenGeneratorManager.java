package com.tongji.onlinetutor.server.utils;

import java.util.ArrayList;
import java.util.Collections;

public class TokenGeneratorManager {
	private ArrayList<TokenGenerator> buckets;
	private int currentindex;
	private GenerateStrategy strategy;	//maybe I will need this some time;
	public TokenGeneratorManager() {
		buckets = new ArrayList<TokenGenerator>();
		currentindex = 0;
	}
	public void setStrategy(GenerateStrategy strategy){
		strategy.init(buckets);
		this.strategy = strategy;
	}
	/**
	 * 
	 * if all buckets are out of resource
	 * Generate() will return ERROR_RESULT which is minimal value of Integer
	 */
	public int Generate(){
		int result = TokenGenerator.ERROR_RESULT;
		for(int i = 0; i < buckets.size(); i++){
			if(result == TokenGenerator.ERROR_RESULT){
				result = buckets.get(currentindex).Generate();
				currentindex = (++currentindex) % buckets.size();
			}
			else
				break;
		}
		return result;
	}
}
