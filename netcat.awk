BEGIN {
  if (ARGC != 2) {
    print "netcat.awk - simple netcat server"
    print "IN:\n    the FILE name as a command-line parameter"
    print "PARAM(S):\n    -v Port=TCP Port"
    print "OUT:\n    send input to network"
    exit
  }

  FILE = ARGV[1]; ARGV[1] = ""
  if (Port ==  0) Port = 9999
  ORS = RS = "\n"
  BINMODE = "rw"
  HttpService = "/inet/tcp/" Port "/0/0"
  while(( getline < FILE ) > 0 ) {
    # RT not empty if it matched the RS (\n, etc.)
    # So print the ORS if the line has a RS
    # Otherwise don't print the ORS
    printf "%s%s",$0,RT?ORS:"" |& HttpService
  }
  close(HttpService)
}
