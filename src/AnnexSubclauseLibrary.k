module ANNEXSUBCLAUSELIBRARY-SYNTAX

  syntax AnnexSubclause ::=  Mannex  AnnexId AnnexSubclauseAssocDef  MSemicolon 
  syntax AnnexId ::= Id
  syntax AnnexSubclauseAssocDef ::=  MAsteriskBrace1  AnnexSpecLangConstructs  MAsteriskBrace2 
                                  |  MAsteriskBrace1  AnnexSpecLangConstructs  MAsteriskBrace2  InModes
                                  | NoneStatement
                                  | NoneStatement InModes

  syntax AnnexLibrary ::=  Mannex  AnnexId AnnexLibraryAssocDef  MSemicolon 
  syntax AnnexLibraryAssocDef ::=  MAsteriskBrace1  AnnexSpecReusableConstructs  MAsteriskBrace2 
                                |  MAsteriskBrace1  AnnexSpecReusableConstructs  MAsteriskBrace2  InModes
                                | NoneStatement 
								| NoneStatement InModes
								
  syntax AnnexSpecReusableConstructs ::= NODEF
                
  syntax AnnexSpecLangConstructsElem ::= Mstate Mvariables
                                       | Mstate Mvariables BehaviorVariableDeclList   
                                       | Mstates BehaviorStateList
                                       | Minitially EquationList
                                       | Mtransitions BehaviorStateTransitionList
                                       | Mmode Mtransitions BehaviorStateTransitionList
                                       | CompositeDeclList    
  
  syntax AnnexSpecLangConstructs ::= AnnexSpecLangConstructsElem
                                   | AnnexSpecLangConstructsElem AnnexSpecLangConstructs
  
  
  syntax BehaviorVariableDeclList ::= BehaviorVariableDecl
                                    | BehaviorVariableDecl BehaviorVariableDeclList
                                    
  syntax BehaviorStateList ::= BehaviorState                                  
                             | BehaviorState BehaviorStateList      
                                    
  syntax EquationList ::= Equations                                   
                        | Equations EquationList           
                                     
  syntax BehaviorStateTransitionList ::= BehaviorStateTransition                                   
                                       | BehaviorStateTransition BehaviorStateTransitionList                                  
   
  syntax CompositeDeclList ::= CompositeDecl                                   
                             | CompositeDecl CompositeDeclList 
  
  syntax BehaviorVariableDecl ::= Id Mcolon Id MSemicolon
                                | Id Mcolon Id MPoint Id MSemicolon   
   
  syntax Equations ::= Equation  MSemicolon
                     | Statement MSemicolon
  
  syntax Equation ::= SimpleExpression MEqual Expression
                    | IfEquation
                    | ForEquation
                    | WhenEquation
                    | Mcomputation MBracketLeft Expressions MBracketRight 
                    | Mdelay MBracketLeft Expressions MBracketRight
                    | Communication 
                    
  syntax Expressions ::= Expression
                       | Expression MComma Expressions
  
  syntax Communication ::= Expression MSigh BehaviorParameterBindings
                         | Expression MQuestion BehaviorParameterBindings
  
  syntax  Statement ::= Equation 
                   
  syntax IfEquation ::= Mif MBracketLeft Expression MBracketRight MBraceLeft EquationList MBraceRight Mend Mif
                      | Mif MBracketLeft Expression MBracketRight MBraceLeft EquationList MBraceRight Else Mend Mif
                      | Mif MBracketLeft Expression MBracketRight MBraceLeft EquationList MBraceRight ElseIfList Mend Mif  
                      | Mif MBracketLeft Expression MBracketRight MBraceLeft EquationList MBraceRight ElseIfList Else Mend Mif
                      
  syntax ElseIfList ::= ElseIf
                      | ElseIf ElseIfList
                      
  syntax ElseIf ::= Melseif MBracketLeft Expression MBracketRight MBraceLeft EquationList MBraceRight                   
                      
  syntax Else ::= Melse MBraceLeft EquationList MBraceRight
  
  syntax ForEquation ::= Mfor MBracketLeft ForIndices MBracketRight MBraceLeft EquationList MBraceRight Mend Mfor                   
                      
  syntax ForIndices ::= ForIndex
                      | ForIndex MComma ForIndices                    
                      
  syntax ForIndex ::= IDENT
                    | IDENT Min Expression                    
                      
  syntax WhenEquation ::= Mwhen MBracketLeft Expression MBracketRight MBraceLeft EquationList MBraceRight Mend Mwhen
                        | Mwhen MBracketLeft Expression MBracketRight MBraceLeft EquationList MBraceRight ElseWhenList Mend Mwhen                      
                      
  syntax ElseWhenList ::= ElseWhen
                      | ElseWhen ElseWhenList
                      
  syntax ElseWhen ::= Melsewhen MBracketLeft Expression MBracketRight MBraceLeft EquationList MBraceRight                       
                      
//-------------------------------------------------------------------------------------------------------------------------------------

  syntax Expression ::= SimpleExpression
                      | Mif MBracketLeft Expression MBracketRight MBraceLeft Expression MBraceRight  
                      | Mif MBracketLeft Expression MBracketRight MBraceLeft Expression MBraceRight ElseEx 
                      | Mif MBracketLeft Expression MBracketRight MBraceLeft Expression MBraceRight ElseExIfList    
                      | Mif MBracketLeft Expression MBracketRight MBraceLeft Expression MBraceRight ElseExIfList ElseEx                       
                      
  syntax ElseExIfList ::= ElseExIf
                      | ElseExIf ElseExIfList
                      
  syntax ElseExIf ::= Melseif MBracketLeft Expression MBracketRight MBraceLeft Expression MBraceRight                   
                      
  syntax ElseEx ::= Melse MBraceLeft Expression MBraceRight                      
                      
  syntax SimpleExpression ::= LogicalExpression
                            | LogicalExpression Mcolon LogicalExpression
                            | LogicalExpression Mcolon LogicalExpression Mcolon LogicalExpression                    
                      
  syntax LogicalExpression ::= LogicalTerm
                             | LogicalTerm Mor LogicalExpression
  
  syntax LogicalTerm ::= LogicalFactor
                       | LogicalFactor Mand  LogicalTerm
   
  syntax LogicalFactor ::= Relation
                         | Mnot Relation 
   
  syntax Relation ::= ArithmeticExpressionSymbol 
                    | ArithmeticExpressionSymbol RelOp ArithmeticExpressionSymbol
   
  syntax RelOp ::= MDoubleEqual
                 | MLessThan
                 | MLessThanEqual
                 | MGreaterThan
                 | MGreaterThanEqual
                 | MNotEqual
   
  syntax ArithmeticExpression ::= Term
                                | Term AddOp ArithmeticExpression
   
  syntax ArithmeticExpressionSymbol ::= ArithmeticExpression
                                      | AddOp ArithmeticExpression 
   
  syntax AddOp ::= MAdd
                 | MSub
                 | MPointAdd
                 | MPointSub
  
  syntax Term ::= Factor
                | Factor MulOp Term
   
  syntax MulOp ::= MMul
                 | MDiv
                 | MPointMul
                 | MPointDiv
   
  syntax Factor ::= Primary
                  | Primary MExp Primary
                  | Primary MPointExp Primary 
   
  syntax Primary ::= Assignment
                   | Name FunctionCallArgs
                   | MBracketLeft OutputExpressionList MBracketRight  
                   | MLeftBracket ExpressionLists MRightBracket
                   | MBraceLeft FunctionArguments MBraceRight
                   | Mall MBracketLeft Id Min Expression MBracketRight Mcolon Expression
                   | Mexists MBracketLeft Id Min Expression MBracketRight Mcolon Expression
   
  syntax ExpressionLists ::= ExpressionList
                           | ExpressionList MSemicolon ExpressionLists 
   
  syntax FunctionCallArgs ::= "(" ")"
                            | "(" FunctionArguments ")" 
   
  syntax FunctionArguments ::= FunctionArgument
                             | FunctionArgument MComma FunctionArguments 
                             | FunctionArgument Mfor ForIndices
                             | NamedArguments
   
  syntax NamedArguments ::= NamedArgument
                          | NamedArgument MComma NamedArguments  
   
  syntax NamedArgument ::= Id MEqual FunctionArgument 
   
  syntax FunctionArgument ::= Mfunction Name "(" ")"
                            | Mfunction Name "(" NamedArguments ")"
                            | Expression
   
  syntax ExpressionList ::= Expression
                          | Expression MComma ExpressionList
   
  syntax OutputExpressionList ::= ExpressionList 
   
//----------------------------------------------------------------------------------------------------------------------------------   

  syntax BehaviorState ::= IdentifierList Mcolon StateKeywordList  Mstate MSemicolon
  
  syntax IdentifierList ::= Id
                          | Id MComma IdentifierList
  
  syntax StateKeyword ::= Minitial
                        | Mcomplete
                        | Mreturn
                        | Murgent
                        | Mcomposite
                        | Mexit
  
  syntax StateKeywordList ::= StateKeyword
                            | StateKeyword StateKeywordList

//-----------------------------------------------------------------------------------------------------------------------------------

  syntax BehaviorStateTransition ::= IdentifierList MSpecalArrows1  MSpecalArrows2 Id MBraceLeft ActionList MBraceRight MSemicolon
                                   | IdentifierList MSpecalArrows1  BehaviorGuard MSpecalArrows2 Id MBraceLeft ActionList MBraceRight MSemicolon

  syntax BehaviorGuard ::= BehaviorEvent
                         | Mon Expression MDArrows BehaviorEvent
                         | BehaviorEvent Mwhen Expression
                         | Mon Expression MDArrows BehaviorEvent Mwhen Expression
                         | Expression

  syntax BehaviorEvent ::= CalledSubPgm MSigh 
                         | Id MQuestion
                         | CalledSubPgm MSigh BehaviorParameterBindings
                         | Id MQuestion BehaviorParameterBindings

  syntax BehaviorParameterBindings ::= Expression
                                     | Expression MArrows Id
                                     | Expression MComma BehaviorParameterBindings
                                     | Expression MArrows Id MComma BehaviorParameterBindings

//-----------------------------------------------------------------------------------------------------------------------------------

  syntax CompositeDecl ::= Mcomposite Mhistory Mstates BehaviorStateList Mtranstitions BehaviorStateTransitionList CompositeDeclList Mend Id MSemicolon
                         | Mcomposite Mhistory Mstate Id Mstates BehaviorStateList Mtranstitions BehaviorStateTransitionList CompositeDeclList Mend Id MSemicolon
                         | Mcomposite Mhistory Mmode Id  Mstates BehaviorStateList Mtranstitions BehaviorStateTransitionList CompositeDeclList Mend Id MSemicolon
     
//-----------------------------------------------------------------------------------------------------------------------------------
                                                                                       
endmodule
