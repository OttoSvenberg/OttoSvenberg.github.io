

import java.util.Arrays;

import javax.swing.JSpinner.NumberEditor;

//import javafx.beans.binding.NumberBinding;

// ArrayNumberSequence.java
/****************************************************************
ArrayNumberSequence represents a sequence of real numbers.
Such a sequence is defined by the interface NumberSequence.
The class uses an array to store the numbers in the sequence.
Author
Fadil Galjic
****************************************************************/
public class ArrayNumberSequence implements NumberSequence
{
// numbers in the sequence
    private double[] numbers;
    // create the sequence
    public ArrayNumberSequence (double[] numbers)
    {
if (numbers.length < 2)
    throw new IllegalArgumentException("not a sequence");
this.numbers = new double[numbers.length];
for (int i = 0; i < numbers.length; i++)
    this.numbers[i] = numbers[i];
}
    // toString returns the character string representing this
    // sequence
public String toString ()
{
String s = "";
for (int i = 0; i < numbers.length - 1; i++)
    s = s + numbers[i] + ", ";
s = s + numbers[numbers.length - 1];
return s;
}
    // add code here
    public int length()
    {
        int index = 0;
        for(int i = 0; i <= numbers.length; i++)
        {
            index = i;
        }
        return index;
    }
    public double upperBound ()
    {
        double störst = 0;
        for(int i = 0; i < numbers.length; i++)
        {
            
            if(numbers[i] > störst)
            {
                störst = numbers[i];
            }
        }
         return störst;
    }
    public double lowerBound ()
    {
        double minst = 0;
        for(int i = 0; i < numbers.length; i++)
        {
            if(numbers[i] < minst)
            {
                minst = numbers[i];
            }
            else{
                minst = numbers[0];
            }
        }
         return minst;
    }
    public double numberAt (int position) throws IndexOutOfBoundsException{
        double nummer = 0;
        double[] nynumbers = numbers;
        nummer = nynumbers[position];

        if(0 > position || position > numbers.length - 1){
            throw new IndexOutOfBoundsException("position is wrong");
        }
        return nummer;
    } 
    public int positionOf (double number)
    {
        int j = 0;
        for(int i = 0; i < numbers.length; i++)
        {
            if(numbers[i] == number){
                j = i;
            }
        }
        return j;
    }
    public boolean isIncreasing ()
    {
        boolean increase = true;
        for(int i = 0; i < numbers.length - 1; i++)
        {
            if(numbers[i] > numbers[i + 1])
            {
                increase = false;
                break;
            }
        }
        return increase;
    }
    public boolean isDecreasing()
    {
        boolean decrease = true;
        for(int i = 0; i < numbers.length - 1; i++)
        {
            if(numbers[i] < numbers[i + 1])
            {
                decrease = false;
                break;
            }
        }
        return decrease;
    }
    public boolean contains (double number)
    {
        boolean tal = false;
        for(int i = 0; i < numbers.length; i++)
        {
            if(numbers[i] == number)
            {
                tal = true;
                break;
            }
        }
        return tal;
    }
    public void add (double number)
    {
        double [] störrearray = new double[numbers.length + 1];
        for(int i = 0; i < numbers.length; i++)
        {
                störrearray[i] = numbers[i];
                störrearray[störrearray.length - 1] = number;
        }
        numbers = störrearray;
    }
   
    public void insert (int position, double number)
    {
        double [] insertarr = new double[numbers.length + 1];
    
        for(int i = 0; i < position; i++)
        {
          insertarr[i] = numbers[i];
        }

        insertarr[position] = number;

        for(int j = position; j < numbers.length; j++)
        {
            insertarr[j+1] = numbers[j];
        }
       
        numbers = insertarr;

        if(0 > position || position > numbers.length - 1){
            throw new IndexOutOfBoundsException("position is wrong");
        }
    }
    

   
    public void removeAt (int position) throws IndexOutOfBoundsException
    {
        double[] tabort = new double[numbers.length - 1];
        
        for(int i = 0; i < position; i++)
        {
          tabort[i] = numbers[i]; 
        }
        for(int j = position; j < tabort.length; j++)
        {
            tabort[j] = numbers[j+1];
        }
        numbers = tabort;

        if(0 > position || position > numbers.length - 1){
            throw new IndexOutOfBoundsException("position is wrong");
        }
        if(numbers.length == 2){
            throw new IllegalStateException("there are just 2 numbers in the sequence");
        }
    }
    public double[] asArray ()
    {
        return numbers;
    }
    
}


