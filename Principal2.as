package 
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
	import flash.net.URLRequest;
	import flash.display.Loader;

	import prueba;
	import Clientes;
	import Lista_Trabaj;
	import Barrio_MC;
	import Temporizador;





	public class Principal2 extends MovieClip
	{
		
		
		//creación personajes
		var Mormon1:Clientes_mormon = new Clientes_mormon;
		var Coqueta1:Clientes_coqueta = new Clientes_coqueta;
		var Punk1:Clientes_punky = new Clientes_punky;
		var Vieja1:Clientes_vieja = new Clientes_vieja;
		var Nena1:Clientes_nena_avion = new Clientes_nena_avion;
		var Viejo1:Clientes_viejo = new Clientes_viejo;
		var Cliente_MC = Coqueta1;
		var Carga_MC:cargaexterna = new cargaexterna;
		
		
		public var Trabajos_Terminados:Array = [];
		var Trabajos:Array = [];
		var Trabajo_Proceso = 0;
		var Trabajo_Que_se_Procesa = [];
		var Trabajos_Terminados_Entrega:Array = [];// lista de trabajos terminados
		var tiempo = 0;
		var avance = 0;
		var avance_porcentaje = 0;
		var porcentaje = 0;
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
	
		
		var snd:Sound = new Sound(new URLRequest("mp_ambiente_carpinteria.mp3"));
		
		var Consejo_Asesora = false;
		var Consejo_Asesora_Array:Array = new Array(4,6,8);
		var i = 0;
		var Flag_Juego = false;
		var Ya_jugo = false;
		var Ya_jugo_2 = false;


		//Timers
		public var _timer:Timer = new Timer(1000);// se ejecuta cada un segundo
		public var _timer_jugador:Timer = new Timer(1000);// se ejecuta cada un segundo
		public var _timer_espera_cliente:Timer = new Timer(1000);// se ejecuta cada un segundo
		private var _tiempo_jugado:uint = 0;
		private var _tiempo_para_jugar:uint = 50;// definir el tiempo total aca
		var Time:Temporizador = new Temporizador  ;
		var Pausado=false;

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
		
		// Cargar peli
		
		public var peli2:URLRequest;
		public var peli:URLRequest;
		public var cargador:Loader;
		public var pelicula:Object;


		public var Gastos_Fijos = 1500;
		var Sueldos = 0;
		var Gastos_Personales = 500;
		var Mi_Trabajo:Array = new Array();
		var mult = 0;//multiplicador
		var multiplicador = 8;
		var Gastos = 0;
		var pago_cuota = false;
		var pago_cuota_mes2 = false;

		//Clientes
		var Cliente_Stage = false;
		var Buscar = "";//nombre del cliente que termino
		var Buscar_flag = false;// flag para saber si se termino un trabajo
		var Cliente_Buscar = false;// determina si el cliente que está en el stage es el que viene abuscar el pedido
		var Client:Clientes = new Clientes();
		var Cliente = 0;
		var Nuevo_Cliente = "";
		var Viejo_Cliente = "";
		

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
		public var Sierra_pie_var = 0;
		public var Pintura_var = 0;
		public var Combi_var = 0;
		var Tala_pie_var = 0;
		var Cafe_var = 0;
		
		// Comunidad
		var Ya_pidio = false


		var variable = Time.Dia_var;


		public function Principal2()
		{
			
			this.addEventListener(Event.ENTER_FRAME, Botones);
			init();
		}
		
		public function remover(){
			
		}
		
		
		public function init():void
		{
			_timer.start();
			this.addEventListener(MouseEvent.MOUSE_DOWN, fnBotonesStage);
			_timer.addEventListener(TimerEvent.TIMER, timerListener);
			snd.play(0, 100);
			
			//asignamos a memoria la variable que cargara el archivo
			cargador = new Loader() as Loader;
			//carga peli externa
			peli = new URLRequest("recoleccion_final.swf");
			
			//restringir valores campo numérico
			Madera_MC.Alfajias_Ingreso.restrict = "0-9";
			Madera_MC.Tablones_Ingreso.restrict = "0-9";

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
			Asesora_MC2.visible = false;
			Punk.visible = false;
			Mormon.visible = false;
			Punk.visible = false;
			Vieja.visible = false;
			Viejo.visible = false;
			Coqueta.visible = false;
			Nena.visible = false;
			Ayuda_MC.visible = false;
			Pedido_Comunidad_MC.visible = false;
			Placa_financiera.candado.visible = true;
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
			Asesora_MC2.Close.addEventListener(MouseEvent.MOUSE_DOWN, Asesora_MC2_Cerrar);
			Pausa_BT.addEventListener(MouseEvent.MOUSE_DOWN, Pausar);
			
			//Botones Cerrar pantallas;
			Lista_Trabajos.addEventListener(MouseEvent.MOUSE_DOWN,fnBotonesTrabajos);
			Lista_Trabajos.Cerrar_BT.addEventListener(MouseEvent.MOUSE_DOWN, fnCerrarLista);
			Placa_financiera.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, fnPlaca_Financiera_Cerrar);
			Placa_financiera.btn_pagar.addEventListener(MouseEvent.MOUSE_DOWN, fnPlaca_Financiera_pagar);
			Barrio.Comunidad_Cerrar.addEventListener(MouseEvent.MOUSE_DOWN, fnComunidad);
			Placa_Clientes.addEventListener(MouseEvent.MOUSE_DOWN, fnPlaca_Trabajos_BT);
			Carga_MC.Cerrar_BT.addEventListener(MouseEvent.MOUSE_DOWN, fnCarga_MC);
			
			if (pelicula.termino == true){
				removeChild(cargador);
				Time.Empezar(true);
			}
			
			if (Ya_jugo_2 == true){
				Lista_Trab.fnHacer(true);
			}
			
			
			if (en_proceso == false){
				Lista_Trabajos.Arreglar_BT.gotoAndStop(1);
			}
			else{
				Lista_Trabajos.Arreglar_BT.gotoAndStop(2);
			}
		}
		
		
		//Pagar gastos mensuales
		public function fnPlaca_Financiera_pagar(event:MouseEvent):void
		{
			if (Placa_financiera.candado.visible == false && pago_cuota_mes2 == false){
			
			if (Gastos >= Dinero_var ){
				Texto.text = "no tenes dinero";
			}
			else {
				Dinero_var = Dinero_var - Gastos;
				Placa_financiera.candado.visible = true;
				pago_cuota = true;
				/*if (pago_cuota == true && pago_cuota_mes2 == false){
					pago_cuota_mes2 =true;
				}*/
			}
			}
		}



		//LINEA DE TIEMPO: acá se controla por tiempo todo;

		public function timerListener(e:TimerEvent):void
		{
			
			Trabajos_No_Entregados();
			Dinero_caida.Caida.Texto.text = Dinero_var;
			
			avance_porcentaje = avance_porcentaje - 1;
			Texto.text = String(avance_porcentaje/porcentaje);

			//llama a un nuevo cliente
			Lista_Trab.Tiempo(Time.Hora_var);
			
			//Botones_clientes
			Cliente_MC.globito.addEventListener(MouseEvent.MOUSE_DOWN, fnPlaca_Cliente);
			
			Cliente_Stage = Cliente_MC.cliente_stage;
			
			
			
			
			if (Dinero_var < 50){
				Texto.text = "dinero bajo";
			}
			
			//Pagar cuota
			
			if (Time.Semana_var == Time.Pagar_Primera_Cuota && Time.Hora_Dia_var == 1 && pago_cuota == false){
				Placa_financiera.candado.visible = false;
				Asesora_MC2.visible = true;
				Asesora_MC2.Texto.text = "Tenés que pagar";
			}
			
			//Pagar cuota2
			if (Time.Dia_var == Time.Pagar_Segunda_Cuota && Time.Hora_Dia_var == 1 && pago_cuota_mes2 == false){
				Placa_financiera.candado.visible = false;
			}
			
			//Comunidad;
			if (Cliente_Stage == false && Time.Dia_var == Time.Pedido_Comunidad_1 && Ya_pidio == false)
			{
				Pedido_Comunidad_MC.visible = true;
				Ya_pidio = true;
			}
			
			
			if (Time.Dia_var == (Time.Segundo_Pedido_Comunidad - 1)){
				Ya_pidio = false;
			}
			
			if (Cliente_Stage == false && Time.Dia_var == Time.Segundo_Pedido_Comunidad && Ya_pidio == false)
			{
				Pedido_Comunidad_MC.visible = true;
				Ya_pidio = true;
			}
			
			if (Comunidad_var < 50){
				Texto.text = "comunidad baja";
			}
			
			//Segundo Juego
			if (Cliente_Stage == false && Time.Dia_var == Time.Segundo_Juego && Ya_jugo_2 == false)
			{
				peli2 = new URLRequest("carpinteria1.swf");
				var cargarSWF:Loader = new Loader();
				cargarSWF.load(peli2);
				this.addChild(cargarSWF);
				Ya_jugo_2 = true;
				}
			
			//Primer Juego
			if (Cliente_Stage == false && Time.Dia_var == Time.Primer_Juego && Ya_jugo == false)
			{
				//Cliente_MC.Velocidad_var = Velocidad_var;
				Cargar();
				Time.Pausar();
				Ya_jugo = true;
			}
			
			
						
			//Malo;
			if (Cliente_Stage == false && Time.Semana_var == 4)
			{
				Placa_Malo_MC.visible = true;
			}
			
			//Consejos Asesora
			
			if (Cliente_Stage == false && Time.Dia_var == Consejo_Asesora_Array[i] && Consejo_Asesora == false)
			{
				Asesora_MC2.visible = true;
				var Text_Asesora = ((randomRange(0, 20)));
				Asesora_MC2.Texto.text = Client.TextosAsesora[Text_Asesora];
				Consejo_Asesora = true;
				i = i+1;
			}
			
			if (Cliente_Stage == false && Time.Dia_var == 16 && Ya_pidio == false == Flag_Juego == false)
			{
				Flag_Juego = true;
				(root.loaderInfo.loader.root as Object).cargar2();
				Time.Pausar();
			}

// para ver la cantidad de material existente
			Tablones.text = String(Tablones_Stock);
			Alfajias.text = String(Alfajias_Stock);
			Hora_var = Time.Hora_var;
			Horas.text = String(Time.Hora_var) + "  horas";
			Dia.text = String(Time.Dia_var);
			Semana.text = String(Time.Semana_var);
			Dinero.text = String(Dinero_var);
			Comunidad.text = Comunidad_var;
			Placa_financiera.txt_total_capital.text = Dinero_var;
			Placa_financiera.txt_mes.text = String(Time.Mes_var);
			Placa_financiera.txt_cuota.text = String(Cuota_Banco);
			Placa_financiera.txt_gastos_fijos.text = String(Gastos_Fijos);
			Placa_financiera.txt_gastos_personales.text = String(Gastos_Personales);
			Placa_financiera.txt_sueldos.text = String(Sueldos);
			Placa_financiera.txt_total_gastos.text = String(Sueldos + Gastos_Personales + Gastos_Fijos + Cuota_Banco);
			Gastos = Sueldos + Gastos_Personales + Gastos_Fijos + Cuota_Banco;
			Placa_financiera.txt_saldo.text = String (Dinero_var - Gastos);

			//NUEVOS CLIENTES

			//Trabajos = Lista_Trab.Trabajo;//Recibe el listado de los clientes armado en la otra clase

			if (Lista_Trab.Nuevo_Cliente == 1 && Cliente_Stage == false && Time.Dale == true && Placa_Clientes.visible == false)
			{
				// Recibe el nombre del cliente;
				Hola_Cliente();
			}


			Lista_Trabajos.Trabajo1.text = String(Trabajos[6] + " en espera");
			Lista_Trabajos.Trabajo2.text = String(Trabajos[6 + (1*multiplicador)] + " en espera");
			Lista_Trabajos.Trabajo3.text = String(Trabajos[6 + (2*multiplicador)] + " en espera");
			Lista_Trabajos.Trabajo4.text = String(Trabajos[6 + (3*multiplicador)] + " en espera");
			Lista_Trabajos.Trabajo5.text = String(Trabajos[6 + (1*multiplicador)] + " en espera");
			

			Visible();// vuelve los botones de los trabajos visibles o invisibles


			//detecta botones en el escenario;
			this.addEventListener(MouseEvent.MOUSE_DOWN, fnBotonesStage);
			//Cliente_var.globito.addEventListener(MouseEvent.MOUSE_DOWN, fnPlaca_Cliente);


			// ver si se termino laburo;
			if (avance == _timer.currentCount)
			{
				//trace("contador  " + contador);
				var empujar = Trabajo_Que_se_Procesa[0]+ _timer.currentCount;
				Trabajos_Terminados_Entrega.push(empujar); //pone en un array los trabajos terminados a buscar
				Trabajos_Terminados_Entrega.push(Trabajo_Que_se_Procesa[1]); // precio
				Trabajos_Terminados_Entrega.push(Trabajo_Que_se_Procesa[2]); // nombre
				Trabajos_Terminados_Entrega.push(Trabajo_Que_se_Procesa[3]); // mult
				Trabajo_Que_se_Procesa.splice([0], 4);
				Trabajos[2]  = 0;
				Trabajos[3] = 0;
				en_proceso = false;
				Lista_Trabajos.Arreglar_BT.gotoAndStop(1);
				fnBuscar_Trabajo2();
				
			}
			//fnBuscar_Trabajo();
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
		
		function Trabajos_No_Entregados():void{
			var numero:Number;
			for(var i:int=0; i<1; i++) {
				//Venir_Buscar.text = String(Trabajos[(i*multiplicador)+7]);
				
				numero = Trabajos[(i*multiplicador)+7];
				Venir_Buscar.text = String(numero);
				//Trabajos[(i*multiplicador)+7] = numero ;
			}
			for(var ii:int=0; i<1; i++) {
				
				
				Trabajos[(ii*multiplicador)+7] = Trabajos[(ii*multiplicador)+7] - 1;
			}
		}


		//Funcion Random general

		private function randomRange(minNum:Number, maxNum:Number):Number
		{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}


		//Botones en general
		
		 function fnCarga_MC(event:MouseEvent):void
		 {
		 removeChild(Carga_MC);
		 Time.Empezar(true);
		 Carga_MC = null;
			 }

		//acciones botones escenario
		
		function Pausar(event:MouseEvent):void
		{
			if (Pausado == false)
			{
			Time.Pausar();
			Pausa_BT.gotoAndStop(3);
			 Pausado=true;
			 }
			 else
			{
			Pausa_BT.gotoAndStop(1);
			 Pausado=false;
			 Time.Empezar(true);
			}
			
		}

		function fnBotonesStage(event:MouseEvent):void
		{
			//trace(event.target.name, event.currentTarget.name);
			switch (event.target.name)
			{
				case "Asesora_B" :
					if (Asesora_start.visible == false){
						Asesora_MC2.visible = true;
						var Text_Asesora = ((randomRange(0, 20)));
						Asesora_MC2.Texto.text = Client.TextosAsesora[Text_Asesora];
					}
					break;
				case "Comunidad_BT" :
					if (Asesora_start.visible == false){
						Barrio.visible = true;
					}
					break;
				case "Ir_Pantalla_Trabajos_BT" :
					if (Asesora_start.visible == false){
						Lista_Trabajos.visible = true;
					}
					break;
				case "Ir_Madera" :
					if (Asesora_start.visible == false){
						Lista_Trabajos.visible = false;
						Madera_MC.visible = true;
						Madera_MC.Alfajias_Ingreso.text = "";
						Madera_MC.Tablones_Ingreso.text = "";
						Madera_MC.Resultado_Madera_BT.addEventListener(MouseEvent.MOUSE_DOWN, Resultado_Madera);
						Madera_MC.Resultado_Madera_BT2.addEventListener(MouseEvent.MOUSE_DOWN, Total_Madera);
						Madera_MC.Cerrar_BT.addEventListener(MouseEvent.MOUSE_DOWN, Resultado_Madera);
					}
					break;
				case "Ir_Barraca" :
					if (Asesora_start.visible == false){
						En_Barraca();
					}
					break;
				case "Ayuda_BT" :
					Ayuda_MC.visible = true;
					Ayuda_MC.gotoAndStop(1);
					break;
				case "Cargar_Peli":
					(root.loaderInfo.loader.root as Object).cargar2();
					Time.Pausar();
					break;
				case "Financiera_BT" :
					if (Asesora_start.visible == false){
						Placa_financiera.visible = true;
					}
					break;
			}
		}
		
		//carga pelicula

		function Cargar(){
         //cargamos el archivo
         cargador.load(peli);
		 //SoundMixer.stopAll(); 
         //agregamos un listener que espere a que la carga este completa, si esta completa llamara la funcion "fincarga"
         cargador.contentLoaderInfo.addEventListener(Event.COMPLETE, fincarga);
     	}
		
		function fincarga(e:Event){
        pelicula = e.currentTarget.content;
		//agregamos cargador al escenario para poder visualizar el contenido de peli.swf
		//removeChildAt(0);
		//MovieClip(root).addChild(cargador);
		addChildAt(cargador, 41);
		 
		 
         //agregamos el listener que llamara a la funcion de peli a load_btn;
         //load_btn.addEventListener(MouseEvent.CLICK, llamarfuncionpeli);
         //load_btn.text_btn.text = "mover";
      }

		function fnPlaca_Financiera_Cerrar(event:MouseEvent):void
		{
			Placa_financiera.visible = false;
			Consejo_Asesora = false;
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
		
		public function Asesora_MC2_Cerrar(event:MouseEvent):void
		{
			Asesora_MC2.visible = false;
			Consejo_Asesora = false;
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
					Time.Empezar(true);
					break;
			}
		}

		public function fnAsesora_start(event:MouseEvent):void
		{
			switch (event.target.name)
			{
				case "Suguiente_BT" :
					Asesora_start.nextFrame();
					//snd.play(0, 100);
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
					//Comunidad_var = Comunidad_var + 300;
					
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
			if (Trabajos[0*multiplicador] > 1)
			{
				Lista_Trabajos.Trabajo1.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo1.visible = false;
			}

			if (Trabajos[1*multiplicador] > 0)
			{
				Lista_Trabajos.Trabajo2.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo2.visible = false;
			}

			if (Trabajos[2*multiplicador] > 0)
			{
				Lista_Trabajos.Trabajo3.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo3.visible = false;
			}
			if (Trabajos[3*multiplicador] > 0)
			{
				Lista_Trabajos.Trabajo4.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo4.visible = false;
			}
			if (Trabajos[4*multiplicador] > 0)
			{
				Lista_Trabajos.Trabajo5.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo5.visible = false;
			}
			
		}
		function Placa_ir_Aserradero_Cerrar(event:MouseEvent):void{
			Placa_ir_Aserradero.visible = false;
		}
		//Lógica Trabajo

		// ver si esta la fecha de entrega laburo
		/*public function fnBuscar_Trabajo()
		{
			var length:uint = Trabajos_Terminados_Entrega.length;
			for (var i:uint=0; i<length; i++)
			{
				if (Trabajos_Terminados_Entrega[i] == _timer.currentCount)
				{
					Venir_Buscar.text =(String(Trabajos_Terminados_Entrega[i + 2]) + " venite a buscar el laburo");
					Dinero_var = Dinero_var + (Trabajos_Terminados_Entrega[i + 1]);
					Trabajos_Terminados_Entrega.splice([i], 3);
					var mmm = i * 7;
					Trabajos.splice([mmm], 7);
					Buscar = Nombre[i];
					Nombre.splice([i],1);
					Buscar_flag = true;
					trace("Esto es " + i);
					trace("Nombre " + Nombre);
					
				}
			}
		}*/
		
		public function fnBuscar_Trabajo2()
		{
					Venir_Buscar.text =(String(Trabajos_Terminados_Entrega[2] + " venite a buscar el laburo"));
					var client = Trabajos_Terminados_Entrega[2];
					Dinero_var = Dinero_var + (Trabajos_Terminados_Entrega[1]);
					Trabajos.splice([Trabajos_Terminados_Entrega[3]], multiplicador);
					Trabajos_Terminados_Entrega.splice([0], 4);
					Visible();
					Lista_Trabajos.Datos_Materiales.text ="";
					Lista_Trabajos.Datos_Alfajias.text = "";
					Lista_Trabajos.Datos_Tablones.text = "";
					Lista_Trabajos.Datos_Tiempo.text = "";
					Lista_Trabajos.Datos_Precio.text = "";
					Buscar = Nombre[1];
					// Placa Clente buscar
					
					Dinero_caida.gotoAndPlay(2);
					Placa_Clientes.visible = true;
					Placa_Clientes.gotoAndStop(5);
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
					Lista_Trabajos.Raya.visible = false;
					
					switch(client){
					case "Julio":
						Placa_Clientes.Punk_MC.visible = true;
						break;
					case "Olga":
						Placa_Clientes.Vieja_MC.visible = true;
						break;
					case "Andrea":
						Placa_Clientes.Coqueta_MC.visible = true;
						break;
					case "Gustavo":
						Placa_Clientes.Viejo_MC.visible = true;
						break;
					case "Lucía":
						Placa_Clientes.Nena_MC.visible = true;
						break;
					case "Martín":
						Placa_Clientes.Mormon_MC.visible = true;
						break;
					}
					
					//Buscar_flag= false;
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
					mult = 1*multiplicador;
					trace("Soy   " + Trabajos);
					tiempo = Trabajos[1 + mult];
					Trabajo_Proceso = Trabajos[0 + mult];
					Entrega = Trabajos[4 + mult];
					Nombre_Elegido = Trabajos[6 + mult];
					fnLista_Trabajos();
					break;
				case "Trabajo3" :
					mult = 2*multiplicador;
					trace("Soy   " + Trabajos);
					tiempo = Trabajos[1 + mult];
					Trabajo_Proceso = Trabajos[0 + mult];
					Entrega = Trabajos[4 + mult];
					Nombre_Elegido = Trabajos[6 + mult];
					fnLista_Trabajos();
					break;
				case "Trabajo4" :
					mult = 3*multiplicador;
					trace("Soy   " + Trabajos);
					tiempo = Trabajos[1 + mult];
					Trabajo_Proceso = Trabajos[0 + mult];
					Entrega = Trabajos[4 + mult];
					Nombre_Elegido = Trabajos[6 + mult];
					fnLista_Trabajos();
					break;
				case "Trabajo5" :
					mult = 4*multiplicador;
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
			Lista_Trabajos.Datos_Cliente.text = String(Trabajos[6 + mult]);
			Lista_Trabajos.Datos_Alfajias.text = String(Trabajos[3 + mult]);
			Lista_Trabajos.Datos_Tablones.text = String(Trabajos[2 + mult]);
			Lista_Trabajos.Datos_Materiales.text = "Tablones " + String(Trabajos[2 + mult]) + "  Alfajías " + String(Trabajos[3 + mult]);
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
		// Inicia el laburo y verifica están compradas las herramientas y hay stock de materiales.

		public function fnIniciar_Trabajo():void
		{
			Venir_Buscar.text = String(Trabajos[2]);
			if (Cala_little_var == 1 && Combi_var == 1) {
				if (Tablones_Stock > Trabajos[2] && Alfajias_Stock > Trabajos[3])
				
				{avance
					if (en_proceso == false)
					{
						avance = Trabajos[1 + mult] + _timer.currentCount;
						avance_porcentaje = Trabajos[1 + mult];
						porcentaje = avance_porcentaje;
						Trabajo_Que_se_Procesa.push(Trabajos[4 + mult]); //Tiempo
						Trabajo_Que_se_Procesa.push(Trabajos[0 + mult]); //Dinero
						Trabajo_Que_se_Procesa.push(Trabajos[6 + mult]); //Nombre
						Trabajo_Que_se_Procesa.push(mult); //Posición
						Lista_Trabajos.Arreglar_BT.gotoAndStop(2);
						Alfajias_Stock = Alfajias_Stock - Trabajos[3];
						Tablones_Stock = Tablones_Stock - Trabajos[2];
						en_proceso = true;
						Lista_Trabajos.Raya.visible =true;
						var myPunkx:Tween = new Tween(Lista_Trabajos.Raya,"x",None.easeInOut,-650,-454,porcentaje,true);
						
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
					if (Trabajos[0] > 1){
					fnEn_Madera_pedido_Placa();
					}
				}
			}
			else 
			{
				Placa_ir_Barraca.visible = true;
				Lista_Trabajos.visible = false;
			}
			//Buscar_flag = false;
		}
		
		
		function fnEn_Madera_pedido_Placa():void
		{
			Placa_ir_Aserradero.visible = true;
			Madera_MC.visible = false;
			Lista_Trabajos.visible = false;
		}
		
		
		// Función de nuevo cliente
		
		public function Hola_Cliente():void{
			Nuevo_Cliente = Client.Cliente[(randomRange(0, 4))];
			//Texto.text = Nuevo_Cliente + "   " + Viejo_Cliente;
			if (Viejo_Cliente == Nuevo_Cliente){
				Hola_Cliente();
			}
			else 
			{
				Nuevos_Cliente();
			}
		}

		public function Nuevos_Cliente():void
		{
			Viejo_Cliente = Nuevo_Cliente;
			switch (Nuevo_Cliente)
			{
				case "Martín" :
					Cliente_cara = Placa_Clientes.Mormon_MC;
					Velocidad_var = 6;
					Cliente_var = Mormon;
					Cliente_MC = Mormon1;
					Mover_cliente();
					fnTexto_Pedido();
					Cliente_var.visible = true;
					break;
				case "Olga" :
					Cliente_cara = Placa_Clientes.Vieja_MC;
					Velocidad_var = 4;
					Cliente_var = Vieja;
					Cliente_MC = Vieja1;
					Mover_cliente();
					fnTexto_Pedido();
					Cliente_var.visible = true;
					break;
				case "Lucía" :
					Cliente_cara = Placa_Clientes.Nena_MC;
					Velocidad_var = 4;
					Cliente_var = Nena;
					Cliente_MC = Nena1;
					Mover_cliente();
					fnTexto_Pedido();
					Cliente_var.visible = true;
					break;
				case "Andrea" :
					Cliente_cara = Placa_Clientes.Coqueta_MC;
					Velocidad_var = 7;
					Cliente_var = Coqueta;
					Cliente_MC = Coqueta1;
					Mover_cliente();
					fnTexto_Pedido();
					Cliente_var.visible = true;
					break;
				case "Julio" :
					Placa_Clientes.Punk_MC.visible = true;
					Cliente_cara = Placa_Clientes.Punk_MC;
					Velocidad_var = 6;
					Cliente_var = Punk;
					Cliente_MC = Punk1;
					Mover_cliente();
					fnTexto_Pedido();
					break;
				case "Gustavo" :
					Cliente_cara = Placa_Clientes.Viejo_MC;
					Velocidad_var = 4;
					Cliente_var = Viejo;
					Cliente_MC = Viejo1;
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
					Cliente_cara = Placa_Clientes.Punk_MC;
					Velocidad_var = 6;
					Cliente_var = Punk;
					Mover_cliente_Buscar();
					Cliente_var.visible = true;
					//fnTexto_Pedido();
					break;
				case "Gustavo" :
					Cliente_cara = Placa_Clientes.Viejo_MC;
					Velocidad_var = 10;
					Cliente_var = Viejo;
					Mover_cliente_Buscar();
					Cliente_var.visible = true;
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
			Cliente_MC.Velocidad_var = Velocidad_var;
			addChildAt(Cliente_MC,12);
			Cliente_MC._timer.start();
			Cliente_MC.gotoAndPlay("frente");
			Cliente_MC.cliente_stage = true;
			Cliente_MC.adelante = true;
			Cliente_MC.x=200;
			Cliente_MC.y=500;
			Cliente_Stage = true;
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
			//if (Buscar_flag == false)
			//{
				//if (_timer_jugador.currentCount != 0)
				//{// si se está yendo no se habilita la placa
				if (Cliente_MC.Irse == false){
					
				
					Placa_Clientes.visible = true;
					Cliente_cara.visible = true;
					
					}
					/*_timer_espera_cliente.stop();
					_timer_espera_cliente.reset();
					_timer_jugador.stop();
					_timer_jugador.reset();*/
				//}
			//}
			/*if (Buscar_flag == true && Cliente_Buscar == true)
			{
				Placa_Clientes.visible = true;
				Placa_Clientes.gotoAndStop(2);
				Cliente_cara.visible = true;
				_timer_espera_cliente.stop();
				_timer_espera_cliente.reset();
				_timer_jugador.stop();
				_timer_jugador.reset();
			}*/
		}


		public function fnPlaca_Trabajos_BT(event:MouseEvent):void
		{
			switch (event.target.name)
			{
				case "Yes_BT" :
					fnClientes_Pedido();
					Cliente_MC.irse();
					break;
				case "Yes_BT_Buscar" :
					fnClientes_Pedido_Buscar();
					break;
				case "No_BT" :
					Placa_Clientes.gotoAndStop(3);
					break;
				case "Chau" :
					Comunidad_var = Comunidad_var - 20;
					Cliente_MC.irse();
					fnClientes_Pedido_No();
					break;
					case "Chau2" :
					Cerrar_Placa_Clientes();
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
			Trabajos.push(Nuevo_Cliente);
			Trabajos.push(5);
			Nombre.push(Nuevo_Cliente);
			trace(Trabajos);
			Cerrar_Placa_Clientes();
			/*Placa_Clientes.visible = false;
			Placa_Clientes.Mormon_MC.visible = false;
			Placa_Clientes.Nena_MC.visible = false;
			Placa_Clientes.Punk_MC.visible = false;
			Placa_Clientes.Vieja_MC.visible = false;
			Placa_Clientes.Viejo_MC.visible = false;
			Placa_Clientes.Coqueta_MC.visible = false;*/
			Cliente_var.visible= false;
			Cliente_Stage = false;
		}
		
		function fnClientes_Pedido_No():void
		{
			Placa_Clientes.visible = false;
			
			Placa_Clientes.gotoAndStop(1);
			Placa_Clientes.Mormon_MC.visible = false;
			Placa_Clientes.Nena_MC.visible = false;
			Placa_Clientes.Punk_MC.visible = false;
			Placa_Clientes.Vieja_MC.visible = false;
			Placa_Clientes.Viejo_MC.visible = false;
			Placa_Clientes.Coqueta_MC.visible = false;
			Cliente_var.gotoAndPlay("espalda");
			Cliente_var.visible= false;
			Cliente_Stage = false;
		}

		function fnClientes_Pedido_Buscar():void
		{
			Placa_Clientes.visible = false;
			Placa_Clientes.gotoAndStop(1);
			trace(Cliente_var);
			Placa_Clientes.Mormon_MC.visible = false;
			Placa_Clientes.Nena_MC.visible = false;
			Placa_Clientes.Punk_MC.visible = false;
			Placa_Clientes.Vieja_MC.visible = false;
			Placa_Clientes.Viejo_MC.visible = false;
			Placa_Clientes.Coqueta_MC.visible = false;
			Cliente_var.gotoAndPlay("espalda");
		}
		
		function Cerrar_Placa_Clientes():void
		{
			Placa_Clientes.visible = false;
			Placa_Clientes.Mormon_MC.visible = false;
			Placa_Clientes.Nena_MC.visible = false;
			Placa_Clientes.Punk_MC.visible = false;
			Placa_Clientes.Vieja_MC.visible = false;
			Placa_Clientes.Viejo_MC.visible = false;
			Placa_Clientes.Coqueta_MC.visible = false;
			Placa_Clientes.gotoAndStop(1);
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
			Madera_MC.Cerrar_BT.addEventListener(MouseEvent.MOUSE_DOWN, Resultado_Madera);
			
		}
		
		public function Cerrar_Madera(event:MouseEvent):void
		{
			Madera_MC.visible = false;
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
			Madera_MC.Cerrar_BT.addEventListener(MouseEvent.MOUSE_DOWN, Cerrar_Madera);
			
		}
		public function Total_Madera(mc:MouseEvent):void
		{
			Alfajias_var_Numb = Number(Madera_MC.Alfajias_Ingreso.text);
			Tablones_var_Numb = Number(Madera_MC.Tablones_Ingreso.text);
			var Alfajias_var_compra = Alfajias_var_Numb * Alfajias_precio;
			var Tablones_var_compra = Tablones_var_Numb * Tablones_precio;
			if (Dinero_var > (Alfajias_var_compra + Tablones_var_compra)){
			//Dinero_var = Dinero_var - Alfajias_var_compra - Tablones_var_compra;
			Madera_MC.Total_TX.text = String(Alfajias_var_compra + Tablones_var_compra);
			}
			else {
			Madera_MC.Total_TX.text = "no te alcanza";
			}
		}

		public function Resultado_Madera(mc:MouseEvent):void
		{
			Alfajias_var_Numb = Number(Madera_MC.Alfajias_Ingreso.text);
			Tablones_var_Numb = Number(Madera_MC.Tablones_Ingreso.text);
			var Alfajias_var_compra = Alfajias_var_Numb * Alfajias_precio;
			var Tablones_var_compra = Tablones_var_Numb * Tablones_precio;
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
			
			if (Tala_pie_var == 0){
				Barra.Taladro_Pie.addEventListener(MouseEvent.MOUSE_DOWN, Comprar_Taladro_Pie);
			}
			if (Cala_little_var == 0){
				Barra.Caladora_Mano.addEventListener(MouseEvent.MOUSE_DOWN, Comprar_Caladora);
			}
			if (Pintura_var == 0){
				Barra.Lata_Pintura.addEventListener(MouseEvent.MOUSE_DOWN, Comprar_Pintura);
			}
			if (Cafe_var == 0){
				Barra.Cafetera_Chica.addEventListener(MouseEvent.MOUSE_DOWN, Comprar_Cafetera_Chica);
			}
			if (Combi_var == 0){Barra.Mesa_Combinada.addEventListener(MouseEvent.MOUSE_DOWN, Comprar_Mesa_Combinada);
			}
			if (Sierra_pie_var == 0){
				Barra.Sierra_Pie.addEventListener(MouseEvent.MOUSE_DOWN, Comprar_Sierra_Pie);
			}
		}

		public function Comprar_Caladora(event:MouseEvent):void
		{
			cala_little.visible = true;
			Barra.Caladora_Mano.gotoAndStop(2);
			Dinero_var = Dinero_var - Caladora_precio;
			Barra.visible = false;
			Cala_little_var = 1;
		}

		public function Comprar_Sierra_Pie(event:MouseEvent):void
		{
			Caladora_de_Pie.visible = true;
			Barra.Sierra_Pie.gotoAndStop(2);
			Dinero_var = Dinero_var - Caladora_Pie_precio;
			Barra.visible = false;
			Sierra_pie_var = 1;
		}

		public function Comprar_Pintura(event:MouseEvent):void
		{
			Lata_Pintura_MC.visible = true;
			Barra.Lata_Pintura.gotoAndStop(2);
			Dinero_var = Dinero_var - Pinturas_precio;
			Barra.visible = false;
			Pintura_var = 1;
		}

		public function Comprar_Cafetera_Chica(event:MouseEvent):void
		{
			Cafetera_Chica.visible = true;
			Barra.Cafetera_Chica.gotoAndStop(2);
			Dinero_var = Dinero_var - Cafetera_precio;
			Barra.visible = false;
			Cafe_var = 1;
		}

		public function Comprar_Mesa_Combinada(event:MouseEvent):void
		{
			Combinada_MC.visible = true;
			Barra.Mesa_Combinada.gotoAndStop(2);
			Dinero_var = Dinero_var - Mesa_Combinada_precio;
			Barra.visible = false;
			Combi_var = 1;
		}

		public function Comprar_Taladro_Pie(event:MouseEvent):void
		{
			cala_big.visible = true;
			Barra.Taladro_Pie.gotoAndStop(2);
			Dinero_var = Dinero_var - Taladro_Pie_precio;
			Barra.visible = false;
			Tala_pie_var = 1;
		}
	}
}