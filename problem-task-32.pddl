;The agent starts at the BAR
;There is an unserved customer at LB
;There is an empty glass at BAR
;There is a broom at BAR
;There is broken glass at MF and MB
(define (problem bar-22) ; Replace XX with task number
    (:domain bartending)
    (:objects 
           BAR UF MF LF UB MB LB - location
           glass - Glasses
           customer - Customers
           Agent - bartender
           broom - Broom
           

    )

    (:init   ;Agent(agent) ∧ In(agent,Bar) ∧ Glass(glass) ∧ Customer(customer) ∧ In(customer,UF) ∧ Unserved(customer) ∧ In(glass,Bar) ∧ Empty(glass) ∧ Adjacent(Bar,UF)
       
        (Adjacent BAR UF)
        (Adjacent UF MF)
        (Adjacent MF LF)
        (Adjacent LF LB)
        (Adjacent LB MB)
        (Adjacent MB UB)
        (Adjacent UB UF) 
        
        (Adjacent UF BAR )
        (Adjacent MF UF )
        (Adjacent LF MF )
        (Adjacent  LF LB)
        (Adjacent  LB MB )
        (Adjacent UB MB )
        (Adjacent UF UB ) 
        
        (In Agent BAR)
        
        (In customer LB)
        
        (In glass BAR)
        (Empty glass)
        
        (In broom BAR)
        (nobrokenGlasses BAR)
        (nobrokenGlasses UB)
        (nobrokenGlasses UF)
        (nobrokenGlasses LB)
        (nobrokenGlasses LF)

        (hasbrokenGlasses MF)
        (hasbrokenGlasses MB)
        (Free Agent)
        
        (Unserved customer)
      
    )
    
    (:goal (and 
        
        (Served customer)
        (In Agent BAR)
        (not (exists (?f - location) (hasbrokenGlasses ?f)))
        ;
    ))
)

;All customers are served
;The agent is at the BAR
;There is not any broken glass on any part of the floor



