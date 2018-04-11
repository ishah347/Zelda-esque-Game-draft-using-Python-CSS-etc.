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

let _ =
  let a = new point 3. 4. in
  let b = new point (-4.) (-3.) in
  let c = new point 0. 0. in
  let d = new point 2.4 2.5 in
  let d1 = new point 2.49 2.51 in
  let e = new point (-2.4) (-2.5) in
  assert(a#x = 3.) ;
  assert(a#y = 4.) ;
  assert(b#x = (-4.)) ;
  assert(b#y = (-3.)) ;
  assert(c#x = 0.) ;
  assert(c#y = 0.) ;
  assert(a#pos = (3., 4.)) ;
  assert(b#pos = ((-4.), (-3.))) ;
  assert(c#pos = (0., 0.)) ;
  assert(a#round = (3, 4)) ;
  assert(d#round = (2, 3)) ;
  assert(d1#round = (2, 3)) ;
  assert(e#round = ((-2), (-3))) ;
  let _ = d#move a in
  assert(d#pos = (3., 4.)) ;
  let _ = d1#move b in
  assert(d1#pos = ((-4.), (-3.))) ;
  let _ = e#move c in
  assert(e#pos = (0., 0.)) ;
  assert((a#scale 2.)#pos = (6., 8.)) ;
  assert((a#scale 0.5)#pos = (1.5, 2.)) ;
  assert((a#scale (-1.))#pos = ((-3.), (-4.))) ;
  assert((b#scale (-1.))#pos = (4., 3.)) ;
  assert((b#scale 0.)#pos = (0., 0.)) ;
  assert((c#scale (-1.))#pos = (0., 0.)) ;
  assert((c#scale 0.)#pos = (0., 0.)) ;
  assert((c#scale 1.)#pos = (0., 0.)) ;
  assert((a#plus b)#pos = ((-1.), 1.)) ;
  assert((a#plus a)#pos = (6., 8.)) ;
  assert((b#plus b)#pos = ((-8.), (-6.))) ;
  assert((b#plus c)#pos = ((-4.), (-3.))) ;
  assert((c#plus c)#pos = (0., 0.)) ;
  assert((a#minus b)#pos = (7., 7.)) ;
  assert((a#minus a)#pos = (0., 0.)) ;
  assert((b#minus a)#pos = ((-7.), (-7.))) ;
  assert((b#minus b)#pos = (0., 0.)) ;
  assert((b#minus c)#pos = ((-4.), (-3.))) ;
  assert((c#minus c)#pos = (0., 0.)) ;
  assert(a#norm = 5.) ;
  assert(b#norm = 5.) ;
  assert(c#norm = 0.) ;
  assert(a#distance a = 0.) ;
  assert(a#distance c = 5.) ;
  assert(a#distance b = 7. *. sqrt(2.)) ;
  assert(b#distance b = 0.) ;
  assert(b#distance c = 5.) ;
  assert(((a#unit_vector)#x >= 0.6) && ((a#unit_vector)#x < 0.60001)) ;
  assert(((a#unit_vector)#y >= 0.8) && ((a#unit_vector)#y < 0.80001)) ;
  assert(((b#unit_vector)#x <= (-0.8)) && ((b#unit_vector)#x > (-0.80001))) ;
  assert(((b#unit_vector)#y <= (-0.6)) && ((b#unit_vector)#y > (-0.60001))) ;
  assert((((a#plus b)#unit_vector)#x < (-0.70710)) &&
    (((a#plus b)#unit_vector)#x > (-0.70711))) ;
  assert((((a#plus b)#unit_vector)#y > 0.70710) &&
    (((a#plus b)#unit_vector)#y < 0.70711))

(*======================================================================
Time estimate

Please give us an honest (if approximate) estimate of how long (in
minutes) each part of the problem set took you to complete.  We care
about your responses and will use them to help guide us in creating
future assignments.
......................................................................*)

let minutes_spent_on_part () : int = 30 ;;
