(define (problem bar-22) ; Replace XX with task number
    (:domain bartending)
    (:objects 
           BAR UF MF LF UB MB LB - location
           glass - Glasses
           customer - Customers
           Agent - bartender
    )
    
    (:init   ;Agent(agent) ∧ In(agent,Bar) ∧ Glass(glass) ∧ Customer(customer) ∧ In(customer,UF) ∧ Unserved(customer) ∧ In(glass,Bar) ∧ Empty(glass) ∧ Adjacent(Bar,UF)
        (Adjacent BAR UF)
        (Adjacent UF MF)
        (Adjacent MF LF)
        (Adjacent LF LB)
        (Adjacent LB MB)
        (Adjacent MB UB)
        (Adjacent UB UF) 
        
        (Adjacent UF BAR)
        (Adjacent MF UF )
        (Adjacent LF MF )
        (Adjacent LF LB )
        (Adjacent LB MB )
        (Adjacent UB MB )
        (Adjacent UF UB ) 
        
        (In Agent BAR)
        (In glass BAR)
        (Empty glass)
        (Free Agent)
        (In customer LB)
        (Unserved customer)
      
    )
    
    (:goal (and 
        ;(hasBeer glass)
        (Served customer)
    ))
)