BEGIN {
 print "HEAD / HTTP/1.1\n" |& "/inet/tcp/0/192.168.1.1/80"
 while (( "/inet/tcp/0/192.168.1.1/80" |& getline) >0)
   if($1 == "Date:") {
     split($0, dt, ": ")
     print dt[2]
   }
 close("/inet/tcp/0/192.168.1.1/80")
}
