
public class synonymtest
{

    public static void main (String[] args)
    {
    String massaord = "hej jag heter otto ";

    String parts[] = massaord.split(" ");
    for(int i = 0; i <parts.length; i++){
        
        System.out.println(parts[1]);
    }
    
    }      


}