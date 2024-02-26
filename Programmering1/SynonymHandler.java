// SynonymHandler

/****************************************************************

SynonymHandler handles information about synonyms for various
words.

The synonym data can be read from a file and handled in various
ways. These data consists of several lines, where each line begins
with a word, and this word is followed with a number of synonyms.

The synonym line for a given word can be obtained. It is possible
to add a synonym line, and to remove the synonym line for a given
word. Also a synonym for a particular word can be added, or
removed. The synonym data can be sorted. Lastly, the data can be
written to a given file.

Author: Fadil Galjic

****************************************************************/

import java.io.*;    // FileReader, BufferedReader, PrintWriter,
                     // IOException
import java.util.*;  // LinkedList

class SynonymHandler
{
	// readSynonymData reads the synonym data from a given file
	// and returns the data as an array
    public static String[] readSynonymData (String synonymFile) throws IOException
    {
        BufferedReader reader = new BufferedReader(
	        new FileReader(synonymFile));
        LinkedList<String> synonymLines = new LinkedList<>();
        String synonymLine = reader.readLine();
        while (synonymLine != null)
        {
			synonymLines.add(synonymLine);
			synonymLine = reader.readLine();
		}
		reader.close();

		String[] synonymData = new String[synonymLines.size()];
		synonymLines.toArray(synonymData);

		return synonymData;
    }

    // writeSynonymData writes a given synonym data to a given
    // file
    public static void writeSynonymData (String[] synonymData,
        String synonymFile) throws IOException
    {
        PrintWriter writer = new PrintWriter(synonymFile);
        for (String synonymLine : synonymData)
            writer.println(synonymLine);
        writer.close();

    }

    // synonymLineIndex accepts synonym data, and returns the
    // index of the synonym line corresponding to a given word.
    // If the given word is not present, an exception of
    // the type IllegalArgumentException is thrown.
	private static int synonymLineIndex (String[] synonymData, String word)
    {
		int delimiterIndex = 0;
		String w = "";
		int i = 0;
		boolean wordFound = false;
		while (!wordFound  &&  i < synonymData.length)
		{
		    delimiterIndex = synonymData[i].indexOf('|');
		    w = synonymData[i].substring(0, delimiterIndex).trim();
		    if (w.equalsIgnoreCase(word))
				wordFound = true;
			else
				i++;
	    }

	    if (!wordFound)
	        throw new IllegalArgumentException(word + " not present");

	    return i;
	}

    // getSynonymLine accepts synonym data, and returns
    // the synonym line corresponding to a given word.
    // If the given word is not present, an exception of
    // the type IllegalArgumentException is thrown.
    public static String getSynonymLine (String[] synonymData, String word)
    {
		int index = synonymLineIndex(synonymData, word);

	    return synonymData[index];
	}

    // addSynonymLine accepts synonym data, and adds a given
    // synonym line to the data
	public static String[] addSynonymLine (String[] synonymData, String synonymLine)
	{
		String[] synData = new String[synonymData.length + 1];
		for (int i = 0; i < synonymData.length; i++)
		    synData[i] = synonymData[i];
		synData[synData.length - 1] = synonymLine;

	    return synData;
	}

    // removeSynonymLine accepts synonym data, and removes
    // the synonym line corresponding to a given word.
    // If the given word is not present, an exception of
    // the type IllegalArgumentException is thrown.
	public static String[] removeSynonymLine (String[] synonymData, String word)/////////////////
	{
		int Radindex = synonymLineIndex(synonymData, word); //Spara indexet för raden. Ifall ordet inte finns kastas ett argument
		
		String[] Mindrearray = new String[synonymData.length - 1];  //Skapa en ny array med en mindre rad.
		
		for (int i = 0; i < Radindex; i++) {  //Kopiera över fram tills Ordet som ska bort
			Mindrearray[i] = synonymData[i];
		}

		for (int i = Radindex; i < Mindrearray.length; i++) {  //Kopiera över efter Ordet som ska bort
			Mindrearray[i] = synonymData[i + 1];
		}
		return Mindrearray;
	}


    // addSynonym accepts synonym data, and adds a given
    // synonym for a given word.
    // If the given word is not present, an exception of
    // the type IllegalArgumentException is thrown.
	public static void addSynonym (String[] synonymData, String word, String synonym)
	{
		int Radindex = synonymLineIndex(synonymData, word);
        String synonymraden = getSynonymLine(synonymData, word);
        synonymraden += ", " + synonym;

        synonymData[Radindex] = synonymraden;
	}

    // removeSynonym accepts synonym data, and removes a given
    // synonym for a given word.
    // If the given word or the given synonym is not present, an
    // exception of the type IllegalArgumentException is thrown.
	public static void removeSynonym (String[] synonymData, String word, String synonym)
	{
        String[] synonymer = getSynonymLine(synonymData, word).split(", "); //dela upp synonymerna i en array
        int Radindex = synonymLineIndex(synonymData, word);

        int Streckindex = synonymData[Radindex].indexOf("|"); //index för strecket
        String Förstaordet = synonymer[0].substring(0, Streckindex + 3); //första ordet plus tecken (första delen)

        synonymer[0] = synonymer[0].substring(Streckindex + 3); // första delen i arrayen

        for (int i = 0; i < synonymer.length; i++) {
            synonymer[i] += " |"; //lägger till streck så att remove... förstår hur den ska behandla den
        }

        //Assemble the array all together with the first part
        synonymData[Radindex] = Förstaordet + String.join(", ", removeSynonymLine(synonymer, synonym)).replace(" |", "");
	}

    // sortIgnoreCase sorts an array of strings, using
    // the selection sort algorithm
    private static void sortIgnoreCase (String[] strings)
    {
		String minsta = strings[0];  //första ordet
		int	minstaHitilsPlats = 0;   

		for (int b = 0; b < strings.length; b++) {

			minsta = strings[b];
			minstaHitilsPlats = b;

			for (int i = b; i < strings.length; i++) {

				if (strings[i].compareTo(minsta) < 0) {
					minsta = strings[i];
					minstaHitilsPlats = i;
				}
			}
			//Byter plats på minstaHitils och den variablen som checkades
			String flyttavariabel = strings[b]; 
			strings[b] = minsta;
			strings[minstaHitilsPlats] = flyttavariabel; //lägger det största talet 
		}
	}

    // sortSynonymLine accepts a synonym line, and sorts
    // the synonyms in this line
    private static String sortSynonymLine (String synonymLine)
    {
		int Streckindex = synonymLine.indexOf("|");//Index av

		String FörstaOrdet = synonymLine.substring(0, Streckindex + 2);//Sparar till  "|"

		String[] sortArray = synonymLine.split(", ");//En array för varje synonym
		sortArray[0] = sortArray[0].substring(Streckindex + 2); //tar bort första synonymen ("word + |") så vi har första synonymen själv

		sortIgnoreCase(sortArray);

		//Assemble the first part and the array, also remove the "[" and the "]"
		synonymLine = FörstaOrdet + Arrays.toString(sortArray).replaceAll("[\\[\\]]","");
		return synonymLine;

	}

    // sortSynonymData accepts synonym data, and sorts its
    // synonym lines and the synonyms in these lines
	public static void sortSynonymData (String[] synonymData) {

		
		sortIgnoreCase(synonymData);//Sorterar varje ordlinje

		
		for (int i = 0; i < synonymData.length; i++){//Sorterar alla synonymer
			synonymData[i] = sortSynonymLine(synonymData[i]);
		}
	}
}