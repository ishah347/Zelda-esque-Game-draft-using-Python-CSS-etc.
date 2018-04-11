(* 
                Mutable points with vector arithmetic
                          CS51 Problem Set 7
                         -.-. ... ..... .----
 *)

class point (x0 : float) (y0 : float) =   
object (this)
  val mutable x = x0
  val mutable y = y0
  
  method x : float = x
  method y : float = y

  method pos : float * float = x, y

  method round : int * int = 
    let round_up_or_down f = 
      if (abs_float f -. floor (abs_float f)) < 0.5 then int_of_float f
      else int_of_float (copysign (ceil (abs_float f)) f) in
    round_up_or_down x, round_up_or_down y

  method move (p : point) : unit =
  	x <- p#x;
  	y <- p#y

  method scale (f : float) : point = 
  	new point (x *. f) (y *. f)

  method plus (p : point) : point = 
  	new point (x +. p#x) (y +. p#y)

  method minus (p : point) : point = 
  	this#plus (p#scale (-1.))

  method norm : float = hypot x y
    
  method distance (p : point) : float = (this#minus p)#norm
  
  method unit_vector : point = this#scale (1. /. this#norm)

end ;;

(*======================================================================
Time estimate

Please give us an honest (if approximate) estimate of how long (in
minutes) each part of the problem set took you to complete.  We care
about your responses and will use them to help guide us in creating
future assignments.
......................................................................*)

let minutes_spent_on_part () : int = 30 ;;
