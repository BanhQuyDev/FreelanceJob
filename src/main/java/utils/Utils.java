/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author Tung Nguyen
 */
public class Utils {
    
    public static String convertPrice(double price) {
        String convertPrice = null;
        Locale localeEN = new Locale("en", "EN");
        NumberFormat en = NumberFormat.getInstance(localeEN);
        convertPrice = en.format(price);
        return convertPrice;
    }
    
}
