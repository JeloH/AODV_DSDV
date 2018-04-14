# wrls1.tcl
# A 3-node example for ad-hoc simulation with DSDV

# Define options
set val(chan)           Channel/WirelessChannel    ;# channel type
set val(prop)           Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)          Phy/WirelessPhy            ;# network interface type
set val(mac)            Mac/802_11                 ;# MAC type
set val(ifq)            Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)             LL                         ;# link layer type
set val(ant)            Antenna/OmniAntenna        ;# antenna model
set val(ifqlen)         50                         ;# max packet in ifq
set val(nn)             10 ;# 15,20,25,20,35,40,45,50,55,60,65 number of mobilenodes
set val(rp)             DSDV                       ;# routing protocol
set val(x)              500   			   ;# X dimension of topography
set val(y)              400   			   ;# Y dimension of topography  
set val(stop)		150			   ;# time of simulation end

set ns		  [new Simulator]
set tracefd       [open simple.tr w]
set windowVsTime2 [open win.tr w] 
set namtrace      [open simwrls.nam w]    

$ns trace-all $tracefd
$ns namtrace-all-wireless $namtrace $val(x) $val(y)

# set up topography object
set topo       [new Topography]

$topo load_flatgrid $val(x) $val(y)

create-god $val(nn)

#
#  Create nn mobilenodes [$val(nn)] and attach them to the channel. 
#

# configure the nodes
        $ns node-config -adhocRouting $val(rp) \
			 -llType $val(ll) \
			 -macType $val(mac) \
			 -ifqType $val(ifq) \
			 -ifqLen $val(ifqlen) \
			 -antType $val(ant) \
			 -propType $val(prop) \
			 -phyType $val(netif) \
			 -channelType $val(chan) \
			 -topoInstance $topo \
			 -agentTrace ON \
			 -routerTrace ON \
			 -macTrace OFF \
			 -movementTrace ON
			 
	for {set i 0} {$i < $val(nn) } { incr i } {
		set node_($i) [$ns node]	
	}

# Provide initial location of mobilenodes
$node_(0) set X_ 25.0
$node_(0) set Y_ 5.0
$node_(0) set Z_ 0.0

$node_(1) set X_ 490.0
$node_(1) set Y_ 285.0
$node_(1) set Z_ 0.0

$node_(2) set X_ 150.0
$node_(2) set Y_ 240.0
$node_(2) set Z_ 0.0

$node_(3) set X_ 100.0
$node_(3) set Y_ 300.0
$node_(3) set Z_ 0.0

$node_(4) set X_ 300.0
$node_(4) set Y_ 100.0
$node_(4) set Z_ 0.0


$node_(5) set X_ 150.0
$node_(5) set Y_ 75.0
$node_(5) set Z_ 0.0


$node_(6) set X_ 175.0
$node_(6) set Y_ 100.0
$node_(6) set Z_ 0.0


$node_(7) set X_ 175.0
$node_(7) set Y_ 135.0
$node_(7) set Z_ 0.0


$node_(8) set X_ 200.0
$node_(8) set Y_ 175.0
$node_(8) set Z_ 0.0


$node_(9) set X_ 225.0
$node_(9) set Y_ 75.0
$node_(9) set Z_ 0.0




#$node_(10) set X_ 95.0
#$node_(10) set Y_ 195.0
#$node_(10) set Z_ 0.0

#$node_(11) set X_ 190.0
#$node_(11) set Y_ 285.0
#$node_(11) set Z_ 0.0

#$node_(12) set X_ 190.0
#$node_(12) set Y_ 240.0
#$node_(12) set Z_ 0.0

#$node_(13) set X_ 150.0
#$node_(13) set Y_ 300.0
#$node_(13) set Z_ 0.0

#$node_(14) set X_ 270.0
#$node_(14) set Y_ 230.0
#$node_(14) set Z_ 0.0


#$node_(15) set X_ 250.0
#$node_(15) set Y_ 165.0
#$node_(15) set Z_ 0.0


#$node_(16) set X_ 400.0
#$node_(16) set Y_ 225.0
#$node_(16) set Z_ 0.0


#$node_(17) set X_ 375.0
#$node_(17) set Y_ 135.0
#$node_(17) set Z_ 0.0


#$node_(18) set X_ 100.0
#$node_(18) set Y_ 48.0
#$node_(18) set Z_ 0.0


#$node_(19) set X_ 125.0
#$node_(19) set Y_ 15.0
#$node_(19) set Z_ 0.0

 
#$node_(20) set X_ 95.0
#$node_(20) set Y_ 195.0
#$node_(20) set Z_ 0.0

#$node_(21) set X_ 190.0
#$node_(21) set Y_ 285.0
#$node_(21) set Z_ 0.0

#$node_(22) set X_ 190.0
#$node_(22) set Y_ 240.0
#$node_(22) set Z_ 0.0

#$node_(23) set X_ 150.0
#$node_(23) set Y_ 300.0
#$node_(23) set Z_ 0.0

#$node_(24) set X_ 270.0
#$node_(24) set Y_ 230.0
#$node_(24) set Z_ 0.0


#$node_(25) set X_ 250.0
#$node_(25) set Y_ 165.0
#$node_(25) set Z_ 0.0


#$node_(26) set X_ 400.0
#$node_(26) set Y_ 225.0
#$node_(26) set Z_ 0.0


#$node_(27) set X_ 375.0
#$node_(27) set Y_ 135.0
#$node_(27) set Z_ 0.0


#$node_(28) set X_ 100.0
#$node_(28) set Y_ 48.0
#$node_(28) set Z_ 0.0


#$node_(29) set X_ 125.0
#$node_(29) set Y_ 15.0
#$node_(29) set Z_ 0.0



#$node_(30) set X_ 345.0
#$node_(30) set Y_ 225.0
#$node_(30) set Z_ 0.0

#$node_(31) set X_ 450.0
#$node_(31) set Y_ 225.0
#$node_(31) set Z_ 0.0

#$node_(32) set X_ 180.0
#$node_(32) set Y_ 240.0
#$node_(32) set Z_ 0.0

#$node_(33) set X_ 190.0
#$node_(33) set Y_ 300.0
#$node_(33) set Z_ 0.0

#$node_(34) set X_ 330.0
#$node_(34) set Y_ 100.0
#$node_(34) set Z_ 0.0


#$node_(35) set X_ 60.0
#$node_(35) set Y_ 75.0
#$node_(35) set Z_ 0.0


#$node_(36) set X_ 435.0
#$node_(36) set Y_ 130.0
#$node_(36) set Z_ 0.0


#$node_(37) set X_ 405.0
#$node_(37) set Y_ 35.0
#$node_(37) set Z_ 0.0


#$node_(38) set X_ 400.0
#$node_(38) set Y_ 175.0
#$node_(38) set Z_ 0.0


#$node_(39) set X_ 265.0
#$node_(39) set Y_ 75.0
#$node_(39) set Z_ 0.0

 
#$node_(40) set X_ 175.0
#$node_(40) set Y_ 95.0
#$node_(40) set Z_ 0.0

#$node_(41) set X_ 170.0
#$node_(41) set Y_ 205.0
#$node_(41) set Z_ 0.0

#$node_(42) set X_ 130.0
#$node_(42) set Y_ 240.0
#$node_(42) set Z_ 0.0

#$node_(43) set X_ 180.0
#$node_(43) set Y_ 30.0
#$node_(43) set Z_ 0.0

#$node_(44) set X_ 220.0
#$node_(44) set Y_ 175.0
#$node_(44) set Z_ 0.0


#$node_(45) set X_ 110.0
#$node_(45) set Y_ 105.0
#$node_(45) set Z_ 0.0


#$node_(46) set X_ 220.0
#$node_(46) set Y_ 285.0
#$node_(46) set Z_ 0.0


#$node_(47) set X_ 315.0
#$node_(47) set Y_ 105.0
#$node_(47) set Z_ 0.0


#$node_(48) set X_ 100.0
#$node_(48) set Y_ 78.0
#$node_(48) set Z_ 0.0


#$node_(49) set X_ 175.0
#$node_(49) set Y_ 45.0
#$node_(49) set Z_ 0.0



#$node_(50) set X_ 25.0
#$node_(50) set Y_ 5.0
#$node_(50) set Z_ 0.0

#$node_(51) set X_ 450.0
#$node_(51) set Y_ 285.0
#$node_(51) set Z_ 0.0

#$node_(52) set X_ 130.0
#$node_(52) set Y_ 240.0
#$node_(52) set Z_ 0.0

#$node_(53) set X_ 120.0
#$node_(53) set Y_ 300.0
#$node_(53) set Z_ 0.0

#$node_(54) set X_ 270.0
#$node_(54) set Y_ 100.0
#$node_(54) set Z_ 0.0


#$node_(55) set X_ 160.0
#$node_(55) set Y_ 75.0
#$node_(55) set Z_ 0.0


#$node_(56) set X_ 145.0
#$node_(56) set Y_ 100.0
#$node_(56) set Z_ 0.0


#$node_(57) set X_ 155.0
#$node_(57) set Y_ 135.0
#$node_(57) set Z_ 0.0


#$node_(58) set X_ 170.0
#$node_(58) set Y_ 175.0
#$node_(58) set Z_ 0.0


#$node_(59) set X_ 215.0
#$node_(59) set Y_ 75.0
#$node_(59) set Z_ 0.0



#$node_(60) set X_ 210.0
#$node_(60) set Y_ 80.0
#$node_(60) set Z_ 0.0



#$node_(61) set X_ 225.0
#$node_(61) set Y_ 175.0
#$node_(61) set Z_ 0.0



#$node_(62) set X_ 115.0
#$node_(62) set Y_ 115.0
#$node_(62) set Z_ 0.0



#$node_(63) set X_ 225.0
#$node_(63) set Y_ 135.0
#$node_(63) set Z_ 0.0



#$node_(64) set X_ 245.0
#$node_(64) set Y_ 155.0
#$node_(64) set Z_ 0.0




# Generation of movements
$ns at 10.0 "$node_(0) setdest 250.0 250.0 3.0"
$ns at 15.0 "$node_(1) setdest 45.0 85.0 5.0"
$ns at 110.0 "$node_(0) setdest 480.0 300.0 5.0" 
 
# Set a TCP connection between node_(0) and node_(1)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(1) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 10.0 "$ftp start" 

# Printing the window size
proc plotWindow {tcpSource file} {
global ns
set time 0.01
set now [$ns now]
set cwnd [$tcpSource set cwnd_]
puts $file "$now $cwnd"
$ns at [expr $now+$time] "plotWindow $tcpSource $file" }
$ns at 10.1 "plotWindow $tcp $windowVsTime2"  

# Define node initial position in nam
for {set i 0} {$i < $val(nn)} { incr i } {
# 30 defines the node size for nam
$ns initial_node_pos $node_($i) 30
}

# Telling nodes when the simulation ends
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "$node_($i) reset";
}

# ending nam and the simulation 
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "stop"
$ns at 150.01 "puts \"end simulation\" ; $ns halt"
proc stop {} {
    global ns tracefd namtrace
    $ns flush-trace
    close $tracefd
    close $namtrace
}

$ns run

