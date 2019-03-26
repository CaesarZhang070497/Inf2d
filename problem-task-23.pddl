(define (problem bar-22) ; Replace XX with task number
    (:domain bartending)
    (:objects 
           BAR UF MF LF UB MB LB - location
           glass1 - Glasses
           glass2 - Glasses
           customer1 - Customers
           customer2 - Customers
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
        
        (In Agent MF)             ; The agent starts at MF
        
        (In glass1 MB)            ; There is one empty glass at MB and another at LB
        (In glass2 LB)            ; There are two customers—One at UB and one at LF
        (Empty glass1)
        (Empty glass2)
        
        
        (Free Agent)
        (In customer1 UB)
        (In customer2 LF)
        
        (Unserved customer1)
        (Unserved customer2)
      
    )
    
    (:goal (and                   ; The goal is that both customers are served, and the agent is at the BAR.
        (Served customer1)
        (In Agent BAR)
        ;(Hold Agent glass2)
        ;(hasBeer glass1)
        
        (Served customer2)
    ))
    
)