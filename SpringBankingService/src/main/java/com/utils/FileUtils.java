package com.utils;

import java.util.Base64;

public class FileUtils {
	public static String toBase64(byte[] image) {
		Base64.Encoder encoder = Base64.getEncoder();
		return encoder.encodeToString(image);
	}
}
