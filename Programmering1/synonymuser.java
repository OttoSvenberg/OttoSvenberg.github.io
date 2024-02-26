// SynonymUser.java
/****************************************************************
SynonymUser reads the synonym data from a given file. This data
is used and modified in various ways. Finally, the modified data
is written to a new file.
See:
thesaurus.com
Author: Fadil Galjic
****************************************************************/
import java.io.*; // IOException
import static java.lang.System.out;
class synonymuser
{
public static void main (String[] args) throws IOException
{
String[] synonymData = SynonymHandler.readSynonymData("C:\\Users\\OttoSvenberg\\Programmering1\\SynonymData1.txt");    
println(synonymData);
String synonymLine = SynonymHandler.getSynonymLine(synonymData, "beautiful");
out.println(synonymLine + "\n");
synonymLine = "glowing | luminous, vibrant, flaming, gleaming";
synonymData = SynonymHandler.addSynonymLine(synonymData, synonymLine);
println(synonymData);
synonymData = SynonymHandler.removeSynonymLine(synonymData, "merciful");
println(synonymData);
SynonymHandler.addSynonym(synonymData, "powerful","great");
println(synonymData);
SynonymHandler.removeSynonym(synonymData, "beautiful", "graceful");
println(synonymData);
SynonymHandler.sortSynonymData(synonymData);
println(synonymData);
SynonymHandler.writeSynonymData(synonymData,
"SynonymData2.txt");
}
public static void println (String[] synonymData)
{
for (String synonymLine : synonymData)
out.println(synonymLine);
out.println("");
}
}