program modulos;

####### COSAS #########
procedure porcentaje
	procentaje := (x * i) div 100;
	
procedure seDispone
type

  entrada = record
    titulo: String[30];
    horario: String[20];
    precio: real;
  end;

  lista = ^nodo;

  nodo = record
    dato: entrada;
    sig: lista;
  end;

  vectorLista = array[dias] of lista;

procedure cargarEntradas(var vl:vectorLista); // Se dispone
begin
end;

########### CONST ###########
const 
	dimF = 20;

################ TYPE ################

############ STRING ############
cadena = string [20];    

############# LISTAS #############
procedure Lista
type
	lista = ^nodo;
	
	nodo = record
		dato: producto;
		sig: lista;
	end;

	listaMerge = ^nodoMerge;
	
	nodoMerge = record
		dato: pelicula;
		sig: listaMerge;
	end;

####### ARBOLES ######
procedure arbol
	arbol = ^nodo;
  
	nodo = record
		dato: integer;
		hi: arbol;
		hd: arbol;
	end;

####### VECTOR #######
procedure vector
vector = array [1..dimF] of dato;

############### PROCESOS #################
####### LISTA #######
procedure agregarAdelante (var l:lista; p:persona);
var 
	nue:lista;
begin 
	new(nue); nue^.dato := p; nue^.sig := nil;
	if (l = nil) then
		l := nue
	else
		nue^.sig := l;
	l := nue;
end;
   
procedure agregarAtras (var l,ult:lista; p:pelicula);
var
	nue:lista;
begin
	new(nue); nue^.dato := p; nue^.sig := nil;
	if(l = nil)then
		l := nue
	else
		ult^.sig := nue;
	ult := nue;
end;

procedure agregarOrdenado (var l:lista ; pe:pelicula);
var
	ant,act,nue: lista;
begin
	new(nue);
	nue^.dato := pe;
	act := l;
	while (act <> nil) and (nue^.dato.codPeli > act^.dato.codPeli) do begin
		ant := act;
		act := act^.sig;
	end;
	if (act = l) then begin
		l := nue
	end
	else 
		ant^.sig := nue;
	nue^.sig := act;
end;

procedure leer (var p:pelicula);
begin
	write ('codigo: ');
	readln (p.codPeli);
	if (p.codPeli <> -1) then begin
		write ('genero: ');
		readln (p.codGenero);
		write ('puntaje: ');
		readln(p.puntProme);
	end
end;  

procedure imprimirLista (l:lista);
begin
	while (l <> nil) do begin
		writeln('el codigo de pelicula es: ',l^.dato.codPeli);
		l:= l^.sig;
	end;
end;

######## ARBOLES #########
procedure agregarArbol (var a:arbol; num:integer); //Insertar en Arbol
begin
	if (a = nil) then begin
		new(a);
		a^.dato := num; 
		a^.hi := nil; 
		a^.hd := nil;
	end
	else
		if (num < a^.dato) then 
			agregarArbol(a^.hi,num)
		else
			agregarArbol(a^.hd,num);   
end;


cprocedure copiarRecords(r:asistencia; var n:asistenciaN);
begin
	n.dni:= r.dni;
    n.codigo:= r.codigo;
    n.minutos:= r.minutos;
end;


######### VECTORES Y VECTORES DE LISTAS #########


procedure busquedaBinaria (var v:vector; dimL:integer; x:integer; var posi:integer);
var 
    pri, ult, medio : integer;
begin
    pri:= 1;  ult:= dimL;  medio:= (pri + ult ) div 2 ;
    While (pri <= ult) and (x <> v[medio]) do begin
		if ( x < v[medio] ) then 
			ult:= medio -1
		else 
			pri:= medio +1 ;
		medio:= ( pri + ult ) div 2 ;
    end;
    if (pri <= ult) and (x = v[medio]) then 
		posi:= medio
	else
		posi:= 0;
end;

procedure agregElemVector(var v:vector; var dimL:integer; var x:elemento; var pude:boolean);
begin
	if(dimL < dimF) do begin
		v[dimL +1] := x;
		dimL := dimL +1;
		pude := true;
	end;
end;


function buscarVectorDesorden (v:vector; dimL:integer; x:integer): integer;
var
	i:integer; encontre: boolean;
begin
	encontre := false;
	while (i <= dimL and (not encontre)) do begin
		if(v[i] = x) then begin
			encontre := true;
			buscar := i;
		end
		else
			i := i +1;
	end;
	if (not encontre) then
		buscar := 0
end;


procedure vectorAgregarElemento(var v:vector; var dimL:integer; var x:elemento; var pude:boolean; pos:integer);
begin
	if((dimL < dimF) and (pos > 0) and (pos <= dimL)) do begin
		for i := dimL downto pos
			v[i +1] := v[i];
		v[pos] := x;
		dimL := dimL +1;
		pude := true;
	end;
end;


procedure vectorlimElemEnPos(var v:vector; var dimL:integer; var pude:boolean; pos:integer);
begin
	if((pos > 0) and (pos <= dimL)) do begin
		for i := pos to dimL -1
			 v[i] := v[i +1];
		dimL := dimL -1;
		pude := true;
	end;
end;


procedure iniciarVectorLista (var vl:vectorLista);
var
	i:integer;
begin
	for i:= 1 to dimF do
		vl[i]:= nil;
end;   


procedure cargarEstructura (var vl:vectorLista);
var
	e:entrada;
begin
	writeln ('Ingrese -1 para finalizar la lectura');
	leer(e);
	while (e.codObra <> 0) do begin
		agregarOrdenado (vl[e.dia],e);
		writeln ('Se ha cargado con exito');
		writeln (' ');
		leer(e);
	end;
end;


procedure ordenarVectorInsercion (var v:vector; diml:integer);
var
	i:integer; act:producto; ant:integer;
begin	
	for i := 2 to diml do begin 
		act := v[i];
		ant := i-1;
			while (ant > 0) and (vp[ant].precio > act.precio) do begin
				v[ant +1] := v[ant];
				ant := ant -1;
			end;
			v[ant +1]:= act;
	end;
end;


Procedure ordenarVectorSeleccion ( var unVector: vector; dimL: integer );

var i, j, p: integer; item : tipoElem;	
		
begin
	for i:=1 to dimL-1 do begin {busca el mínimo y guarda en p la posición}
		p := i;
		for j := i+1 to dimL do
			if unVector[j] < unVector[p] then 
				p:=j;
         {intercambia v[i] y v[p]}
		item := unVector[p];   
		unVector[p] := unVector[i];   
		unVector[i] := item;
	end;
end;


procedure imprimirVector (v:vector; dimL:integer);
var
	i:integer;
begin
	for i:= 1 to dimL do
		writeln('en la posicion: ', i, '; el numero es: ', v[i])
end;


procedure imprimirVectorLista (vl:vectorLista);
var
	i:integer;
begin
	for i:= 1 to dimF do begin
		writeln('');
		writeln('en la posicion: ', i);
		while (vl[i] <> nil) do begin
			writeln('el codigo de obra es: ', vl[i]^.dato.codObra);
			vl[i]:= vl[i]^.sig;
		end;
	end;
end;


################# MARGE ######################
procedure miniMergeAcomu (var vl:vectorLista; var codproducto:integer; var cantVendida:integer);
var
	indiceMin,i:integer;
Begin
	indiceMin:= -1; 
	codproducto := 9999;
	for i:= 1 to dimF do begin
		if (vl[i] <> nil) then 
			if (vl[i]^.dato.codPro <= codproducto) then begin
				codproducto := vl[i]^.dato.codPro;
				indiceMin := i;  
			end;  
	end; 
	if (indiceMin <> -1) then begin
		cantVendida := vl[indiceMin]^.dato.cantVendida;
		vl[indiceMin] :=  vl[indiceMin]^.sig;
	end;
end;

procedure mergeAcomulador (vl:vectorLista; var l,ult:listaMerge);
var
	cantVendida:integer; codproducto:integer; ventastotales:integer; vM:ventaMerge; actual:integer;
begin
	l:= nil; 
	ult := nil;
	miniMergeAcomu (vl, codproducto, cantVendida); //le envio el vector con la lista y los valores que necesito que me devuelva
	while (codproducto <> 9999) do begin           //si el vector no esta vacio al inicio y hasta que lo este comienzo
		actual := codproducto;                      //actual es la variable que guardare en el record y se enviara a la nueva lista
		ventastotales := 0;                         //suma total de los valores que tambien guardare en el record y enviare a la nueva lista
		while ((codproducto <> 9999) and (codproducto = actual) ) do begin
			ventastotales := ventastotales + cantVendida;
			miniMergeAcomu (vl,codproducto,cantVendida);
		end;
		vM.codPro := actual;           //agrego los datos que necesita la nueva lista al record y se lo envio
		vM.canTotalVendida := ventastotales;
		agregarAtras (l,ult,vM);
	end;
end;



Procedure minimoMerge (var pV:peliculas; var codigoPeli:integer; var p2:pelicula);
Var
	indiceMin,i:integer;
Begin
	indiceMin:= -1; 
	codigoPeli := 9999;
	for i:= 1 to dimF do begin
		if (pV[i] <> nil) then 
			if (pV[i]^.dato.codPeli < codigoPeli) then begin
				codigoPeli := pV[i]^.dato.codPeli;
				indiceMin := i;  
			end
	end; 
	if (indiceMin <> -1) then begin
		p2.codPeli := pV[indiceMin]^.dato.codPeli;
		p2.codGenero := pV[indiceMin]^.dato.codGenero;
		p2.puntProme := pV[indiceMin]^.dato.puntProme;
		pV[indiceMin] :=  pV[indiceMin]^.sig;
	end;
end;


procedure merge (pV:peliculas; var l,ult:listaMerge);
var
	codigoPeli:integer; p2:pelicula;
begin
	l:= nil; 
	ult:= nil;
	minimoMerge (pV, codigoPeli, p2);
	while (codigoPeli <> 9999) do begin
		agregarAtras (l,ult,p2);
		minimoMerge (pV, codigoPeli, p2);
	end;
end;


####### IMPRIMIR RECURSIVO ########

procedure imprimirPreOrden (a:arbol)
begin
	if (a <> nil) then begin
		writeln (a^.dato);
		impPreOrden(a^.hi);
		impPreOrden(a^.hd);
	end;
end;


procedure imprimirEnOrden (a:arbol)
begin
	if (a <> nil) then begin
		imprimirEnOrden(a^.hi);
		writeln (a^.dato);
		imprimirEnOrden(a^.hd);
	end;
end;


procedure imprimirPosOrden (a:arbol)
begin
	if (a <> nil) then begin
		impPosOrden(a^.hi);
		impPosOrden(a^.hd);
		writeln (a^.dato);
	end;
end;

procedure imprimirRecursivo (l:lista);
begin
	if (l <> nil) then begin
		write ('el codigo de la pelicula es: ',l^.dato.cod);
		l:= l^.sig;
		imprimirRecursivo (l);
	end;
end;

########## MAXIMO/MINIMO ARBOLES #########

procedure BuscarMinArbol (a:arbol); {inti - adaptado} 
begin 
	if (a^.hi = nil ) then
		writeln('la nota con menor contabilidad encontrada es: ', a^.dato.notaExamen,' y se contabilizo ',a^.dato.contabilidad,' vez.')
	else
		BuscarMinArbol(a^.hi);
end;


procedure BuscarMaxArbol (a:arbol); {inti - adaptado}
begin
	if (a^.hd = nil ) then
		writeln('la nota con mayor contabilidad encontrada es: ', a^.dato.notaExamen,' y se contabilizo ',a^.dato.contabilidad,' vez.')
    else
		BuscarMaxArbol(a^.hd);
end;


procedure arbolMin (a:arbol; var min:integer);
begin
	if (a <> nil) then 
		if (a^.dato > max) and (a <> nil) then begin
			max := a^.dato;
			maximoMinimo (a^.hd, max/min);
		end;
end;


procedure buscarEnArbol (a:arbol);
var
	x:conca; cant:integer;
begin
	writeln('Ingrese una marca para buscarla');
	readln(x); 
	cant:= 0;
	recorrerArbolPreguntando(a,cant,x);
	writeln('la cantidad de autos con esa marca es: ',cant);
end;


procedure recorrerArbolPreguntando (a:arbol; var cant:integer; x:conca);
begin
	if(a <> nil) then begin
		if(a^.dato.marca = x) then
			cant:= cant +1;
		recorrerArbol(a^.hi,cant,x);
		recorrerArbol(a^.hd,cant,x);
	end;
end;


procedure recorrerArbolCreandoListaDificil (a:arbol; dni:integer; var l:lista; var ult:lista);
var
begin
	if(a<>nil) then begin
		if(a^.dato.dni > dni) then begin
			agregarAtras(l,ult, a^.dato);
			recorrerArbol(a^.hi, dni, l, ult);
		end
		recorrerArbol(a^.hd, dni, l, ult);
	end;
end;


procedure recorrerArbolCreandoListaFacil (a:arbol; var l:lista);
begin
	if(a <> nil) then begin
		agregarAdelante (l,a^.dato);
		recorrerArbolLista(a^.hi, vl);
		recorrerArbolLista(a^.hd, vl);
	end;
end;


procedure recorrerArbolRango (a:arbol);
begin
	if(a<>nil) then begin
		if (a^.dato.legajo > 2803) and (a^.dato.legajo < 6982) then begin
			writeln(a^.dato.nomyApe);
			recorrerArbolRango(a^.hi);
		end
		else
			if(a^.dato.legajo > 6982) then
				recorrerArbolRango(a^.hi);
		recorrerArbolRango(a^.hd);
	end;
end;

################# FUNCIONES #####################
Procedure funcion
function funcionBuscarArbol (a:arbol; x:elemento): arbol; 
begin
	if (a = nil) then 
		funcionBuscarArbol:= nil
	else 
		if (x = a^.dato) then 
			funcionBuscarArbol:= a
		else 
			if (x < a^.dato) then 
				funcionBuscarArbol:= funcionBuscarArbol(a^.hi ,x)
			else  
				funcionBuscarArbol:= funcionBuscarArbol(a^.hd ,x)
end;

    

function funcionRecursiva (num:integer; n:integer): integer;
var
	pot:integer;
begin
	if (n = 0) then 
		potencia:= 1;
	else
		potencia:= num * funcion_recursiva(num, n(-1)) 
end;



function dniParOImpar (dni: integer): boolean;
var
    par, impar, dig: integer;
begin
    par := 0; impar := 0;
    while (dni <> 0) do begin
       dig := dni mod 10;
       if ((dig mod 2) = 0) then
          par := par + 1
       else
          impar := impar + 1;
       dni := dni div 10;
    end;
    if(par > impar) then
       dniParOImpar := true
    else
       dniParOImpar := false
end;
