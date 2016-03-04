Feature: POIs at the same location are grouped, called "stacking"         
  For a given list of POIs (for a same location)
  we display them together in a so-called "stack".

  Business rules:
   * Ordering: The POIs are sorted according the to priority of the POI category, highest left.
   * Length restriction: If there are more than three POIs the list is abbreviated and "..." are shown in the end.
   * Filtering: repeated icons are filtered (just shown once) and the "..." are shown.  

Scenario Outline: POI icons are 
    Given a POI sequence <input>
    When the POIs are stacked
    Then the POI icons in the stack are equal to <output sequence> 
     And the number of POI icons is less than 4
    
    Examples: initial examples with short input list
      | input        | output sequence |                    
      |  Z           |  Z              |                    
      |  A,B         |  A,B            |                    
      |  A,B,C       |  A,B, C         |                    

    Examples: POIs are ordered by priority of their category
      | input        | output sequence |                    
      |  Z,A,E       |  A,E,Z          |                    
      |  B,C,A       |  A,B,C          |                    

    Examples: More than three POI icons are abbreviated with dots.
      | input        | output sequence |                    
      |  A,B,C,D     |  A,B,...        |                    
      |  B,C,D,E,F,G |  B,C,...        |                    
      |  E,B,R,D     |  B,D,...        |           

    Examples: Scenario: Repeated POI categories are filtered.	 	 
      | input        | output sequence |
      |  A,B,B       |  A,B,...        |
      |  A,B,B,C     |  A,B,...        |
      |  B,B         |  B,...          |
      |  C,C,C       |  C,...          |

