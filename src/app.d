import std.stdio;
import std.file;
import core.exception;

int main(string[] args){
    string rfilename;
    string wfilename;
    string filecontent;
    string rfilecontent;
    string rowselection;
    
    try{
        if(args[1] != ""){
            try{
                writeln("Contents of file \"", args[1], "\":");
                rfilecontent = readText(args[1]);
                writeln(rfilecontent);
                return 0;
            } catch(FileException){
                writeln("The file you specified does not exist!");
                return 1;
            }
        }
    } catch(RangeError){
        
    }
    write("Do you want to read from a file or write to a file? (Type r or w): ");
    readf("%s\n", rowselection);
    switch(rowselection){
        case "r":
            write("Please enter a file to read from: ");
            readf("%s\n", rfilename);
            try{ 
                rfilecontent = readText(rfilename);
                writeln("Contents of file \"", rfilename, "\":");
                writeln(rfilecontent);
                return 0;
            } catch(FileException){
                writeln("The file you specified does not exist!");
                return 1;
            }
        case "w":
            write("Please enter a filename for the new file you want to create: ");
            readf("%s\n", wfilename);
            write("Please enter the text you want to write to the file: ");
            readf("%s\n", filecontent);
            std.file.write(wfilename, filecontent);
            writeln("Wrote ", filecontent.length, " Chars to the file \"", wfilename, "\"");
            return 0;
        default:
            writeln("Please enter a valid Selection and try again");
    }
    return 0;
}
