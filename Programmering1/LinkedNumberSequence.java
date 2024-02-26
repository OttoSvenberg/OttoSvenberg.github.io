

import javax.crypto.Mac;
import javax.sound.midi.Sequence;
import javax.xml.namespace.QName;

//import org.omg.PortableInterceptor.NON_EXISTENT;

// LinkedNumberSequence.java
/****************************************************************
LinkedNumberSequence represents a sequence of real numbers.
Such a sequence is defined by the interface NumberSequence.
The class uses linked nodes to store the numbers in the sequence.
Author
Fadil Galjic
****************************************************************/
public class LinkedNumberSequence implements NumberSequence
{
private class Node
{
public double number;
public Node next;
public Node (double number)
{
this.number = number;
next = null;
}
}
// the first ny in the ny-sequence
    private Node first;
    // create the sequence
    public LinkedNumberSequence (double[] numbers)
    {
if (numbers.length < 2)
    throw new IllegalArgumentException("not a sequence");
        first = new Node(numbers[0]);
        Node n = first;
for (int i = 1; i < numbers.length; i++)
{
n.next = new Node(numbers[i]);
n = n.next;
}
}
    // toString returns the character string representing this
    // sequence
public String toString ()
{
String s = "";
Node n = first;
while (n.next != null)
{
    s = s + n.number + ", ";
    n = n.next;
}
s = s + n.number;
return s;
}
    // add code here

    public int length()
    {
        Node n = first;
        int i = 0;  //räkna antal nummer
        while(n != null)
        {
            i++;
            n = n.next;
        }
        return i;
    }
    public double upperBound ()
    {
        double max = 0;
        Node n = first;
        while(n != null)
        {
            if(n.number > max)
            {
                max = n.number;
            }
            n = n.next;
        }
        return max;
    }
    public double lowerBound ()
    {
        double första = 0;
        double min = 0;
        Node n = first;
        första = n.number;
        while(n != null)
        {
            if(n.number < första)
            {
                min = n.number;
            }
            else{
                min = första;
            }
            n = n.next;
        }
        return min;
    }
    public double numberAt (int position) throws IndexOutOfBoundsException
    {
        double nummer = 0;
        int temp = 0;
        Node n = first;
        while(n != null)
        {
            if(temp == position){
                nummer = n.number;
                break;
            }
            temp++;
            n = n.next;
        }
        System.out.println();
        if(temp != position){
            throw new IndexOutOfBoundsException("position is wrong");
        }
        return nummer;
    }
    public int positionOf (double number)
    {
        int i = 0;
        int index = -1;
        Node n = first;
        while(n != null)
        {
            if(n.number == number)
            {
                index = i;
            }
            i++;
            n = n.next;
        }

        return index;
    }
    public boolean isIncreasing ()
    {
        boolean öka = true;
        Node n = first;
        while(n.next != null)
        {
            if(n.number > n.next.number)
            {
             öka = false;
             break;
            }
            n = n.next;
           
        }
        return öka;
    }
    public boolean isDecreasing ()
    {
        boolean minska = true;
        Node n = first;
        while(n.next != null)
        {
           
            if(n.number < n.next.number)
            {
               minska = false;
               break;
            }
            n = n.next;
        }
        return minska;
    }
    public boolean contains (double number)
    {
        boolean inehåller = false;
        Node n = first;
        while(n != null)
        {
          
            if(n.number == number)
            {   
                inehåller = true;
            }
            else
            {
                inehåller = false;
            }
            n = n.next;
        }
        return inehåller;
    }
    public void add (double number)
    {
        Node n = first;
        Node m = new Node(number);

        while(n.next != null){
            n = n.next;
        }
        n.next = m;
    }
    public void insert (int position, double number)
    {
        int b = 0;
        Node ny = new Node(number);
        Node n = first;
        int i = 1;
        if(position < 0){
            throw new IndexOutOfBoundsException("position is wrong");
        }

        while( b < position-1) {
            n = n.next;
            if(n.next == null){
            throw new IndexOutOfBoundsException("position is wrong");
            }
            b++;
        }
        n = first;
        if(position == 0){
            Node nu = new Node(number);
            nu.next = first;
            first = nu; 
            return;
        }
        else{
        while(i < position ){
            n = n.next;
            i++;
        }

        Node fortsättning = n.next;
        n.next = ny;
        ny.next = fortsättning;
        }
    }
    public void removeAt (int position) throws IndexOutOfBoundsException
    {   
        Node n = first;
        int i = 1;
        int b = 0;

        if(position < 0){
            throw new IndexOutOfBoundsException("position is wrong");
        }
        while( b < position-1) {
            n = n.next;
            if(n.next == null){
            throw new IndexOutOfBoundsException("position is wrong");
            }
            b++;
            }

        n = first;

        if(position == 0){ //Om vi tar bort pos 0
        first = first.next;
        return;
        }
        else
        {
        while(i < position ){
            n = n.next;
            i++;
        }
        Node fortsättning = n.next;
        n.next = fortsättning.next;

        if(i == 2){
            throw new IllegalStateException("there are just 2 numbers");
        }
        }
    }
    public double[] asArray (){
        Node n = first;
        int i = 0;  //räkna antal nummer
        while(n != null)
        {
            i++;
            n = n.next;
        }
        double array[] = new double[i];
        Node b = first;
        for(int j = 0; j < i; j++)
        {
            array[j] = b.number;
            b = b.next;
        }
        return array;
    }
}