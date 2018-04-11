(*
                         Custom example graph
                          CS51 Problem Set 7
                         -.-. ... ..... .----
 *)

open List ;;

open Points ;;
open Masses ;;
open Controls ;;
open Graphobj ;;
open Graphdraw ;;

let example () : unit =
  (* masses *)
  let ma = new mass 30. 45. 1. in
  let mb = new mass 135. 90. 1. in
  let mc = new mass 180. 75. 1. in
  let md = new mass 270. 60. 1. in
  let me = new mass 300. 15. 1. in
  let mf = new mass 420. 45. 1. in
  let mg = new mass 405. 120. 1. in
  (* constraints *)
  let c1 = (new positionspring ~stiffness: (CS51.const 0.001) ma 
  		    (new point 420. 420.) :> control) in
  let c2 = (new positionspring ~stiffness: (CS51.const 0.001) mb 
  	        (new point 360. 435.) :> control) in
  let c3 = (new positionspring ~stiffness: (CS51.const 0.001) mc 
  	        (new point 300. 420.) :> control) in
  let c4 = (new positionspring ~stiffness: (CS51.const 0.001) md 
  	        (new point 255. 360.) :> control) in
  let c5 = (new positionspring ~stiffness: (CS51.const 0.001) me 
  	        (new point 210. 390.) :> control) in
  let c6 = (new positionspring ~stiffness: (CS51.const 0.001) mf
            (new point 180. 330.) :> control) in
  let c7 = (new positionspring ~stiffness: (CS51.const 0.001) mg 
  	        (new point 225. 315.) :> control) in
  (* the scene: nodes *)
  let sa = new circle ~label:"a" ~col:(Graphics.yellow) (ma :> point) 10 in
  let sb = new circle ~label:"b" ~col:(Graphics.yellow) (mb :> point) 10 in
  let sc = new circle ~label:"c" ~col:(Graphics.yellow) (mc :> point) 10 in
  let sd = new circle ~label:"d" ~col:(Graphics.yellow) (md :> point) 10 in
  let se = new circle ~label:"e" ~col:(Graphics.yellow) (me :> point) 10 in
  let sf = new circle ~label:"f" ~col:(Graphics.yellow) (mf :> point) 10 in
  let sg = new circle ~label:"g" ~col:(Graphics.yellow) (mg :> point) 10 in
  (* ... edges *)
  let sh = new edge ~col:cBLACK (ma :> point) (mb :> point) in
  let si = new edge ~col:cBLACK (mb :> point) (mc :> point) in
  let sj = new edge ~col:cBLACK (mc :> point) (md :> point) in
  let sk = new edge ~col:cBLACK (md :> point) (mg :> point) in
  let sl = new edge ~col:cBLACK (md :> point) (me :> point) in
  let sm = new edge ~col:cBLACK (me :> point) (mf :> point) in
  let sn = new edge ~col:cBLACK (mf :> point) (mg :> point) in
  (* ... and boxed zones *)
  let pts = [(ma :> point); (mb :> point); (mc :> point); (md :> point); 
  			 (me :> point); (mf :> point); (mg :> point)] in
  let z1 = new zone ~label:"Big Dipper to Little Dipper" pts in

  (* solve it *)
  x11_solve [ma; mb; mc; md; me; mf; mg]
      	    ([c1; c2; c3; c4; c5; c6; c7] :> control list)
            [sa; sb; sc; sd; se; sf; sg; sh; si; sj; sk; sl; sm; sn; z1] ;;

let _ = example () ;;
