;The agent cannot Move into an area if it contains Broken Glass.
;The agent can remove broken glass from an area by Sweeping it Up. To sweep up, the agent
;must be At an adjacent location to the broken glass, and must be Holding a Broom
;The agent cannot hold a glass and the broom at the same time, so must Put Down one item to
;Pick Up the other.

(define (domain bartending)
    (:requirements :adl )
    
    (:types
        bartender
        location
        ;; Fill in additional types here
        Customers
        Glasses
        brokenGlasses
        Broom
    )
    
    (:constants 
        ;; You should not need to add any additional constants
        Agent - bartender
        BAR - location
    )
    
    (:predicates
        
        ;1.1
        (Area ?x - location)
        (Adjacent ?x - location ?y - location)
        
        
        ;1.2 
        (In ?x - object ?y - location)
        (Free ?x - bartender)
        (Hold ?x - bartender ?y - object)
       
        ;1.3 
        (Glass ?x - Glasses)
        (hasBeer ?x - Glasses)
        (Empty ?x - Glasses)
         
        ;1.4
        (Customer ?x - Customers)
        (Served ?x - Customers)
        (Unserved ?x - Customers)
        
        ;3.1 
        (hasbrokenGlasses ?x - location)
        (nobrokenGlasses ?x - location)
        (hasBroom ?x - bartender)
     
    )
    
    (:action Pickupglass   
        :parameters   
        (?glass -Glasses ?room -location)
        :precondition(
            and (In ?glass ?room)   (In Agent ?room) (Free Agent)                 
        ) 
        :effect(       
            and (Hold Agent ?glass)  (not (Free Agent)) 
        )
    )
  
    
    
    (:action handover
        :parameters
        (?glass - Glasses ?customer - Customers ?room - location)     
        
        :precondition( 
            and  (Hold Agent ?glass)  (In ?customer ?room)                   
            (In Agent ?room)   (hasBeer ?glass) (Unserved ?customer)               
        ) 
                       
        :effect       
            (and  (Served ?customer)  (not (Hold Agent ?glass))   (Free Agent)   (not (Unserved ?customer)) 
        )
    )

    (:action Pour
        :parameters   
        (?glass - Glasses)                     
        :precondition(and (In Agent Bar)   (Empty ?glass) (Hold Agent ?glass )     ) 
        :effect      (and (hasBeer ?glass) (not (Empty ?glass)) )
    )
    
  
    (:action Move
        :parameters                                                             
        ( ?area1 - location ?area2 - location)                
        
        :precondition(
            and (In Agent ?area1)  (Adjacent ?area1 ?area2) (nobrokenGlasses ?area2)         
        ) 
                       
        :effect(
            and  (In Agent ?area2) (not (In Agent ?area1))                   
        )
    )
    
    (:action Sweepup
        :parameters                                                             
        ( ?area1 - location ?area2 - location)                
        
        :precondition(
            and (In Agent ?area1)  (Adjacent ?area1 ?area2) (hasbrokenGlasses ?area2)  (hasBroom Agent)       
        ) 
                       
        :effect(
            and (nobrokenGlasses ?area2) (not (hasbrokenGlasses ?area2))                   
        )
    )
    
    (:action dropglass
        :parameters                                                             
        ( ?room - location   ?glass - Glasses)                
        
        :precondition(
            and (In Agent ?room) (Hold Agent ?glass)      
        ) 
                       
        :effect(
            and (Free Agent) (not (Hold Agent ?glass)) (In ?glass ?room)                  
        )
    )
    
    
    (:action dropBroom
        :parameters                                                             
        ( ?room - location   ?b - Broom)                
        
        :precondition(
            and (In Agent ?room) (Hold Agent ?b)      
        ) 
                       
        :effect(
            and (Free Agent) (not (Hold Agent ?b)) (In ?b ?room)                  
        )
    )
    
    
    (:action fetchBroom
        :parameters                                                             
        ( ?area1 - location   ?b - Broom)                
        
        :precondition(
            and (In Agent ?area1)  (In ?b BAR) (Free Agent)  
        ) 
                       
        :effect(
           and (hasBroom Agent) (Hold Agent ?b) (not (Free Agent))                   
        )
    )
)