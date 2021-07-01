/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beansclasses;

/**
 *
 * @author Chiru
 */
//import java.util.*;
public class RandomNumber {
    private static int rand;
    public static int generateRandomNumber()
    {
        rand=(int) (Math.random() * 999999);
        return rand;
    }
}
