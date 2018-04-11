all: points masses graphobj testalign testgraphs testuniformcentered example

points: points.ml
	ocamlbuild points.byte	

masses: masses.ml
	ocamlbuild masses.byte	

graphobj: graphobj.ml
	ocamlbuild graphobj.byte		

testalign: testalign.ml
	ocamlbuild testalign.byte		

testgraphs: testgraphs.ml
	ocamlbuild testgraphs.byte

testuniformcentered: testuniformcentered.ml
	ocamlbuild testuniformcentered.byte	

example: example.ml
	ocamlbuild example.byte	

clean:
	rm -rf _build *.byte