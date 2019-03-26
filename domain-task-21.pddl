(define (domain bartending)
    (:requirements :adl )
    
    (:types
        bartender
        location
        ;; Fill in additional types here
        Customers
        Glasses
    )
    
    (:constants 
        ;; You should not need to add any additional constants
        Agent - bartender
        BAR - location
    )
    
    (:predicates
        
        ;1.1 the predicates used to describe the map.
        (Area ?x - location)
        (Adjacent ?x - location ?y - location)
        
        
        ;1.2 the predicates used to keep track of the Location an agent, glass or customer is At.
        (In ?x - object ?y - location)
        (Free ?x - bartender)
        (Hold ?x - bartender ?y - Glasses)
       
        ;1.3 the predicates used to model a Glass and, in particular, whether or not it Contains Beer.
        (Glass ?x - Glasses)
        (hasBeer ?x - Glasses)
        (Empty ?x - Glasses)
         
        ;1.4 Define the predicates you will need to model a Customer, and whether or not that customer has been Served
        (Customer ?x - Customers)
        (Served ?x - Customers)
        (Unserved ?x - Customers)
        
    )
    
    
    (:action Pickupglass   ;The agent can Pick up a glass. Note, an agent can only hold one glass at a time, so if it is currently Holding a glass, it will be unable to pick up another.
        :parameters   
        (?Agent - bartender ?glass -Glasses ?room -location)                     
        
        :precondition(
            and (In ?glass ?room)   (In Agent ?room) (Free Agent)                 
        ) 
                       
        :effect(       
            and (Hold Agent ?glass)  (not (Free Agent)) (not (In ?glass ?room) )
        )
        
    )
    
    
    (:action handover   ; The agent can Hand over a glass of beer to a customer that is in the same location as the agent, after which a customer should be said to be Served
        :parameters
        (?Agent - bartender ?glass - Glasses ?customer - Customers ?room - location)     
        
        :precondition( 
            and  (Hold Agent ?glass)  (In ?customer ?room)                   
            (In Agent ?room)   (hasBeer ?glass) (Unserved ?customer)               
        ) 
                       
        :effect       
            (and  (Served ?customer)  (not (Hold Agent ?glass)) (Free Agent)   (not (Unserved ?customer)) 
        )
    )
   
    
    (:action Pour  ;At the BAR, the agent can Pour beer into a glass that it is Holding if the glass does not already Contain Beer
        :parameters   
        (?Agent - bartender ?glass - Glasses)                     
        :precondition(and (In Agent Bar)   (Empty ?glass) (Hold Agent ?glass )     ) 
        :effect      (and (hasBeer ?glass) (not (Empty ?glass)) )
    )
    

    (:action Move  ; The agent can Move from its current location to an Adjacent one.
        :parameters                                                             
        (?Agent - bartender ?area1 - location ?area2 - location)                
        
        :precondition(
            and (In Agent ?area1)  (Adjacent ?area1 ?area2)             
        ) 
                       
        :effect(
            and  (In Agent ?area2) (not (In Agent ?area1))                   
        )
    )
)