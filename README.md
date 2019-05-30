# mybashness
handy bash goodness for your terminal Kung Fu.

.bashrc, config for bash shell environment adds some handy function
.bash_aliases, sets some handy shortcuts you can use in that environment.

Both of these files belong in your ~/ directory: /home/YOU/
The dot preceeding the filename indicates that the file is hidden

Think of the dictum: if you have to do it twice, write a script.  As well, be efficient.  Instead of typing that command out every time you need to use it, add the function to your shell environment, hence an entry to ~/.bashrc.  

For example, see the handy function called "fix()" to use in web root to correct file and directory permissions.  

--------------------------------------------
<pre>function fix() {
   if [ -d $1 ]; then
  sudo find $1 -type d -exec chmod 755 {} \;
  sudo find $1 -type f -exec chmod 644 {} \;
   else
   echo "$1 is not a directory."
   fi
}</pre>
--------------------------------------------

cd to /var/www and simply type: fix html/
and files are chmod'd to 644 and directories are chmod'd to 755.  That's handy.  'Course, you could do this when necessary if you add more 'sites' in your web server.  So, cd /var/www/html/ and then: fix newsite/
