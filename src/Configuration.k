require "CPSADL.K"

module CONFIGURATION
   import CPSADL

   configuration
     <system multiplicity="*">
       <systemid> .Map </systemid>
       
       <subcomponent > .List </subcomponent>
       
       <component multiplicity="*">
          <componentid> .Map </componentid>
          <k> $PGM:K </k>
          <prototype multiplicity="*">
          </prototype>
         
         // port:
		  <port multiplicity="*"> 
			  <portid> .Map </portid>  
			  <portdata> .Map </portdata>
			  <portitemcount> 0 |-> 0 </portitemcount> // head |-> tail , tail entry, head out
			  <portfresh> 0 </portfresh>
			  <portdest> .Map </portdest> // dest-com-id |-> dest-port-id
		  </port>
         
          <subcomponent multiplicity="*"> .Map </subcomponent>
         
          <call multiplicity="*"> .Map </call> 
         
          <connection multiplicity="*">
          </connection>
         
          <flow multiplicity="*">
          </flow>
        
          <mode multiplicity="*"> .Map </mode>
        
          <property multiplicity="*"> .Map </property>
         
          <comclock> 0 </comclock> 
		  <comstate> 0 |-> 0 </comstate> // current state |-> time left
										// state: 0 idle, 1 maybe idle, 2 waiting, 3 running, 4 want to run
		  <executions> .Map </executions> // number executions: act |-> time
         
        
          <behavior multiplicity="*">
             <states> .Map </states>
             <statevariables> .Map </statevariables>
		     <store> .Map </store> 
		     <automata>
		        <automataid> NotInitialized </automataid>
			    <automataclock> 0 </automataclock>
			    <status> kidle </status>
			    <curstate> 0 </curstate>
			    <eventcount> 0 </eventcount> 
			    <processingevent> .Map </processingevent> // number |-> state
			    <event> .Map </event>
			    <action> .Map </action> 	// match action
		     </automata> 
          </behavior>
       </component>
       
       <property> .Map </property>      // Identifier |-> value
       
       <globalclock> 
          <globaltime> 0 </globaltime> 
		  <subclockcount> 0 |-> 0 kclear |-> 0 </subclockcount> // Total number |-> Current number ; Clear number
		  <subclock> .Map </subclock> // serial number |-> subautomata id
	   </globalclock>
	  
	   <warnning>  
		  <timeout> .Map </timeout>  // thread id |-> Global time, state
	   </warnning>
       
     </system>
     
endmodule  