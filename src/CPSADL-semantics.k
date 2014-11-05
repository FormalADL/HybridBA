require "CPSADL.K"
require "Configuration.k"

module CPSADL-SEMANTICS
   import CPSADL
   import CONFIGURATION

   syntax KResult ::= #Int | #Bool | StateKeyword
   
   rule ComPrev:CmpClassifierDecl ComNext:CmpClassifierDecl => ComPrev ~> ComNext  [structural]
   
   rule <system>
             ...
             <component>... <k> system Sysid : Id CmpAD : CmpAssocDef end Sysid ; => . ...</k> ...</component>
             ...
        </system>
        (. => <system> 
			<systemid> 
				id |-> Sysid 
				category |-> system
			</systemid>  
			... 
			<component>... <k> CmpAD </k>... </component>
			...
		</system> 
		)
   rule <system>
             ...
             <component>... <k> system Sysid : Id end Sysid ; => . ...</k> ...</component>
             ...
        </system>
        (. => <system> 
			<systemid> 
				id |-> Sysid 
				category |-> system
			</systemid>  
			... 
			<component>... <k> . </k>... </component>
			...
		</system> 
		)
   rule <system>
             ...
             <component>... <k>  ComponentType : CmpCategoryType ComponentCategory : CPSNewCmpCategory Componentid : Id CmpAD : CmpAssocDef end Componentid ; => . ...</k> ...</component>
             ...
        </system>
        (. => <system>
            ...
            <component>
               <componentid>
                   id |-> Componentid
                   type |-> CmpCategoryType
                   category |-> CPSNewCmpCategory
               </componentid>
               <k> CmpAD </k>
               ...
            </component>
            ...
        </system>
        )
   rule <system>
             ...
             <component>... <k>  ComponentType : CmpCategoryType ComponentCategory : CPSNewCmpCategory Componentid : Id end Componentid ; => . ...</k> ...</component>
             ...
        </system>
        (. => <system>
            ...
            <component>
               <componentid>
                   id |-> Componentid
                   type |-> CmpCategoryType
                   category |-> CPSNewCmpCategory
               </componentid>
               <k> . </k>
               ...
            </component>
            ...
        </system>
        )
endmodule