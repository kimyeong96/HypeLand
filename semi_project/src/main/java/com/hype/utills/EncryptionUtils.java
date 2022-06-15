package com.hype.utills;

import java.math.BigInteger;
import java.security.MessageDigest;

public class EncryptionUtils {
	// 원본데이터가 동일한 값이라면 -> 암호화된 데이터도 동일한 결과값 
	// 사용자의 데이터(pw)를 가져다 암호화 작업하는 메서드
	public static String getSHA512(String pw) throws Exception{
		// MessageDigest 클래스 인스턴스 생성(암호화작업을 적용시킬 알고리즘을 인자)
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		// 데이터를 변환하기전에 인스턴스 초기화 작업
		md.reset();		
		// 변환할 원본 데이터를 utf8 인코딩을 적용한 바이트배열로 변환해서
		// update라는 메서드에 넘겨주면 데이터의 암호화가 이뤄짐
		// (의미없는 128바이트의 데이터로 변환되는 과정) 
		md.update(pw.getBytes("utf8"));
		// digest() -> 암호화된 데이터(변환된 데이터) 바이트 배열로 반환
		// 반환받은 바이트 배열을 양수인 정수형으로 변환
		BigInteger bI = new BigInteger(1, md.digest());
		// 정수형을 128바이트의 문자열로 변환하는 작업 
		pw = String.format("%0128x", bI);
		return pw;		
	}
}