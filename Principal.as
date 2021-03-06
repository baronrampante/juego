﻿package 
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.text.*;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	import prueba;
	import Clientes;
	import Lista_Trabaj;
	import Barrio_MC;
	import Temporizador;



	/*Se incorpoó _timer_jugador que comienza cuando entra un nuevo 
	cliente en mover:cliente y se apaga cuando se abre la 
	placa del cliente al tocar en el globito
	*/


	public class Principal extends MovieClip
	{
		public var Trabajos_Terminados:Array = [];
		var Trabajos:Array = [];
		var Trabajo_Proceso = 0;
		var Trabajo_Que_se_Procesa = [];
		var Trabajos_Terminados_Entrega:Array = [];// lista de trabajos terminados
		var tiempo = 0;
		var avance = 0;
		//public var _timer:Timer = new Timer(1000);// se ejecuta cada un segundo
		var myprueba:prueba = new prueba();
		var en_proceso = false;

		var Valor = 0;
		var Entrega = 0;// tiempo que el cliente viene a buscar el trabajo
		var contador = 0;

		var Lista_Trab:Lista_Trabaj = new Lista_Trabaj();
		var Barr:Barrio_MC = new Barrio_MC();
		var Nombre:Array = new Array();
		var Nombre_Elegido = "";
		var Nuevo_Nuevo = 0;// flag para ver si hay un nuevo cliente
		var Cliente_var = "Mario";
		var Velocidad_var = 0;
		var Cliente_cara = "Placa_Clientes.Punk_MC";


		//Timers
		public var _timer:Timer = new Timer(1000);// se ejecuta cada un segundo
		public var _timer_jugador:Timer = new Timer(1000);// se ejecuta cada un segundo
		public var _timer_espera_cliente:Timer = new Timer(1000);// se ejecuta cada un segundo
		private var _tiempo_jugado:uint = 0;
		private var _tiempo_para_jugar:uint = 50;// definir el tiempo total aca
		var Time:Temporizador = new Temporizador  ;

		//Variables generales
		public var Comunidad_var = 600;
		public var Dia_var = 1;
		public var Semana_var = 1;
		public var Hora_var = 1;
		public var Hora_Dia_var = 0;// se incrementa cada hora
		public var Horas_para_Dia = 5;// variable que determina el día
		public var Dias_para_Semana = 5;// variable que determina duracion semana
		public var Dia_Semana = 0;// variable que cuenta los dias para llegar a a la semana
		public var Cuota_Banco = 3000;


		public var Gastos_Fijos = 1500;
		var Sueldos = 0;
		var Gastos_Personales = 500;
		var Mi_Trabajo:Array = new Array();
		var mult = 0;//multiplicador

		//Clientes
		var Cliente_Stage = false;
		var Buscar = "";//nombre del cliente que termino
		var Buscar_flag = false;// flas para saber si se termino un trabajo
		var Cliente_Buscar = false;// determina si el cliente que está en el stage es el que viene abuscar el pedido
		var Client:Clientes = new Clientes();
		var Cliente = 0;

		//Materiales
		var Alfajias_var_Numb = 0;
		var Tablones_var_Numb = 0;
		public var Dinero_var = 12000;
		var Tablones_Stock:Number = 0;
		var Alfajias_Stock:Number = 0;
		var Alfajias_precio = 100;
		var Tablones_precio = 500;

		//Precios
		var Caladora_precio = 1000;
		var Taladro_banco_precio = 3000;
		var Cafetera_precio = 1500;
		var Mesa_Combinada_precio = 3000;
		var Pinturas_precio = 1000;
		var Caladora_Pie_precio = 4000;
		var Taladro_Pie_precio = 3000;

		public var Cala_little_var = 0;
		public var Cala_pie_var = 0;
		public var Pintura_var = 0;
		public var Combi_var = 0;
		var Tala_pie_var = 0;
		var Cafe_var = 0;


		var variable = Time.Dia_var;


		public function Principal()
		{
			if (stage)
			{
				init();
			}
			stage.addEventListener(Event.ENTER_FRAME, Botones);
		}

		public function init():void
		{
			/*Lista_Trabajos.Trabajo1.visible = false;
			Lista_Trabajos.Trabajo2.visible = false;
			Lista_Trabajos.Trabajo3.visible = false;*/
			_timer.start();
			this.addEventListener(MouseEvent.MOUSE_DOWN, fnBotonesStage);
			_timer.addEventListener(TimerEvent.TIMER, timerListener);


			//clientes
			Lista_Trabajos.Taburete_Roto.visible = false;
			Lista_Trabajos.Silla_Roto.visible = false;
			Lista_Trabajos.Mesa_Roto.visible = false;
			Lista_Trabajos.Banquito_Roto.visible = false;
			Lista_Trabajos.Mesita_Roto.visible = false;
			Lista_Trabajos.Luz_Roto.visible = false;
			Lista_Trabajos.Mormon_MC.visible = false;
			Lista_Trabajos.Vieja_MC.visible = false;
			Lista_Trabajos.Nena_MC.visible = false;
			Lista_Trabajos.Coqueta_MC.visible = false;
			Lista_Trabajos.Punk_MC.visible = false;
			Lista_Trabajos.Viejo_MC.visible = false;
			Placa_Clientes.Mormon_MC.visible = false;
			Placa_Clientes.Vieja_MC.visible = false;
			Placa_Clientes.Nena_MC.visible = false;
			Placa_Clientes.Coqueta_MC.visible = false;
			Placa_Clientes.Punk_MC.visible = false;
			Placa_Clientes.Viejo_MC.visible = false;
			Placa_ir_Aserradero.visible = false;
			Placa_ir_Barraca.visible = false;
			Asesora_MC.visible = false;
			Punk.visible = false;
			Mormon.visible = false;
			Punk.visible = false;
			Vieja.visible = false;
			Viejo.visible = false;
			Coqueta.visible = false;
			Nena.visible = false;
			Ayuda_MC.visible = false;
			Pedido_Comunidad_MC.visible = false;
			//Asesora_start.visible = false;

			//pantallas
			Placa_Clientes.visible = false;
			Lista_Trabajos.visible = false;
			Barra.visible = false;
			Madera_MC.visible = false;
			Placa_financiera.visible = false;
			Barrio.visible = false;
			Placa_Malo_MC.visible = false;

			// herramientas
			cala_big.visible = false;
			cala_little.visible = false;
			Cafetera_Chica.visible = false;
			Caladora_de_Pie.visible = false;
			Combinada_MC.visible = false;
			Lata_Pintura_MC.visible = false;
		}

		public function Botones(evt:Event):void
		{

			Ayuda_MC.addEventListener(MouseEvent.MOUSE_DOWN, fnAdelante_Ayuda);
			Asesora_start.addEventListener(MouseEvent.MOUSE_DOWN, fnAsesora_start);
			Pedido_Comunidad_MC.addEventListener(MouseEvent.MOUSE_DOWN, fnPedido_Comunidad);
			Placa_Malo_MC.addEventListener(MouseEvent.MOUSE_DOWN, fnMalo);
			Placa_ir_Aserradero.Yes.addEventListener(MouseEvent.MOUSE_DOWN, En_Madera);
			Placa_ir_Aserradero.No.addEventListener(MouseEvent.MOUSE_DOWN, Placa_ir_Aserradero_Cerrar);
			Placa_ir_Barraca.Yes.addEventListener(MouseEvent.MOUSE_DOWN, En_Barraca_Placa);
			Placa_ir_Barraca.No.addEventListener(MouseEvent.MOUSE_DOWN, Placa_ir_Barraca_Cerrar);
			//Placa_Clientes.No.addEventListener(MouseEvent.MOUSE_DOWN, fnPlaca_Clientes_No);
			//Placa_Clientes.Chau.addEventListener(MouseEvent.MOUSE_DOWN, fnPlaca_Clientes_Chau);
			
			if (Cliente_Stage == true )
			{
				Cliente_out();// ve si salió del Stage
				Cliente_var.globito.addEventListener(MouseEvent.MOUSE_DOWN, fnPlaca_Cliente);
			}

			if (Cliente_Stage == false && Buscar_flag == true)
			{
				Venite_Buscar();
			}

			if (Cliente_Stage == true && Buscar_flag == true)
			{
				trace("Gracias  " + Buscar_flag);
			}

			//Botones Cerrar pantallas;
			Lista_Trabajos.addEventListener(MouseEvent.MOUSE_DOWN,fnBotonesTrabajos);
			Lista_Trabajos.Cerrar_BT.addEventListener(MouseEvent.MOUSE_DOWN, fnCerrarLista);
			Placa_financiera.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, fnPlaca_Financiera_Cerrar);
			Barrio.Comunidad_Cerrar.addEventListener(MouseEvent.MOUSE_DOWN, fnComunidad);
			Placa_Clientes.addEventListener(MouseEvent.MOUSE_DOWN, fnPlaca_Trabajos_BT);
		}


		//acá se controla por tiempo todo;

		public function timerListener(e:TimerEvent):void
		{

			//llama a un nuevo cliente
			Lista_Trab.Tiempo(Time.Hora_var);
			


			//Comunidad;
			if (Cliente_Stage == false && Time.Semana_var == 2)
			{
				Pedido_Comunidad_MC.visible = true;
			}

			//Malo;
			if (Cliente_Stage == false && Time.Semana_var == 3)
			{
				Placa_Malo_MC.visible = true;
			}

// para ver la cantidad de material existente
			Tablones.text = String(Tablones_Stock);
			Alfajias.text = String(Alfajias_Stock);

			Hora_var = Time.Hora_var;
			Horas.text = String(_timer.currentCount) + "  horas";
			Dia.text = String(Time.Dia_var);
			Semana.text = String(Time.Semana_var);
			Dinero.text = String(Dinero_var);
			Comunidad.text = Comunidad_var;
			Placa_financiera.txt_total_capital.text = String(Dinero_var);
			Placa_financiera.txt_mes.text = String(Semana_var);
			Placa_financiera.txt_cuota.text = String(Cuota_Banco);
			Placa_financiera.txt_gastos_fijos.text = String(Gastos_Fijos);
			Placa_financiera.txt_gastos_personales.text = String(Gastos_Personales);
			Placa_financiera.txt_sueldos.text = String(Sueldos);
			Placa_financiera.txt_total_gastos.text = String(Sueldos + Gastos_Personales + Gastos_Fijos + Cuota_Banco);
			var Gastos = Sueldos + Gastos_Personales + Gastos_Fijos + Cuota_Banco;
			Placa_financiera.txt_saldo.text = String (Dinero_var - Gastos);

			//NUEVOS CLIENTES

			//Trabajos = Lista_Trab.Trabajo;//Recibe el listado de los clientes armado en la otra clase

			if (Lista_Trab.Nuevo_Cliente == 1 && Cliente_Stage == false && Time.Dale == true)
			{
				// Recibe el nombre del cliente;
				
				Hola_Cliente();
			}

			// Si el Cliente está espera y 
			if (_timer_espera_cliente.currentCount == 10 && Cliente_var.x == 600)
			{
				Cliente_var.gotoAndPlay("espalda");
				Cliente_var.globito.gotoAndPlay("mal");
				_timer_espera_cliente.reset();
				_timer_espera_cliente.stop();
				var myPunkx:Tween = new Tween(Cliente_var,"x",None.easeInOut,Cliente_var.x,100,Velocidad_var,true);
				var myPunky:Tween = new Tween(Cliente_var,"y",None.easeInOut,Cliente_var.y,474,Velocidad_var,true);
			}

			// Empieza contador espera Cliente

			if (Cliente_var.x == 600)
			{
				_timer_espera_cliente.start();
			}


			Lista_Trabajos.Trabajo1.text = String(Trabajos[6] + " en espera");
			Lista_Trabajos.Trabajo2.text = String(Trabajos[13] + " en espera");
			Lista_Trabajos.Trabajo3.text = String(Trabajos[20] + " en espera");
			Lista_Trabajos.Trabajo4.text = String(Trabajos[27] + " en espera");

			Visible();// vuelve los botones de los trabajos visibles o invisibles


			//detecta botones en el escenario;
			this.addEventListener(MouseEvent.MOUSE_DOWN, fnBotonesStage);
			//Cliente_var.globito.addEventListener(MouseEvent.MOUSE_DOWN, fnPlaca_Cliente);


			// ver si se termino laburo;
			if (avance == _timer.currentCount)
			{
				//trace("contador  " + contador);
				Trabajos_Terminados_Entrega[contador] = [(Entrega + _timer.currentCount)];
				contador = contador + 1;
				trace(Trabajos_Terminados_Entrega);
				trace("termino");
				en_proceso = false;
			}
			fnBuscar_Trabajo();
		}


		function Cliente_out():void
		{
			if (Cliente_var.x <= 110)
			{
				Cliente_var.visible = false;
				Cliente_var.gotoAndPlay("frente");
				Cliente_var.globito.gotoAndPlay("normal");
				Cliente_Stage = false;
			}
		}


		//Funcion Random general

		private function randomRange(minNum:Number, maxNum:Number):Number
		{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}


		//Botones en general

		//acciones botones escenario

		function fnBotonesStage(event:MouseEvent):void
		{
			//trace(event.target.name, event.currentTarget.name);
			switch (event.target.name)
			{
				case "Asesora_BT" :
					Placa_financiera.visible = true;
					var Text_Asesora= ((randomRange(0, 20)));
					Asesora_MC.Texto.text = Client.TextosAsesora[Text_Asesora];
					break;
				case "Comunidad_BT" :
					Barrio.visible = true;
					break;
				case "Ir_Pantalla_Trabajos_BT" :
					Lista_Trabajos.visible = true;
					break;
				case "Ir_Madera" :
					Lista_Trabajos.visible = false;
					Madera_MC.visible = true;
					Madera_MC.Alfajias_Ingreso.text = "";
					Madera_MC.Tablones_Ingreso.text = "";
					Madera_MC.Resultado_Madera_BT.addEventListener(MouseEvent.MOUSE_DOWN, Resultado_Madera);
					Madera_MC.Resultado_Madera_BT2.addEventListener(MouseEvent.MOUSE_DOWN, Total_Madera);
					break;
				case "Ir_Barraca" :
					En_Barraca();
					break;
				case "Ayuda_BT" :
					Ayuda_MC.visible = true;
					Ayuda_MC.gotoAndStop(1);
					break;
			}
		}

		function fnPlaca_Financiera_Cerrar(event:MouseEvent):void
		{
			Placa_financiera.visible = false;
		}
		

		function fnComunidad(event:MouseEvent):void
		{
			Barrio.visible = false;
		}

		function fnBarrio_Comunidad(event:MouseEvent):void
		{
			Barrio.visible = true;
		}
		public function fnCerrarLista(event:MouseEvent):void
		{
			Lista_Trabajos.visible = false;
		}

		public function fnTrabajos(event:MouseEvent):void
		{
			Lista_Trabajos.visible = true;
		}

		public function En_Barraca_Placa (event:MouseEvent):void 
		{
			Placa_ir_Barraca.visible = false;
			En_Barraca();
		}

		public function fnAdelante_Ayuda(event:MouseEvent):void
		{
			switch (event.target.name)
			{
				case "Adelante" :

					Ayuda_MC.nextFrame();
					break;
				case "Atriqui" :
					Ayuda_MC.prevFrame();
					break;
				case "Close" :
					Ayuda_MC.visible = false;
					break;
			}
		}

		public function fnAsesora_start(event:MouseEvent):void
		{
			switch (event.target.name)
			{
				case "Suguiente_BT" :
					Asesora_start.nextFrame();
					break;
				case "Instrucciones_BT" :
					Ayuda_MC.visible = true;
					Asesora_start.visible = false;
					break;
				case "Jugar_BT" :
					Asesora_start.visible = false;
					Time.Empezar(true);
					break;
			}
		}


		public function fnPedido_Comunidad(event:MouseEvent):void
		{
			switch (event.target.name)
			{
				case "Aceptar_Comunidad" :
					Pedido_Comunidad_MC.visible = false;
					Comunidad_var = Comunidad_var + 300;
					break;
				case "Cancelar_Comunidad" :
					Pedido_Comunidad_MC.visible = false;
					Comunidad_var = Comunidad_var + 300;
					break;
			}
		}

		public function fnMalo(event:MouseEvent):void
		{
			switch (event.target.name)
			{
				case "Cancelar1" :
					Placa_Malo_MC.gotoAndStop(2);
					Comunidad_var = Comunidad_var + 300;
					break;
				case "Cancelar2" :
					Placa_Malo_MC.visible = false;
					break;
				case "Aceptar1" :
					Placa_Malo_MC.visible = false;
					Comunidad_var = Comunidad_var - 200;
					Dinero_var = Dinero_var - 500;
					Alfajias_Stock = Alfajias_Stock + 2;
					Tablones_Stock = Tablones_Stock + 2;
					break;
				case "Aceptar_Final" :
					Placa_Malo_MC.visible = false;
					Comunidad_var = Comunidad_var - 200;
					Dinero_var = Dinero_var - 300;
					Alfajias_Stock = Alfajias_Stock + 2;
					Tablones_Stock = Tablones_Stock + 2;
					break;
			}
		}

		function Placa_ir_Barraca_Cerrar(event:MouseEvent):void
		{
			Placa_ir_Barraca.visible = false;
		}
		//Fin de botones

		// vuelve o no visible los diferentes pedidos en la lista de pedidos

		function Visible():void
		{
			if (Trabajos[0] > 1)
			{
				Lista_Trabajos.Trabajo1.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo1.visible = false;
			}

			if (Trabajos[7] > 0)
			{
				Lista_Trabajos.Trabajo2.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo2.visible = false;
			}

			if (Trabajos[14] > 0)
			{
				Lista_Trabajos.Trabajo3.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo3.visible = false;
			}
			if (Trabajos[21] > 0)
			{
				Lista_Trabajos.Trabajo4.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo4.visible = false;
			}
		}
		function Placa_ir_Aserradero_Cerrar(event:MouseEvent):void{
			Placa_ir_Aserradero.visible = false;
		}
		//Lógica Trabajo

		// ver si esta la fecha de entrega laburo
		public function fnBuscar_Trabajo()
		{
			var length:uint = Trabajos_Terminados_Entrega.length;
			for (var i:uint=0; i<length; i++)
			{
				if (Trabajos_Terminados_Entrega[i] == _timer.currentCount)
				{
					trace(String(Trabajos_Terminados_Entrega[i]) + " venite a buscar el laburo");
					Trabajos_Terminados_Entrega.splice([i], 1);
					var mmm = i * 7;
					Trabajos.splice([mmm], 7);
					Buscar = Nombre[i];
					Nombre.splice([i],1);
					Buscar_flag = true;
					trace("Esto es " + i);
					trace("Nombre " + Nombre);
				}
			}
		}



		public function fnBotonesTrabajos(event:MouseEvent):void
		{
			switch (event.target.name)
			{
				case "Trabajo1" :
					mult = 0;
					tiempo = (Trabajos[1]);
					Trabajo_Proceso = Trabajos[0];
					Entrega = Trabajos[4];
					Nombre_Elegido = Trabajos[6];
					fnLista_Trabajos();
					break;
				case "Trabajo2" :
					mult = 7;
					trace("Soy   " + Trabajos);
					tiempo = Trabajos[1 + mult];
					Trabajo_Proceso = Trabajos[0 + mult];
					Entrega = Trabajos[4 + mult];
					Nombre_Elegido = Trabajos[6 + mult];
					fnLista_Trabajos();
					break;
				case "Trabajo3" :
					mult = 14;
					trace("Soy   " + Trabajos);
					tiempo = Trabajos[1 + mult];
					Trabajo_Proceso = Trabajos[0 + mult];
					Entrega = Trabajos[4 + mult];
					Nombre_Elegido = Trabajos[6 + mult];
					fnLista_Trabajos();
					break;
				case "Trabajo4" :
					mult = 21;
					trace("Soy   " + Trabajos);
					tiempo = Trabajos[1 + mult];
					Trabajo_Proceso = Trabajos[0 + mult];
					Entrega = Trabajos[4 + mult];
					Nombre_Elegido = Trabajos[6 + mult];
					fnLista_Trabajos();
					break;
				case "Arreglar_BT" :
					//trace (Trabajos [1] [4]);
					fnIniciar_Trabajo();
			}
		}

		function fnLista_Trabajos():void
		{
			Lista_Trabajos.Datos_Tiempo.text = String(Trabajos[1 + mult]);
			Lista_Trabajos.Datos_Precio.text = String(Trabajos[0 + mult]);
			Lista_Trabajos.Datos_Trabajo.text = String(Trabajos[5 + mult]);
			Lista_Trabajos.Datos_Materiales.text = "Tablones " + String(Trabajos[2 + mult]) + "  Alfajías " + String(Trabajos[3 + mult]);
			//Lista_Trabajos.Datos_Cliente.text = String(cara);
			Lista_Trabajos.Mormon_MC.visible = false;
			Lista_Trabajos.Vieja_MC.visible = false;
			Lista_Trabajos.Nena_MC.visible = false;
			Lista_Trabajos.Coqueta_MC.visible = false;
			Lista_Trabajos.Punk_MC.visible = false;
			Lista_Trabajos.Viejo_MC.visible = false;
			Lista_Trabajos.Taburete_Roto.visible = false;
			Lista_Trabajos.Silla_Roto.visible = false;
			Lista_Trabajos.Mesa_Roto.visible = false;
			Lista_Trabajos.Banquito_Roto.visible = false;
			Lista_Trabajos.Mesita_Roto.visible = false;
			Lista_Trabajos.Luz_Roto.visible = false;
			switch (Nombre_Elegido)
			{
				case "Martín" :
					Lista_Trabajos.Mormon_MC.visible = true;
					break;
				case "Olga" :
					Lista_Trabajos.Vieja_MC.visible = true;
					break;
				case "Lucía" :
					Lista_Trabajos.Nena_MC.visible = true;
					break;
				case "Andrea" :
					Lista_Trabajos.Coqueta_MC.visible = true;
					break;
				case "Julio" :
					Lista_Trabajos.Punk_MC.visible = true;
					break;
				case "Gustavo" :
					Lista_Trabajos.Viejo_MC.visible = true;
					break;
			}
			switch (Trabajos[5 + mult])
			{
				case "Silla" :
					Lista_Trabajos.Silla_Roto.visible = true;
					break;
				case "Mesa" :
					Lista_Trabajos.Mesa_Roto.visible = true;
					break;
				case "Cama" :
					Lista_Trabajos.Taburete_Roto.visible = true;
					break;
				case "Mesa de Luz" :
					Lista_Trabajos.Luz_Roto.visible = true;
					break;
				case "Banco" :
					Lista_Trabajos.Mesita_Roto.visible = true;
					break;
			}
		}


		//Genera pantalla de lista de trabajos y carga 
		// Inicia el laburo y veridfica están compradas las herramientas y hay stock de materiales.

		public function fnIniciar_Trabajo():void
		{
			if (Cala_little_var == 1 && Combi_var == 1) {
				if (Tablones_Stock > Trabajos[2] && Alfajias_Stock > Trabajos[3])
				{
					if (en_proceso == false)
					{
						avance = Trabajos[4 + mult] + _timer.currentCount;
						Trabajo_Que_se_Procesa = mult;
						trace("Soy   " + Entrega + "   Nombres  " + Cliente + "Mult   " + mult);
						trace(Entrega);
						trace(Cliente);
						Alfajias_Stock = Alfajias_Stock - Trabajos[3];
						Tablones_Stock = Tablones_Stock - Trabajos[2];
						en_proceso = true;
					}
						else
						{
							trace("esperá");
							//Trabajo_Proceso.splice(0,0);
							tiempo = 0;
						}
					}
				else 
				{
					fnEn_Madera_pedido_Placa();
				}
			}
			else 
			{
				Placa_ir_Barraca.visible = true;
				Lista_Trabajos.visible = false;
			}
		}
		
		
		function fnEn_Madera_pedido_Placa():void
		{
			Placa_ir_Aserradero.visible = true;
			Madera_MC.visible = false;
			Lista_Trabajos.visible = false;
		}
		
		
		// Función de nuev o cliente

		public function Hola_Cliente():void
		{
			//_timer_espera_cliente.start();
			//trace(Lista_Trab.Trabajo[6]);
			switch (Lista_Trab.Trabajo[6])
			{
				case "Martín" :
					Cliente_cara = Placa_Clientes.Mormon_MC;
					Velocidad_var = 6;
					Cliente_var = Mormon;
					Mover_cliente();
					fnTexto_Pedido();
					Cliente_var.visible = true;
					break;
				case "Olga" :
					Cliente_cara = Placa_Clientes.Vieja_MC;
					Velocidad_var = 10;
					Cliente_var = Vieja;
					Mover_cliente();
					fnTexto_Pedido();
					Cliente_var.visible = true;
					break;
				case "Lucía" :
					Cliente_cara = Placa_Clientes.Nena_MC;
					Velocidad_var = 4;
					Cliente_var = Nena;
					Mover_cliente();
					fnTexto_Pedido();
					Cliente_var.visible = true;
					break;
				case "Andrea" :
					Cliente_cara = Placa_Clientes.Coqueta_MC;
					Velocidad_var = 7;
					Cliente_var = Coqueta;
					Mover_cliente();
					fnTexto_Pedido();
					Cliente_var.visible = true;
					break;
				case "Julio" :
					Placa_Clientes.Punk_MC.visible = true;
					Cliente_cara = Placa_Clientes.Punk_MC;
					Velocidad_var = 6;
					Cliente_var = Punk;
					Mover_cliente();
					fnTexto_Pedido();
					break;
				case "Gustavo" :
					Cliente_cara = Placa_Clientes.Viejo_MC;
					Velocidad_var = 10;
					Cliente_var = Viejo;
					Mover_cliente();
					fnTexto_Pedido();
					break;
			}
		}

		//  Función que hace que el cliente venga a buscar el trabajo

		public function Venite_Buscar():void
		{
			switch (Buscar)
			{
				case "Martín" :
					Cliente_cara = Placa_Clientes.Mormon_MC;
					Velocidad_var = 6;
					Cliente_var = Mormon;
					Mover_cliente_Buscar();
					//fnTexto_Pedido();
					Cliente_var.visible = true;
					break;
				case "Olga" :
					Cliente_cara = Placa_Clientes.Vieja_MC;
					Velocidad_var = 10;
					Cliente_var = Vieja;
					Mover_cliente_Buscar();
					//fnTexto_Pedido();
					Cliente_var.visible = true;
					break;
				case "Lucía" :
					Cliente_cara = Placa_Clientes.Nena_MC;
					Velocidad_var = 4;
					Cliente_var = Nena;
					Mover_cliente_Buscar();
					//fnTexto_Pedido();
					Cliente_var.visible = true;
					break;
				case "Andrea" :
					Cliente_cara = Placa_Clientes.Coqueta_MC;
					Velocidad_var = 7;
					Cliente_var = Coqueta;
					Mover_cliente_Buscar();
					//fnTexto_Pedido();
					Cliente_var.visible = true;
					break;
				case "Julio" :
					Placa_Clientes.Punk_MC.visible = true;
					Cliente_cara = Placa_Clientes.Punk_MC;
					Velocidad_var = 6;
					Cliente_var = Punk;
					Mover_cliente_Buscar();
					//fnTexto_Pedido();
					break;
				case "Gustavo" :
					Cliente_cara = Placa_Clientes.Viejo_MC;
					Velocidad_var = 10;
					Cliente_var = Viejo;
					Mover_cliente_Buscar();
					//fnTexto_Pedido();
					break;
			}
		}


		function fnTexto_Pedido():void
		{
			Placa_Clientes.Precio_TXT.text = "Precio  " + Lista_Trab.Trabajo[0];
			Placa_Clientes.Alfajias_TXT.text = Lista_Trab.Trabajo[1];
			Placa_Clientes.Tablones_TXT.text = Lista_Trab.Trabajo[2];
			Placa_Clientes.Tiempo_para_Hacer_TXT.text = Lista_Trab.Trabajo[3];
			var texto = "Textos" + String(Lista_Trab.Trabajo[5]);
			trace(texto);
			Placa_Clientes.Cliente_TXT.text = Client[texto][0];//[]convierte un string en el nombre de una variable
		}

		function Mover_cliente():void
		{
			_timer_jugador.start();
			Cliente_var.visible = true;
			Cliente_Stage = true;
			//_timer_espera_cliente.start();
			var Posicion_en_vertical =((randomRange(600,800)));
			var myPunkx:Tween = new Tween(Cliente_var,"x",None.easeInOut,200,600,Velocidad_var,true);
			var myPunky:Tween = new Tween(Cliente_var,"y",None.easeInOut,474,Posicion_en_vertical,Velocidad_var,true);
		}

		function Mover_cliente_Buscar():void
		{
			_timer_jugador.start();
			Cliente_var.visible = true;
			Cliente_var.globito.gotoAndStop("bien");
			Cliente_Stage = true;
			Cliente_Buscar = true;
			//_timer_espera_cliente.start();
			var Posicion_en_vertical =((randomRange(600,800)));
			var myPunkx:Tween = new Tween(Cliente_var,"x",None.easeInOut,200,600,Velocidad_var,true);
			var myPunky:Tween = new Tween(Cliente_var,"y",None.easeInOut,474,Posicion_en_vertical,Velocidad_var,true);
		}


		function fnPlaca_Cliente(event:MouseEvent):void
		{
			if (Buscar_flag == false)
			{
				if (_timer_jugador.currentCount != 0)
				{// si se está yendo no se habilita la placa
					Placa_Clientes.visible = true;
					Cliente_cara.visible = true;
					_timer_espera_cliente.stop();
					_timer_espera_cliente.reset();
					_timer_jugador.stop();
					_timer_jugador.reset();
				}
			}
			if (Buscar_flag == true && Cliente_Buscar == true)
			{
				Placa_Clientes.visible = true;
				Placa_Clientes.gotoAndStop(2);
				Cliente_cara.visible = true;
				_timer_espera_cliente.stop();
				_timer_espera_cliente.reset();
				_timer_jugador.stop();
				_timer_jugador.reset();
			}
		}


		public function fnPlaca_Trabajos_BT(event:MouseEvent):void
		{
			switch (event.target.name)
			{
				case "Yes_BT" :
					fnClientes_Pedido();
					break;
				case "Yes_BT_Buscar" :
					fnClientes_Pedido_Buscar();
					break;
				case "No_BT" :
					Placa_Clientes.gotoAndStop(3);
					//fnClientes_Pedido_No();
					break;
				case "Chau" :
					Comunidad_var = Comunidad_var - 20;
					fnClientes_Pedido_No();
					break;
			}
		}


		function fnClientes_Pedido():void
		{
			Trabajos.push(Lista_Trab.Trabajo[0]);
			Trabajos.push(Lista_Trab.Trabajo[1]);
			Trabajos.push(Lista_Trab.Trabajo[2]);
			Trabajos.push(Lista_Trab.Trabajo[3]);
			Trabajos.push(Lista_Trab.Trabajo[4]);
			Trabajos.push(Lista_Trab.Trabajo[5]);
			Trabajos.push(Lista_Trab.Trabajo[6]);
			Nombre.push(Lista_Trab.Trabajo[6]);
			trace(Trabajos);
			Placa_Clientes.visible = false;
			Placa_Clientes.Mormon_MC.visible = false;
			Placa_Clientes.Nena_MC.visible = false;
			Placa_Clientes.Punk_MC.visible = false;
			Placa_Clientes.Vieja_MC.visible = false;
			Placa_Clientes.Viejo_MC.visible = false;
			Placa_Clientes.Coqueta_MC.visible = false;
			Cliente_var.gotoAndPlay("espalda");
			var myPunkx:Tween = new Tween(Cliente_var,"x",None.easeInOut,Cliente_var.x,100,Velocidad_var,true);
			var myPunky:Tween = new Tween(Cliente_var,"y",None.easeInOut,Cliente_var.y,474,Velocidad_var,true);
		}
		
		function fnClientes_Pedido_No():void
		{
			Placa_Clientes.visible = false;
			Placa_Clientes.Mormon_MC.visible = false;
			Placa_Clientes.Nena_MC.visible = false;
			Placa_Clientes.Punk_MC.visible = false;
			Placa_Clientes.Vieja_MC.visible = false;
			Placa_Clientes.Viejo_MC.visible = false;
			Placa_Clientes.Coqueta_MC.visible = false;
			Cliente_var.gotoAndPlay("espalda");
			var myPunkx:Tween = new Tween(Cliente_var,"x",None.easeInOut,Cliente_var.x,100,Velocidad_var,true);
			var myPunky:Tween = new Tween(Cliente_var,"y",None.easeInOut,Cliente_var.y,474,Velocidad_var,true);
		}

		function fnClientes_Pedido_Buscar():void
		{
			Placa_Clientes.visible = false;
			Placa_Clientes.gotoAndStop(1);
			trace(Cliente_var);
			Buscar_flag = false;
			Placa_Clientes.Mormon_MC.visible = false;
			Placa_Clientes.Nena_MC.visible = false;
			Placa_Clientes.Punk_MC.visible = false;
			Placa_Clientes.Vieja_MC.visible = false;
			Placa_Clientes.Viejo_MC.visible = false;
			Placa_Clientes.Coqueta_MC.visible = false;
			Cliente_var.gotoAndPlay("espalda");

			var myPunkx:Tween = new Tween(Cliente_var,"x",None.easeInOut,Cliente_var.x,100,Velocidad_var,true);
			var myPunky:Tween = new Tween(Cliente_var,"y",None.easeInOut,Cliente_var.y,474,Velocidad_var,true);
		}



		// Aserradero

		public function En_Madera(event:MouseEvent):void
		{
			Lista_Trabajos.visible = false;
			Placa_ir_Aserradero.visible = false;
			Madera_MC.visible = true;
			Madera_MC.Alfajias_Ingreso.text = "";
			Madera_MC.Tablones_Ingreso.text = "";
			Madera_MC.Resultado_Madera_BT.addEventListener(MouseEvent.MOUSE_DOWN, Resultado_Madera);
			Madera_MC.Resultado_Madera_BT2.addEventListener(MouseEvent.MOUSE_DOWN, Total_Madera);
		}

		public function En_Madera_pedido():void
		{
			Placa_ir_Aserradero.visible = false;
			Lista_Trabajos.visible = false;
			Madera_MC.visible = true;
			Madera_MC.Alfajias_Ingreso.text = "";
			Madera_MC.Tablones_Ingreso.text = "";
			Madera_MC.Resultado_Madera_BT.addEventListener(MouseEvent.MOUSE_DOWN, Resultado_Madera);
			Madera_MC.Resultado_Madera_BT2.addEventListener(MouseEvent.MOUSE_DOWN, Total_Madera);
		}
		public function Total_Madera(mc:MouseEvent):void
		{
			Alfajias_var_Numb = Number(Madera_MC.Alfajias_Ingreso.text);
			Tablones_var_Numb = Number(Madera_MC.Tablones_Ingreso.text);
			var Alfajias_var_compra = Alfajias_var_Numb * Alfajias_precio;
			var Tablones_var_compra = Tablones_var_Numb * Tablones_precio;

			//Resultado_Maderas_var = Alfajias_var_Numb + Tablones_var_Numb;
			//trace(Alfajias_var_compra + Tablones_var_compra);
			Dinero_var = Dinero_var - Alfajias_var_compra - Tablones_var_compra;
			Madera_MC.Total_TX.text = String(Alfajias_var_compra + Tablones_var_compra);
			//Madera_MC.visible = false;
		}

		public function Resultado_Madera(mc:MouseEvent):void
		{
			Alfajias_var_Numb = Number(Madera_MC.Alfajias_Ingreso.text);
			Tablones_var_Numb = Number(Madera_MC.Tablones_Ingreso.text);
			var Alfajias_var_compra = Alfajias_var_Numb * Alfajias_precio;
			var Tablones_var_compra = Tablones_var_Numb * Tablones_precio;
			//Resultado_Maderas_var = Alfajias_var_Numb + Tablones_var_Numb;
			//trace(Alfajias_var_compra + Tablones_var_compra);
			Dinero_var = Dinero_var - Alfajias_var_compra - Tablones_var_compra;
			Dinero.text = String(Dinero_var);
			Alfajias_Stock = Alfajias_Stock + Alfajias_var_Numb;
			Tablones_Stock = Tablones_Stock + Tablones_var_Numb;
			Madera_MC.visible = false;
		}


		//Barraca
		public function En_Barraca():void
		{
			Lista_Trabajos.visible = false;
			Barra.visible = true;
			Barra.Taladro_Pie.addEventListener(MouseEvent.MOUSE_DOWN, Comprar_Taladro_Pie);
			Barra.Caladora_Mano.addEventListener(MouseEvent.MOUSE_DOWN, Comprar_Caladora);
			Barra.Lata_Pintura.addEventListener(MouseEvent.MOUSE_DOWN, Comprar_Pintura);
			Barra.Cafetera_Chica.addEventListener(MouseEvent.MOUSE_DOWN, Comprar_Cafetera_Chica);
			Barra.Mesa_Combinada.addEventListener(MouseEvent.MOUSE_DOWN, Comprar_Mesa_Combinada);
			Barra.Sierra_Pie.addEventListener(MouseEvent.MOUSE_DOWN, Comprar_Sierra_Pie);
		}

		public function Comprar_Caladora(event:MouseEvent):void
		{
			cala_little.visible = true;
			Dinero_var = Dinero_var - Caladora_precio;
			Barra.visible = false;
			Cala_little_var = 1;
		}

		public function Comprar_Sierra_Pie(event:MouseEvent):void
		{
			Caladora_de_Pie.visible = true;
			Dinero_var = Dinero_var - Caladora_Pie_precio;
			Barra.visible = false;
			Cala_pie_var = 1;
		}

		public function Comprar_Pintura(event:MouseEvent):void
		{
			Lata_Pintura_MC.visible = true;
			Dinero_var = Dinero_var - Pinturas_precio;
			Barra.visible = false;
			Pintura_var = 1;
		}

		public function Comprar_Cafetera_Chica(event:MouseEvent):void
		{
			Cafetera_Chica.visible = true;
			Dinero_var = Dinero_var - Cafetera_precio;
			Barra.visible = false;
			Cafe_var = 1;
		}

		public function Comprar_Mesa_Combinada(event:MouseEvent):void
		{
			Combinada_MC.visible = true;
			Dinero_var = Dinero_var - Mesa_Combinada_precio;
			Barra.visible = false;
			Combi_var = 1;
		}

		public function Comprar_Taladro_Pie(event:MouseEvent):void
		{
			cala_big.visible = true;
			Dinero_var = Dinero_var - Taladro_Pie_precio;
			Barra.visible = false;
			Tala_pie_var = 1;
		}
	}
}