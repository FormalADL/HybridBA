require "../kAADL/src/AADL.k"
require "../kAADL/src/AnnexSubclauseLibrary.k"
require "../kAADL/src/NetComponentAccess.k"

module CPSADL-SYNTAX
   
   imports  AADL-SYNTAX
   imports  NETCOMPONENTACCESS-SYNTAX
   imports  ANNEXSUBCLAUSELIBRARY-SYNTAX

endmodule
module CPSADL
  imports CPSADL-SYNTAX
	syntax Mtype ::= "type"
	syntax Msensor ::= "sensor"
	syntax Mactuator ::= "actuator"
	syntax Mnet ::= "net"
	syntax Mcontext ::= "context"
	syntax Mcontrolled ::= "controlled"
	syntax Mcomentity ::= "comentity"
	syntax Mphyentity ::= "phyentity"
	syntax Meffort ::= "effort"
	syntax Mmonitor ::= "monitor"
	syntax Mnet ::= "net"
	syntax Mstate ::= "state"
	syntax Mvariables ::= "variables"
	syntax Mstates ::= "states"
	syntax Minitially ::= "initially"
	syntax Mmode ::= "mode"
	syntax Mtranstitions ::= "transtitions"
	syntax Mif ::= "if"
	syntax Melse ::= "else"
	syntax Melseif ::= "elseif"
	syntax Mfor ::= "for"
	syntax Mwhen ::= "when"
	syntax Melsewhen ::= "elsewhen"	
	syntax Mfunction ::= "function"
	syntax Minitial ::= "initial"
	syntax Mcomplete ::= "complete"
	syntax Mreturn ::= "return"
	syntax Murgent ::= "urgent"
	syntax Mcomposite ::= "composite"
	syntax Mexit ::= "exit"
	syntax Mon ::= "on"
	syntax Mexists ::= "exists"
	syntax Mcomputation ::= "computation"
	syntax Mdelay ::= "delay"
	syntax Mdiscrete ::= "discrete"
	syntax Mcontinuous ::= "continuous"
	syntax Mhybrid ::= "hybrid"
	syntax MPlus ::= "+"
	syntax MBrace ::= "*"
	syntax MMinus ::= "-"
	syntax MEqual ::= "="
	syntax MDoubleEqual ::= "=="
	syntax MLessThanEqual ::= "<="
	syntax MGreaterThanEqual ::= ">="
	syntax MNotEqual ::= "<>"
	syntax MLessThan ::= "<"
	syntax MGreaterThan ::= ">"
	syntax MAdd ::= "+"
	syntax MSub ::= "-"
	syntax MMul ::= "*"
	syntax MDiv ::= "/"
	syntax MPointAdd ::= ".+"
	syntax MPointSub ::= ".-"
	syntax MPointMul ::= ".*"
	syntax MPointDiv ::= "./"
	syntax MExp ::= "^"
	syntax MPointExp ::= ".^"
	syntax MDArrows ::= "-->"
	syntax MSigh ::= "!"
	syntax MQuestion ::= "?"

  syntax CPSCmpCategory ::= CmpCategory
                          | CmpCategoryType CPSNewCmpCategory
                          
  syntax CPSNewCmpCategory ::= InteEntityCmpCategory
                             | ComEntityCmpCategory
                             | PhyEntityCmpCategory
  
  syntax ComEntityCmpCategory ::= SoftwareCategory
                                | ExecPlateformCategory	
  
  syntax InteEntityCmpCategory ::= Msensor | Mactualor | Mnet
  syntax PhyEntityCmpCategory ::= Mcontext | Mcontrolled
  
  syntax CmpCategoryType ::= Mdiscrete | Mcontinuous | Mhybrid
  syntax CmpType ::= CPSCmpCategory Id Mend Id MSemicolon 
			       | CPSCmpCategory Id CmpAssocDef Mend Id MSemicolon
  
  syntax CmpTypeExt ::= CPSCmpCategory Id Mextends UniCmpTypeRef Mend Id MSemicolon 
			          | CPSCmpCategory Id Mextends UniCmpTypeRef ProtoTypeBindings Mend Id MSemicolon 
			          | CPSCmpCategory Id Mextends UniCmpTypeRef CmpAssocDef Mend Id MSemicolon 
			          | CPSCmpCategory Id Mextends UniCmpTypeRef ProtoTypeBindings CmpAssocDef Mend Id MSemicolon 
  
  syntax CmpImpl ::= CPSCmpCategory Mimplementation CmpImplName Mend CmpImplName MSemicolon 
  syntax CmpImpl ::= CPSCmpCategory Mimplementation CmpImplName CmpImplAssocDef Mend CmpImplName MSemicolon 
  
  syntax CmpImplExt ::= CPSCmpCategory Mimplementation CmpImplName Mextends UniCmpImplRef Mend CmpImplName MSemicolon 
  syntax CmpImplExt ::= CPSCmpCategory Mimplementation CmpImplName Mextends UniCmpImplRef CmpImplExtAssocDef Mend CmpImplName MSemicolon

  syntax SubCmp ::= Id Mcolon CPSCmpCategory SubCmpAssocDef MSemicolon 
			      | Id Mcolon CPSCmpCategory MSemicolon

  syntax SubCmpRefinement ::= Id Mrefined Mto CPSCmpCategory SubCmpAssocDef MSemicolon

  syntax CmpProtoType ::= CPSCmpCategory 
			            | CPSCmpCategory MDoubleBracket 
			            | CPSCmpCategory UniCmpClassifierRef 
		             	| CPSCmpCategory UniCmpClassifierRef MDoubleBracket

  syntax CmpProtoTypeActual ::= CPSCmpCategory UniCmpClassifierRef ProtoTypeBindings 
			                  | CPSCmpCategory UniCmpClassifierRef 
		                      | CPSCmpCategory Id

  syntax AliasDecl ::= Id Mrenames CPSCmpCategory UniCmpTypeRef MSemicolon 
		             | Mrenames CPSCmpCategory UniCmpTypeRef MSemicolon  

  syntax EventDataEffortMonitor ::= Mmonitor | Meffort
  
  syntax SubCmpAccessSpec ::= NetAccessSpec
  
  syntax SubCmpAccessRefinement ::= NetAccessRefinement
  
  syntax PortType ::= Mmonitor Mport 
                    | Meffort  Mport
endmodule
