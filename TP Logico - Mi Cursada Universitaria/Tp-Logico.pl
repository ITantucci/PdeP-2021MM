% materia(Materia,HorasSemanales,Integradora).
%esCorrelativaDe(Materia,Correlativa).
:- discontiguous materia/2.
:- discontiguous esCorrelativaDe/2.
:- discontiguous curso/4.
:- discontiguous materiaAprobadasDe/2.
:- discontiguous rindioFinal/3.
:- discontiguous perfil/2.
:- discontiguous perfilQueCumple/2.
:- discontiguous esIntegradora/1. 
:- discontiguous rindioFinalLibre/3.
:- discontiguous anio/2.

% ############# BASE DE CONOCIMIENTO ############# %

materia(analisis_Matematico_I,5).

materia(algebra_y_Geometria_Analitica,5).

materia(matematica_Discreta,3).

materia(sistemas_y_Organizaciones,3).
esIntegradora(sistemas_y_Organizaciones).

materia(algoritmos_y_Estructuras_de_Datos,5).

materia(arquitectura_de_Computadoras,4).

materia(ingenieria_y_Sociedad,2).

materia(quimica,3).

materia(fisica_I,5).

materia(analisis_Matematico_II,5).
esCorrelativaDe(analisis_Matematico_II,analisis_Matematico_I).
esCorrelativaDe(analisis_Matematico_II,algebra_y_Geometria_Analitica).

materia(probabilidad_y_Estadistica,3).
esCorrelativaDe(probabilidad_y_Estadistica,analisis_Matematico_I).
esCorrelativaDe(probabilidad_y_Estadistica,algebra_y_Geometria_Analitica).

materia(analisis_de_Sistemas,6).
esIntegradora(analisis_de_Sistemas).
esCorrelativaDe(analisis_de_Sistemas,sistemas_y_Organizaciones).
esCorrelativaDe(analisis_de_Sistemas,algoritmos_y_Estructuras_de_Datos).

materia(sintaxis_y_Semantica_de_los_Lenguajes,4).
esCorrelativaDe(sintaxis_y_Semantica_de_los_Lenguajes,matematica_Discreta).
esCorrelativaDe(sintaxis_y_Semantica_de_los_Lenguajes,algoritmos_y_Estructuras_de_Datos).

materia(paradigmas_de_Programacion,4).
esCorrelativaDe(paradigmas_de_Programacion,matematica_Discreta).
esCorrelativaDe(paradigmas_de_Programacion,algoritmos_y_Estructuras_de_Datos).

materia(ingles_I,2).

materia(sistemas_de_Representacion,3).

materia(sistemas_Operativos,4).
esCorrelativaDe(sistemas_Operativos, matematica_Discreta).
esCorrelativaDe(sistemas_Operativos, algoritmos_y_Estructuras_de_Datos).
esCorrelativaDe(sistemas_Operativos, arquitectura_de_Computadoras).

materia(disenio_de_Sistemas,6).
esIntegradora(disenio_de_Sistemas).
esCorrelativaDe(disenio_de_Sistemas,analisis_de_Sistemas).
esCorrelativaDe(disenio_de_Sistemas,paradigmas_de_Programacion).

materia(fisica_II,5).
esCorrelativaDe(fisica_II,analisis_Matematico_I).
esCorrelativaDe(fisica_II,fisica_I).

materia(matematica_Superior,4).
esCorrelativaDe(matematica_Superior,analisis_Matematico_II).

materia(gestion_de_Datos,4).
esCorrelativaDe(gestion_de_Datos,analisis_de_Sistemas).
esCorrelativaDe(gestion_de_Datos,paradigmas_de_Programacion).
esCorrelativaDe(gestion_de_Datos,sintaxis_y_Semantica_de_los_Lenguajes).

materia(legislacion,2).
esCorrelativaDe(legislacion,analisis_de_Sistemas).
esCorrelativaDe(legislacion,ingenieria_y_Sociedad).

materia(economia,3).
esCorrelativaDe(economia,analisis_de_Sistemas).

materia(ingles_II,2).
esCorrelativaDe(ingles_II,ingles_I).

materia(redes_de_Informacion,4).
esCorrelativaDe(redes_de_Informacion,sistemas_Operativos).
esCorrelativaDe(redes_de_Informacion,comunicaciones).

materia(administracion_de_Recursos,6).
esIntegradora(administracion_de_Recursos).
esCorrelativaDe(administracion_de_Recursos,disenio_de_Sistemas).
esCorrelativaDe(administracion_de_Recursos,sistemas_Operativos).
esCorrelativaDe(administracion_de_Recursos,economia).

materia(investigacion_Operativa,5).
esCorrelativaDe(investigacion_Operativa,probabilidad_y_Estadistica).
esCorrelativaDe(investigacion_Operativa,matematica_Superior).

materia(simulacion,4).
esCorrelativaDe(simulacion,probabilidad_y_Estadistica).
esCorrelativaDe(simulacion,matematica_Superior).

materia(ingenieria_de_Software,3).
esCorrelativaDe(ingenieria_de_Software,probabilidad_y_Estadistica).
esCorrelativaDe(ingenieria_de_Software,disenio_de_Sistemas).
esCorrelativaDe(ingenieria_de_Software,gestion_de_Datos).

materia(teoria_de_Control,3).
esCorrelativaDe(teoria_de_Control,quimica).
esCorrelativaDe(teoria_de_Control,matematica_Superior).

materia(comunicaciones,4).
esCorrelativaDe(comunicaciones,arquitectura_de_Computadoras).
esCorrelativaDe(comunicaciones,analisis_Matematico_II).
esCorrelativaDe(comunicaciones,fisica_II).

materia(inteligencia_Artificial,3).
esCorrelativaDe(inteligencia_Artificial,investigacion_Operativa).
esCorrelativaDe(inteligencia_Artificial,simulacion).

materia(administracion_Gerencial,3).
esCorrelativaDe(administracion_Gerencial,administracion_de_Recursos).
esCorrelativaDe(administracion_Gerencial,investigacion_Operativa).

materia(sistemas_de_Gestion,4).
esCorrelativaDe(sistemas_de_Gestion,simulacion).
esCorrelativaDe(sistemas_de_Gestion,investigacion_Operativa).
esCorrelativaDe(sistemas_de_Gestion,administracion_de_Recursos).

materia(proyecto_Final,6).
esIntegradora(proyecto_Final).
esCorrelativaDe(proyecto_Final,legislacion).
esCorrelativaDe(proyecto_Final,administracion_de_Recursos).
esCorrelativaDe(proyecto_Final,redes_de_Informacion).
esCorrelativaDe(proyecto_Final,ingenieria_de_Software).

% ############# PUNTO 1 ############# %

materiaPesada(Materia):-
    materia(Materia,CargaSemanal),
    materiaHeavy(Materia,CargaSemanal).

materiaHeavy(Materia,6):- 
    esIntegradora(Materia).

materiaHeavy(_,CargaSemanal):-
    CargaSemanal >= 4.

% ############# PUNTO 2 ############# %

esMateria(Materia) :-
    materia(Materia, _).

%A

materiaInicial(Materia):-
    esMateria(Materia),
    not(esCorrelativaDe(Materia,_)).

%B

materiaNecesariaParaCursar(Materia, MateriasNecesarias) :-
    esMateria(Materia),
    not(materiaInicial(Materia)),
    esMateriaNecesariaParaCursar(Materia, MateriasNecesarias).

esMateriaNecesariaParaCursar(Materia, MateriaNecesaria) :-
    esCorrelativaDe(Materia, MateriaNecesaria).

esMateriaNecesariaParaCursar(Materia, MateriaNecesaria) :-
    esCorrelativaDe(Materia, Correlativa),
    esMateriaNecesariaParaCursar(Correlativa, MateriaNecesaria).

%C

materiaQueDesbloquea(Materia, MateriasQueDesbloquea) :-
    materiaNecesariaParaCursar(MateriasQueDesbloquea, Materia).

% ############# PUNTO 3 ############# %


%Vero
curso(vero,Materia,8,anual(2015)):-
    materiaInicial(Materia).

rindioFinalLibre(vero,ingles_II,10).

%Alan
curso(alan,sistemas_y_Organizaciones,6,anual(2015)).
curso(alan,analisis_Matematico_I,6,anual(2015)).
curso(alan,analisis_de_Sistemas,2,anual(2015)).
curso(alan,analisis_de_Sistemas,9,anual(2016)).
curso(alan,fisica_I,2,anual(2015)).

rindioFinal(alan,sistemas_y_Organizaciones,4).
rindioFinalLibre(alan,ingles_I,2).
%

%A

materiaCursadaDe(Alumno,Materia):-
    curso(Alumno,Materia,Nota,_),
    Nota>=6.

materiaCursadaDe(Alumno,Materia):-
    aproboFinalLibre(Alumno, Materia).

%B
 
materiaAprobadaDe(Alumno,Materia):-
    rindioFinal(Alumno,Materia,NotaFinal),
    NotaFinal >=6.

materiaAprobadaDe(Alumno,Materia):-
    aproboFinalLibre(Alumno, Materia).

materiaAprobadaDe(Alumno,Materia):-
    materiaPromocionada(Alumno, Materia).


aproboFinalLibre(Alumno, Materia) :-
    rindioFinalLibre(Alumno,Materia,NotaFinalLibre),
    NotaFinalLibre >=6.

% Alumno de prueba

curso(rodri, sistemas_y_Organizaciones, 4, anual(2015)). % Uso a 'rodri' como estudiante de prueba
curso(rodri, quimica, 4, cuatrimestral(2015, primer)).
curso(rodri, quimica, 8, cuatrimestral(2015, segundo)).
curso(rodri, fisica_I, 8, verano(2016)).

% ############# PUNTO 4 ############# %

anioLectivo(Alumno, Materia, AnioLectivo):-
    curso(Alumno, Materia, _,Modalidad),
    anio(Modalidad,AnioLectivo).

anio(cuatrimestral(Anio,_),Anio).
anio(anual(Anio),Anio).
anio(verano(Anio),AnioLectivo):-
AnioLectivo is Anio - 1.

% ############# PUNTO 5 ############# %

materiaRecursada(Alumno,Materia):-
    curso(Alumno,Materia,_,FechaDeCursada1),
    curso(Alumno,Materia,_,FechaDeCursada2),
    FechaDeCursada1 \= FechaDeCursada2.

% ############# PUNTO 6 ############# %
curso(alumnoConMuchasRecursadas, quimica, 2, anual(2016)).
curso(alumnoConMuchasRecursadas, quimica, 3, cuatrimestral(2017, primer)).
curso(alumnoConMuchasRecursadas, quimica, 4, cuatrimestral(2017, segundo)).
curso(alumnoConMuchasRecursadas, quimica, 5, anual(2018)).
curso(alumnoConMuchasRecursadas, fisica_I, 2, verano(2018)).
curso(alumnoConMuchasRecursadas, fisica_I, 2, anual(2018)).

curso(alumnoConAlgunasRecursadas, quimica, 2, anual(2016)).
curso(alumnoConAlgunasRecursadas, quimica, 3, cuatrimestral(2017, segundo)).
curso(alumnoConAlgunasRecursadas, fisica_I, 2, anual(2017)).
curso(alumnoConAlgunasRecursadas, fisica_I, 10, cuatrimestral(2018, primer)).

curso(alumnoVeraniego, quimica, 6, anual(2016)).
curso(alumnoVeraniego, fisica_I, 6, verano(2017)).
curso(alumnoVeraniego, matematica_Discreta, 2, anual(2017)).
curso(alumnoVeraniego, matematica_Discreta, 8, verano(2018)).

curso(alumnoATR, quimica, 10, cuatrimestral(2016, primer)).
curso(alumnoATR, fisica_I, 10, cuatrimestral(2016, segundo)).


alumno(Alumno) :-
    curso(Alumno, _, _, _).

perfil(Alumno,UnPerfil):-
    alumno(Alumno),
    perfilQueCumple(Alumno,UnPerfil).
%A
perfilQueCumple(Alumno,sinDescanso):-
    materiaRecursada(Alumno,_),   % sin esto tira que vero cumple, pero vero no recursó nunca. creo que por v(F -> V) = V
    forall(materiaRecursada(Alumno,Materia),cursoInmediatamente(Alumno,Materia)).


cursoInmediatamente(Alumno,Materia):-
    curso(Alumno,Materia,_,ModalidadYAnio1),
    curso(Alumno,Materia,_,ModalidadYAnio2),
    cursadasInmediatas(ModalidadYAnio1,ModalidadYAnio2).


cursadasInmediatas(cuatrimestral(Anio, primer),cuatrimestral(Anio, segundo)). %caso de cursarla cuatrimestral los dos cuatris

cursadasInmediatas(cuatrimestral(Anio, segundo),cuatrimestral(AnioSiguiente,primer)):- %caso de cursarla cuatrimestral el segundo cuatri y cuatrimestral(primer cuatri) el otro anio
    AnioSiguiente is Anio + 1.

cursadasInmediatas(cuatrimestral(Anio, segundo),anual(AnioSiguiente)):-%caso de cursarla cuatrimestral el segundo cuatri y anual el otro anio
    AnioSiguiente is Anio + 1.

cursadasInmediatas(anual(Anio),anual(AnioSiguiente)):-
    AnioSiguiente is Anio + 1. %caso de cursarla anual y despues cursarla anual el otro anio

cursadasInmediatas(anual(Anio),cuatrimestral(AnioSiguiente, primer)):-
    AnioSiguiente is Anio + 1. %caso de cursarla anual y despues en el primer cuatri el otro anio

cursadasInmediatas(verano(Anio),anual(Anio)).%caso de cursarla en verano y despues cursarla anual el cilo lectivo siguiente

cursadasInmediatas(verano(Anio),cuatrimestral(Anio, primer)).%caso de cursarla en verano y luego en el primer cuatri del ciclo lectivo siguiente

%B
perfilQueCumple(Alumno, invictus) :-
    forall(curso(Alumno, Materia,_,_), not(materiaRecursada(Alumno, Materia))).
    
%C
perfilQueCumple(Alumno, buenasCursadas):-
    forall(curso(Alumno,Materia,_,_), materiaPromocionada(Alumno,Materia)).

%D
perfilQueCumple(Alumno, repechaje) :-
    curso(Alumno, Materia, Nota, anual(Anio)),
    Nota < 6,
    curso(Alumno, Materia, NotaPromocion, cuatrimestral(AnioSiguiente, primer)),
    NotaPromocion > 7,
    AnioSiguiente is Anio + 1.


materiaPromocionada(Alumno,Materia):-
    curso(Alumno,Materia,Nota,_),
    Nota>7.

%E
perfilQueCumple(Alumno,seLoQueHicisteElVeranoPasado):-
    alumno(Alumno),
    forall(anioLectivo(Alumno,_,Anio),cursoEseVerano(Alumno, Anio)).



cursoEseVerano(Alumno, Anio) :-    % lo agrego porque sino compara mal los años de verano.
    curso(Alumno, _, _, verano(AnioVeraniego)),
    Anio is AnioVeraniego - 1.

%7
unicoPerfil(Alumno):-
    perfil(Alumno,_),
    not(tieneMasDeUnPerfil(Alumno)).

tieneMasDeUnPerfil(Alumno):-
    perfil(Alumno,Perfil1),
    perfil(Alumno,Perfil2),
    Perfil1 \= Perfil2.

%8
desempenioAcademico(Alumno,DesempenioAcademico):-
    alumno(Alumno),
    valoracionTotalDeMateriasCursadas(Alumno,NotaDeMaterias),
    cantidadDeMateriasCursadas(Alumno,CantidadDeMaterias),
    DesempenioAcademico is NotaDeMaterias / CantidadDeMaterias.

valoracionTotalDeMateriasCursadas(Alumno,NotaDeMaterias):-
    findall(Nota,valoracionDeMateriaCursada(Alumno,_ ,Nota),NotasDeMaterias),
    sumlist(NotasDeMaterias,NotaDeMaterias).

cantidadDeMateriasCursadas(Alumno,CantidadDeMaterias):-
    alumno(Alumno),
    findall(Materia,curso(Alumno,Materia,_,_),Materias),
    length(Materias,CantidadDeMaterias).

valoracionDeMateriaCursada(Alumno, Materia, Nota):-
    curso(Alumno, Materia, NotaDeCursada,TipoDeCursada),
    valoracionSegunModalidad(NotaDeCursada, TipoDeCursada, Nota).

valoracionSegunModalidad(Nota, anual(_), Nota).

valoracionSegunModalidad(NotaDeCursada, cuatrimestral(_, primer), Nota) :-
    Nota is NotaDeCursada - 1.

valoracionSegunModalidad(NotaDeCursada, cuatrimestral(_, segundo), Nota) :-
    Nota is NotaDeCursada - 2.

valoracionSegunModalidad(NotaDeCursada, verano(AnioVeraniego), Nota) :-
    not(esPar(AnioVeraniego)),
    Nota is NotaDeCursada / 2.

valoracionSegunModalidad(_, verano(AnioVeraniego), 5) :-
    esPar(AnioVeraniego).

esPar(Anio) :-
    0 is mod(Anio,2).


