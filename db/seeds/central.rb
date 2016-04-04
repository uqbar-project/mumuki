BookBuilder.build! do |b|
  b.locale 'es'
  b.preface "\
      ¿Alguna vez te sucedió estar haciendo una tarea tediosa y repetitiva? ¿Te descrubiste a vos mismo cometiendo \
      errores por cansancio o distracción? ¿Te diste cuenta de que estabas perdiendo tiempo valioso en cosas que... \
      podría hacer una máquina?\n\
      \n\
      Tenemos una buena noticia para vos: ¡la programación puede ayudarte! Programar trata de usar nuestra creatividad \
      e ingenio para resolver problemas y automatizar tareas con la ayuda de una computadora.\n\
      \n\
      Y por si fuera poco, aprender a programar es fácil y entretenido. ¡Acompañanos!"

  b.chapter 'Fundamentos' do |c|
    c.organization 'sagrado-corazon-alcal'
    c.prefix 'fundamentos'
    c.locale 'es'
    c.description "\
      Aprendé los fundamentos de la programación de la manera más fácil utilizando [Gobstones](http://gobstones.org),\
      un **innovador lenguaje gráfico** creado en la Universidad de Quilmes, en el que utilizarás un tablero con bolitas\
      para resolver problemas. Si nunca programaste antes, **te recomendamos que empieces por acá**."

    c.guide 'primeros-programas'
    c.guide 'procedimientos'
    c.guide 'repeticion-simple'
    c.guide 'alternativa-condicional'
    c.guide 'practica-procedimientos'

  end

  b.chapter 'Programacion Funcional' do |c|
    c.organization 'pdep-utn'
    c.prefix 'funcional'
    c.locale 'es'
    c.description "\
      El paradigma funcional es de los más **antiguos**, pero también de los más **simples** y **poderosos**.\
      Si querés abrir tu cabeza y aprender _a dominar el mundo con nada_, seguí por acá."

    c.guide 'valores-y-funciones'
    c.guide 'practica-valores-y-funciones'

    c.guide 'intoduccion-tipos-de-dato'
    c.guide 'practica-introduccion-tipos-de-dato'

    c.guide 'aplicacion-parcial-y-orden-superior'
    c.guide 'practica-aplicacion-parcial-y-orden-superior'

    c.guide 'funciones-partidas-pattern-matching-tuplas'
    c.guide 'practica-funciones-partidas'

    c.guide 'inferencia-de-tipos'

    c.guide 'listas'
    c.guide 'practica-listas'
    c.guide 'practica-listas-por-comprension'

    c.guide 'practica-expresiones-lambda'

    c.guide 'practica-fold-concatmap'

    c.guide 'practica-evaluacion-diferida'

    c.guide 'recursividad'
    c.guide 'practica-recursividad'

    c.guide 'modelado'

    c.guide 'practica-chocobos'
  end

  b.chapter 'Programación Lógica' do |c|
    c.organization 'pdep-utn'
    c.prefix 'logico'
    c.locale 'es'
    c.description "\
      ¿Querés volar tu cabeza? ¿Querés aprender a programar _enseñándole_ reglas a una computadora, sin\
      usar `ifs`, `fors` ni operadores lógicos? ¿Querés escribir código que cualquiera puede entender?\
      Entonces aprendé sobre el paradigma lógico, utilizando su lenguaje más conocido: Prolog."

    # A Hechos y Reglas [Base de conocimiento]
    # A Inversibilidad [limites]
    c.guide 'pdep-utn/mumuki-guia-logico-hechos-y-reglas'
    c.guide 'practica-primeros-pasos'

    # A Predicados de Orden Superior
    c.guide 'practica-aritmetica-y-negacion'

    c.guide 'functores'
    c.guide 'practica-functores'

    # R(evist) haskell listas
    # A Listas
    c.guide 'practica-listas'

    # A Colectando Soluciones
    # P pdep-utn/mumuki-logico-guia-4

    c.guide 'practica-pulp-fiction'
  end
end

