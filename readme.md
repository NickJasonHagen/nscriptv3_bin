# how to use
run it by the commandline the first argument can represent a .nc scriptfilelocation
example:
"nscript scriptspersecond.nc"

# syntaxis/keywords
```c++
//global classes
class something{
  // class linked functions
  func hello(arg1,arg2){
    msg = cat("hello ",arg1," ",arg2)
    print(msg,"green")
  }
  func new(name){
    // reflect the value as the reference, create a new global class upon the value of name
    *name : self
    //return it for reference usage
    name
  }
  self.info = "im a propertie string attached to the class"
}
// a regular global function
func helloworld(){
    print("helloworld!")
}

localvariable = "this will only live thruout the scope where it gets executed, a scope can be a class , a function , or a block which was left over after the scopes are parsed out"
$globalvariable = "$ prefix means its global, it will persist only 1 can exist."

array = [1,2,3,4,"some text"]
// or use vec(..) as a constructor

//statements can have ||, or &&, and
// checking using defaults as true dont work
// instead use : if something == true {}

//coroutines , ( spawned scopes which run sequentially beside one another)
// when a during a coroutine you spawn a new coroutine it will be queued and executed from the next frame
coroutine "globalreference" {
    //do something
    break self //<- coroutines use a self variable this is used to break self in a un-managed state.
}

// time elapsed coroutines ( less runtime excessive then managing it with timers yourself)

coroutine "mytimedevent" each 1000{
    // does something every 1000ms
    break self
}

// matching
match @sec {
    1 2 3 =>{
        // on 1 2 or 3
    }
    4 5 6 =>{
        // on 4 5 6
    }
    _ => {
       // otherwise if it isnt matching
    }
}

// var on match
somevar = match @sec{
   1 2 3 =>{
      return true
   }
   _ =>{
      return false
   }
}
```
# nscript core functions
```c++
printraw(string,color) // returns the given string, colors first char as a string "r" for red, blue,purple yellow green,magenta, for brightcolors add "b" so for red "br" for bright blue "bb"
cos(number) // cos on number
sin(number) // sin on number
add(number,toadd)  // adds the number given by the numberto add
subtract(number,tosubtract)  // subtracts the number given by the numbertosubtract
multiply(number,tomultiply)  // subtracts the number given by the numbertomultiply
devide(number,todevide)  // subtracts the number given by the numbertodevide
add(number,toadd)  // adds the number given by the numberto add
is_alphabetic(string)  // Checks if a string is alphabetic, returns a bool
timerdiff(timerinit)  // takes a timervar created by timerinit() returns the difference in ms
timerinit()  // returns a timervar, can be used with timerdiff(var) to check difference in time ms
trim(string)  // returns a trimmed string, this strips spaces in front and at end
len(vec)  // takes a vector returns the size
vec(string,a,b,c,..endless)  // can take any ammount of arguments , creates a vector out of each given argument and returns it.
uppercase(string)  // returns the given string in UPPERcase
replacebyref(referencevar,find,replace)  // this doesnt return anything, it will replace found string in the var given as referencevar,
// if using multiple lines with replace() this will optimize it by a lot
lowercase(string)  // returns the given string as lowercase
stringbetween(string,beginstring,endstring)  // searches a string by a begin and end, returns the first result as a string.
// if none found returns a empty string
split(string,splitdelimeter)  // splits a string into a vector by a given delimeter.
// to split a string by each character give a empty string as delimeter
contains(string,containsstring)  // returns a bool if a string contains a substring
stringtoeval(string)  // replaces all spaces and special characters of a given string
// usecases: to set properties of them, or create identifiers during runtime
replace(string,find,replace)  // returns a new string if the substring is found it will replace it.
join(vector,delimeter)  // returns a string of a given vector it will join the items by the delimeter
instring(string,substring)  // returns a bool if the string contains a substring ( same as contains() )
fromleft(string,int:characters)  // returns the first x characters of a string
fromright(string,int:characters)  // returns the last x characters of a string
trimright(string,int:totrim)  // trims a string at the end by totrim and returns that as a string
trimleft(string,int:totrim)  //  trims a string at the beginning by a given number returns the result as a new string
stringtohex(string)  // returns a hexed string from the givenstring
hextostring(hexstring)  // returns a string from a given hexstring
print(string,string:color default=white)  // prints a string to the console,
// the color argument is optional colors can be given as the first character
// every color has a bright version
red = r
// blue = b
// bright blue = bb
// red = r etc
fileread(filepath)  // reads a file and returns the contents as a string
filewrite(filepath,string)  // writes a string to a file
fileexists(filepath)  // returns a bool true if the filepath contains a file, and false if theres no file
filedelete(filepath)  // deletes a file at a given path
filemove(filepath,newpath)  // moves a file from a given path to another
filecopy(filepath,copiedpath)  // copies a file
dirmove(directorypath, newpath)  // moves a directory to a new location
dirdelete(directorypath)  // deletes a directory
listdir(directorypath,bool:fullpathasresult default=false)  // returns a vector with all the files
// if the second argument is set to true all the entrees will have a full filepath
// if set false, or not given at all the entrees will only contain the filenames
filesize(filepath) // returns a kb/mb/gb floored number of the filesize
filesizebytes(filepath)  // returns the filesize in bytes
runwait(shellcommandstring)  // executes a shell command, returns the result
 this is a blocking function if the called program doesnt exit , relevant see run()
run(shellcommandstring) // executes a shell command, returns the status as a string. (none blocking) relevant : runwait()
round(numbervar,decimals) // returns a rounded number by the given decimals.
sleep(int:timeinms) //  will pause the thread for x ms seconds.
// can be usefull for lowering powerconsumption
cat(a,b,c,..) //  concatinates all arguments to eachother returns that as a new string.
// theres no limit on the ammount of arguments
random(int:min, int:max, int:decimals default= maximum) //  generates a random number by a minimum and maximum.
set decimal to 0 to get flat numbers
arraycontains(vector,string) //  returns a bool if a vector contains the given string.
arrayroll(vector,string)  // returns a new vec, LiFo , if the vector has a size of 6 is will remain the size the new entree will be inserted as 0 and the last one will be left out, each one will shift one spot.
arraypush(vector,string)  // pushes the string at the end of a vector returns a new vector
arraymerge(vector,vec,vec..)  // combines all entrees of all given vectors returns a new vector
arrayinsert(vector, string) // inserts the string to the vector and returns that as a new vector
arraysort(vector)  // sorts the vector by a alphabetic order and returns that as a new vector
arrayretain(vector,string) //  will remove the string from a vector, returns that as a new vector
arrayshuffle(vector)  // returns a shuffled vector as a new
arrayreverse(vector)  // reverses the vector returns that as a new
arraysearch(vector,string) //  will create a new vector with all entrees containing the given string
arrayfilter(vector,string) //  will create a new vector without all entrees containing the given string
httpgetcontent(ip,port,remotefile) //  will return the webcontent example :
// httpgetcontent("127.0.0.1",80,"/index.nc")
terminalinput(msgstring,defaultoption) //  the terminal will listen for given input,
// this function returns when the terminal gives a enter
splitselect(string,splitbydelimeter,int:vectorentree) //  will split a string with the given delimeter
// instead of returning a vector it will return the string by the given number
base64tofile(base64string,filepath) //  decodes base64 string and writes it as a file
filetobase64(filepath) //  reads a file and encodes it to base64
base64tostring(string) //  returns a decoded base64string
stringtobase64(base64string) //  decodes the string and returns that
tcplistener(ip,port) //  returns a listenersocket, can be used by other tcp***()
tcpaccept(listenersocket) //  returns a clientsocket when a client connects
tcpconnect(ip,port) //  returns a clientsocket
// can be used by tcpreceive
tcpdisconnect(clientsocket) // closes a clientsocket
tcpreceive(clientsocket) // returns a string if the clientsocket receives data
tcpsend(clientsocket,string) // sends a string to a clientsocket
// returns the status or send bytes
aabb_newbox(uniqueidentifierstring) // returns a object reference, usable for 3D collision checks
aabb_sizedbox(uniqueidentifierstring,scalex,scaley,scalez) // creates a 3d boundingbox by given scalesize
returns a object reference usable for 3D collision checks
aabb_setposition(idref,x,y,z) // sets a boundingbox to 3d coordinates ( no returns)
aabb_setrotation(idref,x,y,z) // sets a boundingbox to 3d coordinates ( no returns)
aabb_setscale(idref,x,y,z) // sets a boundingbox to 3d coordinates ( no returns)
aabb_addtogroup(idref,groupidref) // add a object to a collisiongroup
aabb_getgroup(groupidref) // returns a vector of all objects ina collisiongroup
aabb_removefromgroup(groupidref,idtoremove) // removes a entree from a group
aabb_getcollisions(targetid,groupid) // will return a vector of all entrees who are colliding in 3d with the targetid within a collisiongroup
aabb_removegroup(groupidref) // deletes a whole group.
decode_html_url(string) // decodes html content like arguments %12 etc
mod(number,maxnumber) // will keep the number in range, so lets say mod(10,8) will return 2
encrypt(datastring,passwordstring) // returns a encrypted string, can be used with decrypt(datastring,passwordstring)
decrypt(datastring,passwordstring) // returns a decrypted string, created by encrypt(str,pss)
arraynew() // returns a new array
arraynewsized(size) // returns a new array with empty strings by the given size
terminalkey() // returns the pressed key as a string
terminalkey() // returns the pressed key as a string
terminalenableraw() // enables raw mode terminal printing
terminaldisableraw() // disables raw mode terminal printing
terminalupdate(string) // prints a frame
printpos(string,color) // todo..
terminalflush() // flushes the terminal : rawmode
terminalreset() // resets the terminal : rawmode
createqrcode(url,filepathimage) // creates a qrcode link imagefile
prefix(string) // returns the first character
suffix(string) // returns the last character
helloworldhelloworld() prints hello world
````
