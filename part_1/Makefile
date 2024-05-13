OC = ocamlopt
OCFLAGS = -verbose
OB = ocamlc
OBFLAGS = -verbose
SRC_LIST = fact.ml
REMOVE_LIST = *.cmx *.cmi *.o *.out *.cmo *.cmxa *.a

build_opt: 
	$(OC) $(SRC_LIST) $(OCFLAGS)
build_c: 
	$(OB) $(SRC_LIST) $(OBFLAGS)
clean:
	rm -f $(REMOVE_LIST)