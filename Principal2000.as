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
	import flash.display.Sprite;

	import prueba;
	import Clientes;
	import Lista_Trabaj;
	import Barrio_MC;
	import Temporizador;
	import Aserradero;
	import Clientes_Textil;
	import Lista_Trabaj_Textil;





	public class Principal2000 extends MovieClip
	{
		
		var Carpinteria_Juego:Boolean;
		var Prenda="";
		
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

		var Lista_Trab:Object;
		var Barr:Barrio_MC = new Barrio_MC();
		var Nombre:Array = new Array();
		var Nombre_Elegido = "";
		var Nuevo_Nuevo = 0;// flag para ver si hay un nuevo cliente
		var Cliente_var = "Mario";
		var Velocidad_var = 0;
		var Cliente_cara = "";
		//var Cliente_cara = "Placa_Clientes.Punk_MC";
		var Empleado = false;
		var Empleado_si = 1;
	
		
		var snd:Sound = new Sound(new URLRequest("mp_ambiente_carpinteria.mp3"));
		
		var Consejo_Asesora = false;
		var Consejo_Asesora_Array:Array = new Array(2,5,7, 9, 11, 13, 15);
		var i = 0;
		var Flag_Juego = false;
		var Ya_jugo = false;
		var Ya_jugo_2 = false;
		var Ya_jugo_3 = false;
		var Ya_jugo_4 = false;


		//Timers
		public var _timer:Timer = new Timer(1000);// se ejecuta cada un segundo
		public var _timer_jugador:Timer = new Timer(1000);// se ejecuta cada un segundo
		public var _timer_espera_cliente:Timer = new Timer(1000);// se ejecuta cada un segundo
		private var _tiempo_jugado:uint = 0;
		private var _tiempo_para_jugar:uint = 50;// definir el tiempo total aca
		var Time:Temporizador = new Temporizador  ;
		var Pausado=false;
		var Div_horas = 10;

		//Variables generales
		var Puntaje_var = 00000;
		var Puntajej = "00000";
		public var Comunidad_var = 600;
		public var Dia_var = 1;
		public var Semana_var = 1;
		public var Hora_var = 1;
		public var Hora_Dia_var = 0;// se incrementa cada hora
		public var Horas_para_Dia = 5;// variable que determina el día
		public var Dias_para_Semana = 5;// variable que determina duracion semana
		public var Dia_Semana = 0;// variable que cuenta los dias para llegar a a la semana
		public var Cuota_Banco = 3000;
		var Construccion = false;
		var Comunidad_Aviso = false;
		var numero = 0; // variable de horas de entrga
		
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
		var Cliente_Arreglando = "";
		var Cliente_Stage = false;
		var Buscar = "";//nombre del cliente que termino
		var Buscar_flag = false;// flag para saber si se termino un trabajo
		var Cliente_Buscar = false;// determina si el cliente que está en el stage es el que viene abuscar el pedido
		//var Client:Clientes = new Clientes();
		var Client:Object;
		var Cliente = 0;
		var Nuevo_Cliente = "";
		var Viejo_Cliente = "";
		var Cliente_borrar = 0;
		public var Character_var = 9;
		var Character_yes = false;
		var Malo = false;
		var myMalo = new Malefico_todo();
		//var myEmpleado = new boy_2_body();
		var Malo_var = false;

		//Materiales
		var Alfajias_var_Numb = 0;
		var Tablones_var_Numb = 0;
		public var Dinero_var = 6000;
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
		
		var toto = 9;


		var variable = Time.Dia_var;


		public function Principal2000()
		{
			//this.addEventListener(Event.ENTER_FRAME, Botones);
			init();
			
		}
		
		
		
		
		public function init():void
		{
			_timer.start();
			
			Carpinteria_Juego = false;
			
			this.addEventListener(MouseEvent.MOUSE_DOWN, fnBotonesStage);
			_timer.addEventListener(TimerEvent.TIMER, timerListener);
			this.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			snd.play(0, 100);
			
			Lista_Trabajos.Progreso.gotoAndStop(10);
			//asignamos a memoria la variable que cargara el archivo
			cargador = new Loader() as Loader;
			//carga peli externa
			peli = new URLRequest("carpinteria1.swf");
			peli2 = new URLRequest("carpinteria2.swf");
			
			//restringir valores campo numérico
			Madera_MC.Alfajias_Ingreso.restrict = "0-9";
			Madera_MC.Tablones_Ingreso.restrict = "0-9";
			
			Gracias.Punk_MC.visible = false;
			Gracias.Vieja_MC.visible = false;
			Gracias.Viejo_MC.visible = false;
			Gracias.Nena_MC.visible = false;
			Gracias.Mormon_MC.visible = false;
			Gracias.Coqueta_MC.visible = false;
			
			
			
			
			if (Carpinteria_Juego == true){
				Madera_MC.Alfajia.text = "ALFAJÍA = $ " + String(Alfajias_precio);
				Madera_MC.Tablon.text = "TABLON = $ " + String(Tablones_precio);
				Client = new Clientes();
				Lista_Trab = new Lista_Trabaj();
				
			}
			else{
				Madera_MC.Alfajia.text = "HILOS = $ " + String(Alfajias_precio);
				Madera_MC.Tablon.text = "TELAS = $ " + String(Tablones_precio);
				Client = new Clientes_Textil();
				Lista_Trab = new Lista_Trabaj_Textil();
				
				
			}
			
			//Graci.visible = false;

			//clientes
			Lista_Trabajos.Campera.visible = false;
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
			Loser.visible = false
			Win.visible = false;
			//Asesora_start.visible = false;

			//pantallas
			Empleado_Pantalla.visible = false;
			Placa_Clientes.visible = false;
			Lista_Trabajos.visible = false;
			Barra.visible = false;
			Madera_MC.visible = false;
			Placa_financiera.visible = false;
			//Barrio.visible = false;
			Placa_Malo_MC.visible = false;
			Gracias.visible=false;
			Placa_Construir.visible = false;

			// herramientas
			cala_big.visible = false;
			cala_little.visible = false;
			Cafetera_Chica.visible = false;
			Caladora_de_Pie.visible = false;
			Combinada_MC.visible = false;
			Lata_Pintura_MC.visible = false;
		}
		
		private function enterFrameHandler(event:Event):void
		{
			//No_cumpliste();
			this.addEventListener(Event.ENTER_FRAME, Botones);
			Barra.addEventListener(MouseEvent.MOUSE_DOWN, Botones_Barra);
			numero = ((randomRange(100, 200))); //Tiempo de entrega
		}
		
		public function fnTipoJuego(){
			/*if (Character_var == 3){
				Carpinteria_Juego = true;
			}
			
				if (Character_var == 1){
				Carpinteria_Juego = false;
			}*/
		}
		
		function fnCharacter():void{
		if (Character_var < 9 && Character_yes == false){// para retrasar carga de variable
		switch (Character_var){
			case 3:
			var myCharacter = new avriltodo();
			addChildAt(myCharacter, 10);
			Character_yes = true;
			
			break;
			case 1:
			myCharacter = new Ivantodo();
			addChildAt(myCharacter, 10);
			Character_yes = true;
			
			break;
			case 2:
			myCharacter = new lety_todo();
			addChildAt(myCharacter, 10);
			Character_yes = true;
			
			break;
			case 0:
			myCharacter = new nacho_todo();
			addChildAt(myCharacter, 10);
			Character_yes = true;
			
			break;
			}
		}
		}
		
		public function Botones_Barra(event:MouseEvent):void{
			
			switch (event.target.name)
			{
				case ("adelante") :
				Barra_Otra_Pag();
				break;
				case ("atras") :
				Barra_Otra_Pag_Atras();
				break;
				case ("cerrar") :
				Barra_Cerrar();
				break;
				case ("Cafetera_Chica") :
				Comprar_Cafetera_Chica();
				break;
				case ("Sierra_Pie") :
				Comprar_Sierra_Pie();
				break;
				case ("Caladora_Mano") :
				Comprar_Caladora();
				break;
				case ("Mesa_Combinada") :
				Comprar_Mesa_Combinada();
				break;
				case ("Lata_Pintura") :
				Comprar_Pintura();
				break;
				case ("Taladro_Pie") :
				Comprar_Taladro_Pie();
				break;
			}
			
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
			Lista_Trabajos.Comprar_Madera.addEventListener(MouseEvent.MOUSE_DOWN, En_Madera);
			Asesora_MC2.Close.addEventListener(MouseEvent.MOUSE_DOWN, Asesora_MC2_Cerrar);
			Pausa_BT.addEventListener(MouseEvent.MOUSE_DOWN, Pausar);
			Empleado_BT.addEventListener(MouseEvent.MOUSE_DOWN, fnEmpleado);
			Irse.addEventListener(MouseEvent.MOUSE_DOWN, MeVoy);
			
			Loser.MeVoy.addEventListener(MouseEvent.MOUSE_DOWN, MeVoy);
			Loser.DeNuevo.addEventListener(MouseEvent.MOUSE_DOWN, DeNuevo);
			Gracias.addEventListener(MouseEvent.MOUSE_DOWN, fnGracias);
			
			Empleado_Pantalla.Aceptar.addEventListener(MouseEvent.MOUSE_DOWN, fnEmpleadoSi);
			Empleado_Pantalla.Cancelar.addEventListener(MouseEvent.MOUSE_DOWN, fnEmpleadoNo);
			
			
			
			//Botones Cerrar pantallas;
			Lista_Trabajos.addEventListener(MouseEvent.MOUSE_DOWN,fnBotonesTrabajos);
			Lista_Trabajos.Cerrar_BT.addEventListener(MouseEvent.MOUSE_DOWN, fnCerrarLista);
			Placa_financiera.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, fnPlaca_Financiera_Cerrar);
			Placa_financiera.btn_pagar.addEventListener(MouseEvent.MOUSE_DOWN, fnPlaca_Financiera_pagar);
			//Barrio.Comunidad_Cerrar.addEventListener(MouseEvent.MOUSE_DOWN, fnComunidad);
			Placa_Clientes.addEventListener(MouseEvent.MOUSE_DOWN, fnPlaca_Clientes_BT);
			Carga_MC.Cerrar_BT.addEventListener(MouseEvent.MOUSE_DOWN, fnCarga_MC);
			Placa_Construir.Yes.addEventListener(MouseEvent.MOUSE_DOWN, fnConstruir);
			Placa_Construir.Cerrar.addEventListener(MouseEvent.MOUSE_DOWN, fnConstruirCerrar);
			
			
			//******** ver si juego termino **********
			
			if (pelicula.termino == true){
				removeChild(cargador);
				cargador.unloadAndStop();
				Time.Empezar(true);
			}
			
			if (Ya_jugo_2 == true){
				Empleado = true;
				Empleado_Pantalla.Candado.visible = false;
				Gracias.visible = true;
				Gracias.Texto.text = "Ahora puedes contratar un asistente, los tiempos de producción se reducirán.";
			}
			
			if (Ya_jugo_3 == true){
				Lista_Trab.fnHacer(true);
				Placa_Construir.visible = true;
				Placa_Construir.Mensaje_TXT.text = "Ahora puedes fabricar muebles";
			}
			
			
			if (en_proceso == false){
				Lista_Trabajos.Arreglar_BT.gotoAndStop(1);
			}
			else{
				Lista_Trabajos.Arreglar_BT.gotoAndStop(2);
			}
		}
		
		
		//*********** Pagar gastos mensuales ***********
		
		public function fnPlaca_Financiera_pagar(event:MouseEvent):void
		{
			if (Placa_financiera.candado.visible == false && pago_cuota_mes2 == false){
			
			if (Gastos >= Dinero_var )
			{
				Texto.text = "no tenes dinero";
			}
			else{
				Dinero_var = Dinero_var - Gastos;
				Placa_financiera.candado.visible = true;
				pago_cuota = true;
				}
			}
		}
		
		function fnConstruirCerrar(event:MouseEvent):void{
			Placa_Construir.visible = false;
		}
		
		public function fnPuntaje():void
		{
			Puntaje.text = "00000";
			Puntajej = Puntajej.substring(0, (5 - int(String(Puntaje_var).length)));
			Puntaje.text = Puntajej + String(Puntaje_var);
			var format2:TextFormat = new TextFormat();
			format2.letterSpacing = 12;
			Puntaje.setTextFormat(format2);
		}
		
		
		



		//LINEA DE TIEMPO: acá se controla por tiempo todo;

		public function timerListener(e:TimerEvent):void
		{
			
			
			
			fnCharacter();
			fnTipoJuego();
			Trabajos_No_Entregados();
			
			
			Dinero_caida.Caida.Texto.text = Dinero_var;
			
			avance_porcentaje = avance_porcentaje - 1;
			Texto.text = String(int((avance_porcentaje/porcentaje)*10));
			Lista_Trabajos.Progreso.gotoAndStop((int((avance_porcentaje/porcentaje)*10)+1));

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
				Pedido_Comunidad_MC.Texto.text = Client.Comunidad[0];
				Pedido_Comunidad_MC.Tablones.text = String(Tablones_Stock);
				Pedido_Comunidad_MC.Alfajias.text = String(Alfajias_Stock);
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
			
			if (Comunidad_var < 300 && Comunidad_Aviso == false){
				Placa_Construir.visible = true;
				Placa_Construir.Mensaje_TXT.text = "Puntos de Comunidad bajos. Atiende mejor a los clientes y realiza trabajos para la comunidad";
				Comunidad_Aviso = true;
				
			}
			
			if (Comunidad_var > 50 ){
				Comunidad_Aviso == false;
			}
			
			/*Segundo Juego
			if (Cliente_Stage == false && Time.Dia_var == Time.Segundo_Juego && Ya_jugo_2 == false)
			{
				peli2 = new URLRequest("recoleccion_final.swf");
				var cargarSWF:Loader = new Loader();
				cargarSWF.load(peli2);
				this.addChild(cargarSWF);
				Ya_jugo_2 = true;
				Construccion= true;
				}*/
			
			//Primer Juego
			if (Cliente_Stage == false && Time.Dia_var == Time.Primer_Juego && Ya_jugo == false)
			{
				//Cliente_MC.Velocidad_var = Velocidad_var;
				//Cargar();
				(root.loaderInfo.loader.root as Object).cargar2();
				
				//Time.Pausar();
				Ya_jugo = true;
				
				
			}
			
			//Segundo Juego
			if (Cliente_Stage == false && Time.Dia_var == Time.Segundo_Juego && Ya_jugo_2 == false)
			{
				//Cliente_MC.Velocidad_var = Velocidad_var;
				peli 
				Cargar();
				Time.Pausar();
				Ya_jugo_2 = true;
				
				
			}
			//tercer juego
			if (Cliente_Stage == false && Time.Dia_var == Time.Tercer_Juego && Ya_jugo_3 == false)
			{
				//Cliente_MC.Velocidad_var = Velocidad_var;
				peli = peli2;
				Cargar();
				Time.Pausar();
				Ya_jugo_3 = true;
				Construccion= true;
			}
			
						
			//Malo;
			if (Cliente_Stage == false && Time.Semana_var == Time.Malo_ && Malo_var == false)
			{
				Placa_Malo_MC.visible = true;
				//Placa_Malo_MC.Texto.text = "Hoy tengo un ofertón para nuevos emprendimientos! Te doy tablones por el espectacular precio de 300 pesos. Que dice Tío?";
				Placa_Malo_MC.Texto.text = Client.Malo[0];
				Placa_Malo_MC.TextoB.text = Client.Malo[1];
				Malo_var = true;
				fnMalo();
			}
			
			function fnMalo()
			{
				if (Malo == false){
				addChildAt(myMalo, 10);
				myMalo.x = 300;
				myMalo.y = 300;
				myMalo.gotoAndStop("Stand");
				Malo = true;
				}
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
			
			// ************** Final ******************
			
			if (Time.Dia_var == Time.Fin_de_Juego){
				Time.Terminar();
				Dinero_var = 0;
				
				Win.visible = true;
				//var perdedor:Lose= new Lose();
				//addChild(perdedor);
				//(root.loaderInfo.loader.root as Object).descargar();
			}
			
			// Fracaso!!
			if (Dinero_var <= 0 || Comunidad_var <= 0 ){
				Loser.visible = true;
			}
			
			

        //************** Actualizacion permanente de datos existente **************
		
			
			Madera_MC.Alf.text = String(Alfajias_Stock)
			Madera_MC.Tab.text = String(Tablones_Stock);
			Lista_Trabajos.Datos_Tablones.text = String(Tablones_Stock);
			Lista_Trabajos.Datos_Alfajias.text = String(Alfajias_Stock);
			
			//var tempArray:Array = Puntaje_var.toString().split(".");
			//var numDec:Number = Number(tempArray[1]);
			//var num = Puntaje_var;
			
			//num = Number( String( num ).split( "." )[ 1 ] );
			
			//Puntaje.text = String(num.toFixed(5));
			
			/*var format2:TextFormat = new TextFormat();
			
			format2.letterSpacing = 10;
			format2..align='left';
			
			Puntaje.text = String((Puntaje_var/100000).toFixed(5));
			Puntaje.setTextFormat(format2);*/
			fnPuntaje();
			
			
			Hora_var = Time.Hora_var;
			Horas.text = String(int(Time.Horas)) + "  horas";
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

			if (Lista_Trab.Nuevo_Cliente == 1 && Cliente_Stage == false && Time.Dale == true && Placa_Clientes.visible == false && Placa_Malo_MC.visible == false)
			{
				// Recibe el nombre del cliente;
				Hola_Cliente();
			}


			Lista_Trabajos.Trabajo1.text = "Cliente: " + String(Trabajos[6]) + "  Restan " + String(int((Trabajos[7]/Div_horas)/8)) + " Días  " + String((int(Trabajos[7]/Div_horas)) - ((int((Trabajos[7]/Div_horas)/8))*8)+1) + " Hs.";
			Lista_Trabajos.Trabajo2.text = "Cliente: " + String(Trabajos[6 + (1*multiplicador)]) + "  Restan " + String(int((Trabajos[7 + (1*multiplicador)]/Div_horas)/8)) + " Días  " + String((int(Trabajos[7 + (1*multiplicador)]/Div_horas)) - ((int((Trabajos[7 + (1*multiplicador)]/Div_horas)/8))*8)) + " Hs.";
			Lista_Trabajos.Trabajo3.text = "Cliente: " + String(Trabajos[6 + (2*multiplicador)]) + "  Restan " + String(int((Trabajos[7 + (2*multiplicador)]/Div_horas)/8)) + " Días  " + String((int(Trabajos[7 + (2*multiplicador)]/Div_horas)) - ((int((Trabajos[7 + (2*multiplicador)]/Div_horas)/8))*8)) + " Hs."; 
			Lista_Trabajos.Trabajo4.text = "Cliente: " + String(Trabajos[6 + (3*multiplicador)]) + "  Restan " + String(int((Trabajos[7 + (3*multiplicador)]/Div_horas)/8)) + " Días  " + String((int(Trabajos[7 + (3*multiplicador)]/Div_horas)) - ((int((Trabajos[7 + (3*multiplicador)]/Div_horas)/8))*8)) + " Hs.";
			Lista_Trabajos.Trabajo5.text = "Cliente: " + String(Trabajos[6 + (4*multiplicador)]) + "  Restan " + String(int((Trabajos[7 + (4*multiplicador)]/Div_horas)/8)) + " Días  " + String((int(Trabajos[7 + (4*multiplicador)]/Div_horas)) - ((int((Trabajos[7 + (4*multiplicador)]/Div_horas)/8))*8)) + " Hs.";
			Lista_Trabajos.Trabajo6.text = "Cliente: " + String(Trabajos[6 + (5*multiplicador)]) + "  Restan " + String(int((Trabajos[7 + (5*multiplicador)]/Div_horas)/8)) + " Días  " + String((int(Trabajos[7 + (5*multiplicador)]/Div_horas)) - ((int((Trabajos[7 + (5*multiplicador)]/Div_horas)/8))*8)) + " Hs."; 
			Lista_Trabajos.Trabajo7.text = "Cliente: " + String(Trabajos[6 + (6*multiplicador)]) + "  Restan " + String(int((Trabajos[7 + (6*multiplicador)]/Div_horas)/8)) + " Días  " + String((int(Trabajos[7 + (6*multiplicador)]/Div_horas)) - ((int((Trabajos[7 + (6*multiplicador)]/Div_horas)/8))*8)) + " Hs."; 
			Lista_Trabajos.Trabajo8.text = "Cliente: " + String(Trabajos[6 + (7*multiplicador)]) + "  Restan " + String(int((Trabajos[7 + (7*multiplicador)]/Div_horas)/8)) + " Días  " + String((int(Trabajos[7 + (7*multiplicador)]/Div_horas)) - ((int((Trabajos[7 + (7*multiplicador)]/Div_horas)/8))*8)) + " Hs.";
			Lista_Trabajos.Trabajo9.text = "Cliente: " + String(Trabajos[6 + (8*multiplicador)]) + "  Restan " + String(int((Trabajos[7 + (8*multiplicador)]/Div_horas)/8)) + " Días  " + String((int(Trabajos[7 + (8*multiplicador)]/Div_horas)) - ((int((Trabajos[7 + (8*multiplicador)]/Div_horas)/8))*8)) + " Hs.";
			Lista_Trabajos.Trabajo10.text = "Cliente: " + String(Trabajos[6 + (9*multiplicador)]) + "  Restan " + String(int((Trabajos[7 + (9*multiplicador)]/Div_horas)/8)) + " Días  " + String((int(Trabajos[7 + (9*multiplicador)]/Div_horas)) - ((int((Trabajos[7 + (9*multiplicador)]/Div_horas)/8))*8)) + " Hs."; 

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
				en_proceso = false;
				Lista_Trabajos.Arreglar_BT.gotoAndStop(1);
				fnBuscar_Trabajo2();
				
			}
		}
		
		function fnEmpleado(event:MouseEvent):void{
			Empleado_Pantalla.visible = true;
		}
		
		function fnEmpleadoSi(event:MouseEvent):void{
			if (Empleado == true){
			Empleado_Pantalla.visible = false;
			Sueldos = 3000;
			Empleado_si = .5;
			}
		}
		
		function fnEmpleadoNo(event:MouseEvent):void{
			Empleado_Pantalla.visible = false;
		}


		public function fnConstruir(event:MouseEvent):void
		{
			Placa_Construir.visible = false;
		}
		
		public function BajarComunidad():void
			{
				Comunidad_var = Comunidad_var-20;
			}
		
		function Trabajos_No_Entregados():void{
			
			if (Trabajos[0] > 1){
			for(var i:int=0; i<9; i++) {
				//Venir_Buscar.text = String(Trabajos[(i*multiplicador)+7]);
				
				//numero = Trabajos[(i*multiplicador)+7];
				//numero = numero - 1;
				//Trabajos[(i*multiplicador)+7] = numero;
				if (Trabajos[(i*multiplicador)+7] > 1){
				Trabajos[(i*multiplicador)+7] = (Trabajos[(i*multiplicador)+7] - 1);
				}
				else {
					No_cumpliste();
				}
				Venir_Buscar.text = String(Trabajos[(i*multiplicador)+7] - 1);
				
				//Trabajos[(i*multiplicador)+7] = numero ;
				}
			}
			
		}
		
		function No_cumpliste():void{
			if (Trabajos[0] > 1){// verifica haya trabajos en la lista
			for(var i:int=0; i<9; i++) {
				if (Trabajos[(i*multiplicador)+7] < 3)
				{
				Gracias.visible = true;
				var indice = ((randomRange(0, 5)));
				var snd:Sound = new Sound(new URLRequest("mp_sfx_clienteenojadoOP2.mp3")); 
					snd.play();
				
				Comunidad_var -= 30;
				//Lista_Trabajos.En_Proceso.text = "";
				//if (Cliente_Stage == false){
				//Placa_no_cumpliste();
				//Placa_Clientes.visible = true;
				//Placa_Clientes.gotoAndStop(6);
				Cliente_borrar = (i*multiplicador);
				Gracias.Punk_MC.visible = false;
				Gracias.Vieja_MC.visible = false;
				Gracias.Viejo_MC.visible = false;
				Gracias.Nena_MC.visible = false;
				Gracias.Mormon_MC.visible = false;
				Gracias.Coqueta_MC.visible = false;
				Limpiar();

				switch(Trabajos[(i*multiplicador)+6]){
						case "Julio":
							Gracias.Punk_MC.visible = true;
							Gracias.Texto.text = Client.TextosBronca[0];
							Borrar_Cliente();
							break;
						case "Olga":
							Gracias.Vieja_MC.visible = true;
							Gracias.Texto.text = Client.TextosBronca[1];
							Borrar_Cliente();
							break;
						case "Andrea":
							Gracias.Coqueta_MC.visible = true;
							Gracias.Texto.text = Client.TextosBronca[2];
							Borrar_Cliente();
							break;
						case "Gustavo":
							Gracias.Viejo_MC.visible = true;
							Gracias.Texto.text = Client.TextosBronca[3];
							Borrar_Cliente();
							break;
						case "Lucía":
							Gracias.Nena_MC.visible = true;
							Gracias.Texto.text = Client.TextosBronca[4];
							Borrar_Cliente();
							break;
						case "Martín":
							Gracias.Mormon_MC.visible = true;
							Gracias.Texto.text = Client.TextosBronca[5];
							Borrar_Cliente();
							break;
								}
				//Trabajos.splice([i*multiplicador], 6);
							}
							//}
						}
					}
				}
		
		function Borrar_Cliente():void
		{
			Trabajos.splice([Cliente_borrar], multiplicador);
		}
		
		function Limpiar():void{
					Lista_Trabajos.Datos_Materiales.text ="";
					Lista_Trabajos.Datos_Alfajias.text = "";
					Lista_Trabajos.Datos_Tablones.text = "";
					Lista_Trabajos.Datos_Tiempo.text = "";
					Lista_Trabajos.Datos_Precio.text = "";
					Lista_Trabajos.Datos_Cliente.text = "";
					Lista_Trabajos.Datos_Trabajo.text = "";
					
					//Buscar = Nombre[1];
					Lista_Trabajos.Taburete_Roto.visible = false;
					Lista_Trabajos.Silla_Roto.visible = false;
					Lista_Trabajos.Campera.visible = false;
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
					Lista_Trabajos.Viejo_MC.visible = false;
					if (en_proceso == false){
					Lista_Trabajos.En_Proceso.text = ""; //para no borrar el nombre del trabajo en proceso
					}
		}
		
		
		function Placa_no_cumpliste():void{
			Placa_Clientes.visible = true;
			Placa_Clientes.gotoAndStop(6);
			
			switch(Trabajos[6]){
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
		}
		
		
		function Trabajos_No_Entregados2():void{
			
			for(var ii:int=0; i<1; i++) {
				numero = numero - 1;
				Trabajos[(ii*multiplicador)+7] = numero;
				
			}
		}


		//*******************************Funcion Random general****************************

		private function randomRange(minNum:Number, maxNum:Number):Number
		{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}


		//**************************Botones en general***************************************
		
		public function Continuar():void{
			Time.Empezar(true);
		}
		
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
						Pedido_Comunidad_MC.visible = true;
						Pedido_Comunidad_MC.Tablones.text = String(Tablones_Stock);
						Pedido_Comunidad_MC.Alfajias.text = String(Alfajias_Stock);
						Pedido_Comunidad_MC.Texto.text = Client.Comunidad[0];
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
		addChild(cargador);
		 
		 
         //agregamos el listener que llamara a la funcion de peli a load_btn;
         //load_btn.addEventListener(MouseEvent.CLICK, llamarfuncionpeli);
         //load_btn.text_btn.text = "mover";
      }
	  
	  public function CerrarJuego1(){
		  removeChild(cargador);
	  }

		function fnPlaca_Financiera_Cerrar(event:MouseEvent):void
		{
			Placa_financiera.visible = false;
			Consejo_Asesora = false;
		}
		

		/*function fnComunidad(event:MouseEvent):void
		{
			Barrio.visible = false;
		}*/

		function fnBarrio_Comunidad(event:MouseEvent):void
		{
			//Barrio.visible = true;
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
				Comunidad_Yes();
					
					
					break;
				case "Cancelar_Comunidad" :
					Pedido_Comunidad_MC.visible = false;
					Comunidad_var = Comunidad_var - 30;
					
					break;
			}
		}
		
		function Comunidad_Yes(): void
		{
			if (Tablones_Stock >= 2 && Alfajias_Stock >= 5){
				Pedido_Comunidad_MC.visible = false;
				Tablones_Stock = Tablones_Stock - 2;
				Alfajias_Stock = Alfajias_Stock - 5;
				Comunidad_var = Comunidad_var + 100;
				}
				else{
					fnEn_Madera_pedido_Placa();
					Pedido_Comunidad_MC.visible = false;
				}
		}
		
		

		public function fnMalo(event:MouseEvent):void
		{
			switch (event.target.name)
			{
				case "Cancelar1" :
					Placa_Malo_MC.gotoAndStop(2);
					Placa_Malo_MC.Texto2.text = Client.Malo[2];
					break;
				case "Cancelar2" :
					Placa_Malo_MC.visible = false;
					Comunidad_var = Comunidad_var + 100;
					myMalo.gotoAndStop("Salida");
					break;
				case "Aceptar1" :
					Placa_Malo_MC.visible = false;
					Comunidad_var = Comunidad_var - 200;
					Dinero_var = Dinero_var - 500;
					Alfajias_Stock = Alfajias_Stock + 2;
					Tablones_Stock = Tablones_Stock + 2;
					myMalo.gotoAndStop("Salida");
					break;
				case "Aceptar_Final" :
					Placa_Malo_MC.visible = false;
					Comunidad_var = Comunidad_var - 200;
					Dinero_var = Dinero_var - 300;
					Alfajias_Stock = Alfajias_Stock + 2;
					Tablones_Stock = Tablones_Stock + 2;
					myMalo.gotoAndStop("Salida");
					break;
			}
		}

		function Placa_ir_Barraca_Cerrar(event:MouseEvent):void
		{
			Placa_ir_Barraca.visible = false;
		}
		//Fin de botones

		// vuelve o no visible los diferentes pedidos en la lista de pedidos
		
		
		
		/*function Visible():void
		{
			for (var i:uint=1; i<6; i++){
		
			if (Trabajos[i*multiplicador] > 2)
			{
				Lista_Trabajos.Trabajo[i].visible = true;
				Lista_Trabajos.Linea(i).visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo[i].visible = false;
				Lista_Trabajos.Linea(i).visible = false;
			}
		}
		}*/
		
		
			

		function Visible():void
		{
			if (Trabajos[0*multiplicador] > 1)
			{
				Lista_Trabajos.Trabajo1.visible = true;
				Lista_Trabajos.Linea1.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo1.visible = false;
				Lista_Trabajos.Linea1.visible = false;
			}

			if (Trabajos[1*multiplicador] > 0)
			{
				Lista_Trabajos.Trabajo2.visible = true;
				Lista_Trabajos.Linea2.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo2.visible = false;
				Lista_Trabajos.Linea2.visible = false;
			}

			if (Trabajos[2*multiplicador] > 0)
			{
				Lista_Trabajos.Trabajo3.visible = true;
				Lista_Trabajos.Linea3.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo3.visible = false;
				Lista_Trabajos.Linea3.visible = false;
			}
			if (Trabajos[3*multiplicador] > 0)
			{
				Lista_Trabajos.Trabajo4.visible = true;
				Lista_Trabajos.Linea4.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo4.visible = false;
				Lista_Trabajos.Linea4.visible = false;
			}
			if (Trabajos[4*multiplicador] > 0)
			{
				Lista_Trabajos.Trabajo5.visible = true;
				Lista_Trabajos.Linea5.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo5.visible = false;
				Lista_Trabajos.Linea5.visible = false;
			}
			
			if (Trabajos[5*multiplicador] > 0)
			{
				Lista_Trabajos.Trabajo6.visible = true;
				Lista_Trabajos.Linea6.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo6.visible = false;
				Lista_Trabajos.Linea6.visible = false;
			}
			if (Trabajos[6*multiplicador] > 0)
			{
				Lista_Trabajos.Trabajo7.visible = true;
				Lista_Trabajos.Linea7.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo7.visible = false;
				Lista_Trabajos.Linea7.visible = false;
			}
			if (Trabajos[7*multiplicador] > 0)
			{
				Lista_Trabajos.Trabajo8.visible = true;
				Lista_Trabajos.Linea8.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo8.visible = false;
				Lista_Trabajos.Linea8.visible = false;
			}
			if (Trabajos[8*multiplicador] > 0)
			{
				Lista_Trabajos.Trabajo9.visible = true;
				Lista_Trabajos.Linea9.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo9.visible = false;
				Lista_Trabajos.Linea9.visible = false;
			}
			if (Trabajos[9*multiplicador] > 0)
			{
				Lista_Trabajos.Trabajo10.visible = true;
				Lista_Trabajos.Linea10.visible = true;
			}
			else
			{
				Lista_Trabajos.Trabajo10.visible = false;
				Lista_Trabajos.Linea10.visible = false;
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
					var client = Cliente_Arreglando;
					Dinero_var = Dinero_var + (Trabajos_Terminados_Entrega[1]);
					Trabajos.splice([Trabajos_Terminados_Entrega[3]], multiplicador);
					Trabajos_Terminados_Entrega.splice([0], 4);
					Visible();
					//Borrar todos los datos de la lista de trabajos a la derecha
					Lista_Trabajos.Datos_Materiales.text ="";
					Lista_Trabajos.Datos_Alfajias.text = "";

					Lista_Trabajos.Datos_Tablones.text = "";
					Lista_Trabajos.Datos_Tiempo.text = "";
					Lista_Trabajos.Datos_Precio.text = "";
					Lista_Trabajos.Datos_Cliente.text = "";
					Lista_Trabajos.Datos_Trabajo.text = "";
					
					Buscar = Nombre[1];
					Lista_Trabajos.Taburete_Roto.visible = false;
					Lista_Trabajos.Silla_Roto.visible = false;
					Lista_Trabajos.Campera.visible = false;
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
					Lista_Trabajos.En_Proceso.text = "";
					// Placa Clente buscar
					Lista_Trabajos.Progreso.gotoAndStop(10);
					var snd:Sound = new Sound(new URLRequest("mp_sfx_ingresos.mp3")); 
					snd.play();
					
					Dinero_caida.gotoAndPlay(2);
					
					Comunidad_var += 30;
					
					Puntaje_var = Puntaje_var + 40;
					
					
					switch(client){
					case "Julio":
						//Gracias.Punk_MC.visible = true;
						Graci.Punk_MC2.gotoAndPlay(1);
						break;
					case "Olga":
						//Gracias.Vieja_MC.visible = true;
						Graci.Vieja_MC2.gotoAndPlay(1);
						break;
					case "Andrea":
						//Gracias.Coqueta_MC.visible = true;
						Graci.Coqueta_MC2.gotoAndPlay(1);
						break;
					case "Gustavo":
						//Gracias.Viejo_MC.visible = true;
						Graci.Viejo_MC2.gotoAndPlay(1);
						break;
					case "Lucía":
						//Gracias.Nena_MC.visible = true;
						Graci.Nena_MC2.gotoAndPlay(1);
						break;
					case "Martín":
						//Gracias.Mormon_MC.visible = true;
						Graci.Mormon_MC2.gotoAndPlay(1);
						break;
					}
					
					//Buscar_flag= false;
				}

		function fnGracias(event:MouseEvent):void
		{
			Gracias.visible = false;
		}
		
		public function fnBotonesTrabajos(event:MouseEvent):void
		{
			for(var i:int=0; i<10; i++) {
			switch (event.target.name)
			{
				case "Trabajo" + String(i + 1) :
					mult = i*multiplicador;
					tiempo = Trabajos[1 + mult];
					Trabajo_Proceso = Trabajos[0 + mult];
					Entrega = Trabajos[4 + mult];
					Nombre_Elegido = Trabajos[6 + mult];
					fnLista_Trabajos();
					break;
				case "Arreglar_BT" :
					fnIniciar_Trabajo();
			}
			}
		}

		
		function fnLista_Trabajos():void
		{
			Lista_Trabajos.Datos_Tiempo.text = String(Trabajos[1 + mult]);
			Lista_Trabajos.Datos_Precio.text = String(Trabajos[0 + mult]);
			Lista_Trabajos.Datos_Trabajo.text = String(Trabajos[5 + mult]);
			Lista_Trabajos.Datos_Cliente.text = String(Trabajos[6 + mult]);
			if (Carpinteria_Juego == true){
			Lista_Trabajos.Datos_Materiales.text = "Tablones " + String(Trabajos[2 + mult]) + "  Alfajías " + String(Trabajos[3 + mult]);
			}
			if (Carpinteria_Juego == false){
			Lista_Trabajos.Datos_Materiales.text = "Tela " + String(Trabajos[2 + mult]) + "  Hilo " + String(Trabajos[3 + mult]);
			}
			Lista_Trabajos.Mormon_MC.visible = false;
			Lista_Trabajos.Vieja_MC.visible = false;
			Lista_Trabajos.Nena_MC.visible = false;
			Lista_Trabajos.Coqueta_MC.visible = false;
			Lista_Trabajos.Punk_MC.visible = false;
			Lista_Trabajos.Viejo_MC.visible = false;
			Lista_Trabajos.Taburete_Roto.visible = false;
			Lista_Trabajos.Silla_Roto.visible = false;
			Lista_Trabajos.Campera.visible = false;
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
			if (Carpinteria_Juego == true){
			switch (Trabajos[5 + mult])
			{
				case "Silla" :
					Lista_Trabajos.Silla_Roto.visible = true;
					break;
				case "Mesa" :
					Lista_Trabajos.Mesa_Roto.visible = true;
					break;
				case "Taburete" :
					Lista_Trabajos.Taburete_Roto.visible = true;
					break;
				case "Mesita" :
					Lista_Trabajos.Luz_Roto.visible = true;
					break;
				case "Banco" :
					Lista_Trabajos.Banquito_Roto.visible = true;
					break;
				}
			
			}
			if (Carpinteria_Juego == false){
				switch (Trabajos[5 + mult])
				{
				case "Campera" :
					Lista_Trabajos.Campera.visible = true;
					break;
				case "Buzo" :
					Lista_Trabajos.Mesa_Roto.visible = true;
					break;
				case "Chaleco" :
					Lista_Trabajos.Taburete_Roto.visible = true;
					break;
				case "Pollera" :
					Lista_Trabajos.Luz_Roto.visible = true;
					break;
				case "Banco" :
					Lista_Trabajos.Banquito_Roto.visible = true;
					break;
				}
			}
		}


		//Genera pantalla de lista de trabajos y carga 
		// Inicia el laburo y verifica están compradas las herramientas y hay stock de materiales.

		public function fnIniciar_Trabajo():void
		{
			Venir_Buscar.text = String(Trabajos[2]);
			if (Cala_little_var == 1 && Combi_var == 1) {
				if (Tablones_Stock >= Trabajos[3 + mult] && Alfajias_Stock >= Trabajos[2 + mult] && en_proceso == false)
				{
					if (Trabajos[7 + mult] > ((Trabajos[1 + mult])*10))
					if (en_proceso == false)
					{
						avance = ((Trabajos[1 + mult])*10) + _timer.currentCount;
						avance_porcentaje = ((Trabajos[1 + mult])*10);
						porcentaje = avance_porcentaje;
						Trabajo_Que_se_Procesa.push(Trabajos[4 + mult]); //Tiempo
						Trabajo_Que_se_Procesa.push(Trabajos[0 + mult]); //Dinero
						Trabajo_Que_se_Procesa.push(Trabajos[6 + mult]); //Nombre
						Trabajo_Que_se_Procesa.push(mult); //Posición
						Lista_Trabajos.Arreglar_BT.gotoAndStop(2);
						Lista_Trabajos.En_Proceso.text = "Cliente en proceso:  " + Trabajo_Que_se_Procesa[2];
						Alfajias_Stock = Alfajias_Stock - Trabajos[2 + mult];
						Tablones_Stock = Tablones_Stock - Trabajos[3 + mult];
						en_proceso = true;
						Lista_Trabajos.Raya.visible =true;
						Lista_Trabajos.Progreso.Barra.visible = false;
						Cliente_Arreglando = Trabajo_Que_se_Procesa[2];
						//var myPunkx:Tween = new Tween(Lista_Trabajos.Raya,"x",None.easeInOut,-831,-672,porcentaje,true);
					}
						else
						{
							trace("esperá");
							//Trabajo_Proceso.splice(0,0);
							tiempo = 0;
						}
						else{
							Gracias.visible = true;
							Gracias.Texto.text = "No puedes empezar el trabajo porque van a venir a buscarlo antes de que lo puedas terminar. Cuida más los tiempos de entrega"
						}
					}
				else 
				{
					if (Trabajos[0] > 1){
						if (en_proceso == false){
					fnEn_Madera_pedido_Placa();
					}
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
			Nuevo_Cliente = Client.Cliente[(randomRange(0, 5))];
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
					//Placa_Clientes.Punk_MC.visible = true;
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
		
		//****************************[]convierte un string en el nombre de una variable************************************
		//******************************Texto Pedido***********************************************************************

		
		function fnTexto_Pedido():void
		{
			Placa_Clientes.Precio_TXT.text = Lista_Trab.Trabajo[0];
			
			if (Carpinteria_Juego == true){
			Placa_Clientes.Alfajias_TXT.text = "Alfajías " + Lista_Trab.Trabajo[2];
			Placa_Clientes.Tablones_TXT.text = "Tablones " + Lista_Trab.Trabajo[3];
			texto = "Textos" + String(Lista_Trab.Trabajo[5]);
			}
			
			if (Carpinteria_Juego == false){
			Placa_Clientes.Alfajias_TXT.text = "Hilos " + Lista_Trab.Trabajo[2];
			Placa_Clientes.Tablones_TXT.text = "Tela " + Lista_Trab.Trabajo[3];
			if (Nuevo_Cliente == "Martín" || Nuevo_Cliente == "Julio" || Nuevo_Cliente == "Gustavo"){
				var indicex = ((randomRange(0, 2)));
				 Prenda = Client.Prendas[indicex];
			}
			else{
				 indicex = ((randomRange(3, 5)));
				 Prenda = Client.Prendas[indicex];
			}
			var texto = "Textos" + String(Prenda);
			}
			
			
			Placa_Clientes.Tiempo_para_Hacer_TXT.text = Lista_Trab.Trabajo[1];
			
			var indice = ((randomRange(0, 1)));
			if (Construccion == false){
			Placa_Clientes.Cliente_TXT.text = Client[texto][indice];//[]convierte un string en el nombre de una variable
			}
			else{
				Placa_Clientes.Cliente_TXT.text = Client[texto][2];//[]convierte un string en el nombre de una variable
			}
		}
		
		//********************************Nuevo Cliente**********************************************
	
		function Mover_cliente():void
			{
			Cliente_MC.Velocidad_var = Velocidad_var;
			addChildAt(Cliente_MC,12);
			Cliente_MC._timer.reset();
			Cliente_MC.gotoAndPlay("frente");
			Cliente_MC.cliente_stage = true;
			Cliente_MC.adelante = true;
			if (Carpinteria_Juego == true){
				Cliente_MC.x=200;
				Cliente_MC.y=500;
			}
			if (Carpinteria_Juego == false){
				Cliente_MC.x=950;
				Cliente_MC.y=500;
			
			}
			Cliente_Stage = true;
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
		}


		public function fnPlaca_Clientes_BT(event:MouseEvent):void
		{
			switch (event.target.name)
			{
				case "Yes_BT" :
					if (Lista_Trabajos.Trabajo10.visible == false){
					fnClientes_Pedido();
					}
					else
					{
						Gracias.visible = true;
						Gracias.Texto.text = "Tienes demasiados trabajos pendientes, realiza algunos antes de seguir aceptando más.";
					}
					Cliente_MC.irse();
					//Puntaje_var = Puntaje_var + 40;
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
				case "Chau3" :
				Comunidad_var = Comunidad_var - 30;
					Cerrar_Placa_Clientes();
					Borrar_Cliente();
					break;
			}
		}
		
		//****************************Nuevo Trabajo*************************************


		function fnClientes_Pedido():void
		{
			
			/*if (Nuevo_Cliente == "Martín" || Nuevo_Cliente == "Julio" || Nuevo_Cliente == "Gustavo"){
				var indice = ((randomRange(0, 2)));
			}
			if (Nuevo_Cliente == "Olga" || Nuevo_Cliente == "Andrea" || Nuevo_Cliente == "Lucía"){
				 indice = ((randomRange(3, 5)));
			}*/
			if (Carpinteria_Juego == true){
			Trabajos.push(Lista_Trab.Trabajo[0]);
			Trabajos.push(Lista_Trab.Trabajo[1] * Empleado_si);
			Trabajos.push(Lista_Trab.Trabajo[2]);
			Trabajos.push(Lista_Trab.Trabajo[3]);
			Trabajos.push(Lista_Trab.Trabajo[4]);
			Trabajos.push(Lista_Trab.Trabajo[5]);
			Trabajos.push(Nuevo_Cliente);
			Trabajos.push(numero);
			}
			
			if (Carpinteria_Juego == false){
			Trabajos.push(Lista_Trab.Trabajo[0]);
			Trabajos.push(Lista_Trab.Trabajo[1] * Empleado_si);
			Trabajos.push(Lista_Trab.Trabajo[2]);
			Trabajos.push(Lista_Trab.Trabajo[3]);
			Trabajos.push(Lista_Trab.Trabajo[4]);
			//Trabajos.push(Lista_Trab.Trabajo[5]);
			Trabajos.push(Prenda);
			Trabajos.push(Nuevo_Cliente);
			Trabajos.push(numero);
			}
			
			Nombre.push(Nuevo_Cliente);
			trace(Trabajos);
			Cerrar_Placa_Clientes();
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
			//Cliente_var.gotoAndPlay("espalda");
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


		 function MeVoy(event:MouseEvent):void
		 {
			(root.loaderInfo.loader.root as Object).descargar();
			Loser.visible = false;
		}
		
		
		 function DeNuevo(event:MouseEvent):void
		 {
			Asesora_start.gotoAndPlay(1);
			Asesora_start.visible = true;
			Loser.visible = false;
			(root.loaderInfo.loader.root as Object).descargar_volver();
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
			Madera_MC.Total_TX.text = "";
			Alfajias_Stock = Alfajias_Stock + Alfajias_var_Numb;
			Tablones_Stock = Tablones_Stock + Tablones_var_Numb;
			Madera_MC.visible = false;
		}
		
		


		//Barraca
		public function En_Barraca():void
		{
			Lista_Trabajos.visible = false;
			
			Barra.visible = true;	
			
				
			
		}

		public function Barra_Otra_Pag():void
		{
			Barra.gotoAndStop(2);
			if (Pintura_var == 1){
				Barra.Lata_Pinturax.gotoAndStop(2);
			}
			if (Combi_var == 1){
				Barra.Mesa_Combinadax.gotoAndStop(2);
			}
			if (Tala_pie_var == 1){
				Barra.Taladro_Piex.gotoAndStop(2);
			}
			
		}
		public function Barra_Otra_Pag_Atras():void
		{
			Barra.gotoAndStop(1);
			if (Cala_little_var == 1){
				Barra.Caladora_Manox.gotoAndStop(2);
			}
			if (Sierra_pie_var == 1){
				Barra.Sierra_Piex.gotoAndStop(2);
			}
			if (Cafe_var == 1){
				Barra.Cafetera_Chicax.gotoAndStop(2);
			}
		}
		
		public function Barra_Cerrar():void
		{
			Barra.visible = false;
		}
		
		public function Comprar_Caladora():void
		{
			cala_little.visible = true;
			Barra.Caladora_Manox.gotoAndStop(2);
			if (Cala_little_var == 0){
			Dinero_var = Dinero_var - Caladora_precio;
			}
			
			Cala_little_var = 1;
		}

		public function Comprar_Sierra_Pie():void
		{
			Caladora_de_Pie.visible = true;
			Barra.Sierra_Piex.gotoAndStop(2);
			if (Sierra_pie_var == 0){
			Dinero_var = Dinero_var - Caladora_Pie_precio;
			}
			
			Sierra_pie_var = 1;
		}

		public function Comprar_Pintura():void
		{
			Lata_Pintura_MC.visible = true;
			Barra.Lata_Pinturax.gotoAndStop(2);
			if (Pintura_var == 0){
			Dinero_var = Dinero_var - Pinturas_precio;
			}
			
			Pintura_var = 1;
		}

		public function Comprar_Cafetera_Chica():void
		{
			Cafetera_Chica.visible = true;
			Barra.Cafetera_Chicax.gotoAndStop(2);
			
			if (Cafe_var == 0){
			Dinero_var = Dinero_var - Cafetera_precio;
			}
			
			Cafe_var = 1;
		}

		public function Comprar_Mesa_Combinada():void
		{
			Combinada_MC.visible = true;
			Barra.Mesa_Combinadax.gotoAndStop(2);
			if (Combi_var == 0){
			Dinero_var = Dinero_var - Mesa_Combinada_precio;
			}
			
			Combi_var = 1;
		}

		public function Comprar_Taladro_Pie():void
		{
			cala_big.visible = true;
			Barra.Taladro_Piex.gotoAndStop(2);
			if (Tala_pie_var == 0){
			Dinero_var = Dinero_var - Taladro_Pie_precio;
			}
			
			Tala_pie_var = 1;
		}
	}
}