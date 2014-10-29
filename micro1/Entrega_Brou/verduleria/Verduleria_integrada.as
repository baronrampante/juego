package 
{
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldAutoSize;
   	import flash.text.TextFieldType	
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.sampler.Sample;
	import fl.controls.progressBarClasses.IndeterminateBar;




	public class Verduleria_integrada extends  MovieClip
	{
		private var _ArrayPedidoCliente:Array = new Array();
		
		
		private const CONST_UNIDAD_SUMA_POPULARIDAD = 100; 
		private const CONST_UNIDAD_RESTA_POPULARIDAD = 20; 
		
		private const CONST_SEMANA_PERSONAJE_MALO = 3; //Semana	VA 3
 		private const CONST_SEMANA_DONACION_MERENDERO = 5; //Semana	
		private const CONST_SEMANA_PAGO_GASTOS_INI = 2; //Semana va 4	
		private const CONST_SEMANA_FINAL = 8; //Semana	
		private const CONST_SEMANA_MINIJUEGO_CALCULO = 6; //Semana	
		private const CONST_SEMANA_PERSONAJE_MALO_LATAS = 7; //Semana	
		private const CONST_SEMANA_DEBITO_MERCADERIA = 1; //Semana	
		
		private const CONST_CLIENTES_CONTRATA_AYUDANTE = 9; //cantidad de clientes 10
		private const CONST_CLIENTES_COMPRA_CALCULADORA = 17; //cantidad de clientes 17
		
		
		private const CONST_SEMANAS_TOTAL = 8; //Semana	
  		
		private const I_CONS_COSTO_BALANZA = 0;
		private const I_CONS_COSTO_CAMION = 1;
		private const I_CONS_COSTO_MESA = 2;
		private const I_CONS_COSTO_RADIO = 3;
		private const I_CONS_COSTO_VITRINA = 4;
		private const I_CONS_COSTO_CALCULADORA = 5;

		
		
		private const NARANJAS  = 0;  
		private const MANZANAS  = 1;  
		private const LIMONES   = 2;    
		private const BANANAS   = 3;    	 
		private const PAPAS     = 4;    	 	 
		private const BERENJENAS= 5;    	 	 	 
		private const CEBOLLAS  = 6;    	 	 	 	 
		private const TOMATES   = 7;    	 	 	 	 	 
		private const ZAPALLITOS= 8;    	 	 	 	 	 	 
			
		private const MIEL      = 9;    	 	 	 
		private const ACEITUNAS= 10;    	 	 	 	 
		private const DULCES   = 11;    	 	 	 	 	 
		private const ESPECIAS = 12;    	 	 	 	 	 	 
				
			
 		private const CLI_MORMON = 0;  
		private const CLI_NENA_AVION = 1;
		private const CLI_NENA_COQUETA = 2;
		private const CLI_PUNKY = 3;	 
 		private const CLI_VIEJA = 4;
		private const CLI_VIEJO = 5;
 
			 
		private const COSTO_SUELDO  = 0;  
		private const COSTO_CUOTA  = 1;  
		private const COSTO_ALQUILER = 2;    
		
		
		
		private const CONST_TOPE_CLIENTES = 6;

		private const CONST_TOPE_PEDIDO = 3;

		//private var _timerJuego:Timer = new Timer(CONST_MILISEG_JUEGO,1);
		
		private var _timerCliente_mormon:Timer;  
		private var _timerCliente_nena_avion:Timer;  
		private var _timerCliente_nena_coqueta:Timer;  

		private var _timerCliente_punky:Timer;  
		private var _timerCliente_vieja:Timer; 
		private var _timerCliente_viejito:Timer; 
		
		private var _timerCliente_enfermo:Timer = new Timer(10000); /// 10 segundos para que aparezca el cartel de enfermo 

		private var _en_pausa:Boolean = false;	
		 
		
		private var _timerClientes:Timer = new Timer(10000);
		
		
		private var _ArrayMercaderia:Array = new Array();
 		private var _ArrayPagosMensuales:Array = new Array();
		private var _ArrayPedido:Array = new Array();
		private var _ArrayClientes:Array = new Array();
		private var _ArrayControlClienteOnStage:Array = new Array();
		private var _ArrayControlClienteDispo:Array = [0,1,2,3,4,5];
		private var _ArrayTextoAsesor:Array = new Array();

		
		private var _ArrayPedidosPendientes:Array = new Array();
		private var _ArrayMateriales:Array = new Array();
		
		static var  _sys_Popularidad:Number;
		
		private var _sys_KilosxCajon:Number; 
		private var _sys_TotalMeses:Number;
		private var _sys_TotalSemanas:Number;
		private var _sys_SemanaCorriente:Number;
		private var _sys_MesCorriente:Number;
		private var _sys_DiaCorriente:int;
		private var _sys_SemanaDebitarMercaderia:Number;

 		private var _sys_UnidadCambioPago: Number;
		private var _sys_CantClientesxSemana:Number;
		private var _sys_CantClientesSemanaActual:Number = 0;
		private var _sys_CantClientesAtendidos:Number;
		private var _sys_MaxProductosxCliente:Number;
		private var _sys_TiempoPacienciaCliente:Number;
		
		 
		private var _sys_SegundosAumentoEspera:Number;
		private var _sys_SaldoCapital:Number;
 		private var _sys_SemanaActual:Number;
		private var _sys_PuntosAumentoEspera:Number;
		private var _sys_PuntosAumentoClientesxSemana:Number;
		private var _sys_PuntosBienAtendido:Number;
		private var _sys_PuntosMalAtendido:Number; 
		private var _sys_PuntosComunidad:Number;
		private var _sys_PagosCuotasMensuales:Number; 
		private var _sys_RelacionPopularidadCantClientes:Number;
		private var _sys_PuntajeGeneral:Number;
		private var _sys_PuntosDonacion:Number;
		private var _sys_tmp_PuntajeGeneral:Number=0;

			
		private var _sys_PuntosMiniJuego:Number;
 		private var _sys_PorcentajeRebajaCostosArregloCamion:Number;
		private var _sys_PorcentajeRebajaCostosEmpleado:Number;

		private var _sys_ImportePedido:Number;
		private var _sys_ImportePedidoUsuario:Number;
		private var _sys_ImportePagado:Number;
 		private var _sys_ImporteCompraTemp:Number=0;
		
		
		private var _sys_PromedioKilosxCliente:Number;
		
		private var _sys_CantMaxClientes:Number=1;  //ACAGT 2
		private var _sys_ClientesEnEscena:Number=0;


		private var _sys_CliAnt:int=-1;
		private var _sys_CliAct:int=-1;
		
		private var _sys_CtrlDonar:int=0
		
 		private var _sys_blnAyudanteContratado:Boolean = false;
		private var _sys_blnArregloCamion:Boolean = false;   
		private var _sys_blnEsperaClientes:Boolean = false; 
		private var _sys_blnTieneCalculadora:Boolean = false;	//!*por default va en false 
		private var _sys_blnClienteBienAtendido:Boolean = false;	
		private var _sys_blnTieneVitrina:Boolean = false;
		private var _sys_blnSugerirVitrina:Boolean = true;


		private var _sys_blnDebitarMercaderia:Boolean = false;	 
		private var _sys_vblnPagarFijosIni:Boolean = false;//!por default va en false 
		private var _sys_vblnPagarFijosFin:Boolean = false;//!por default va en false 
		private var _sys_blnHabilitarAyudante:Boolean = false;

		private var _sys_blnHabilitarMalo:Boolean = true;

		private var _sys_blnHabilitarAvisoAtencion:Boolean = true;


		private var _xmalo_cantCajones:Number; 
		private var _xmalo_precio:Number;
		private var _xmalo_producto:String;  
		private var _xmalo_precio1:Number;
		private var _xmalo_precio2:Number;	 

		private var _itxt_asesor:int=0;	 

			
			/**** NOTAS GT ****
		 - Definir relación entre cantidad de productos y cantidad de clientes concurrentes
		 - Definir popularidad vs cantidad de clientes concurrentes
		 */
		
		//// posibles vendedores
		public var vendedor_leticia:MovieClip = new Vendedor_leticia();
		public var vendedor_karina:MovieClip = new Vendedor_karina();
		public var vendedor_matias:MovieClip = new Vendedor_matias();
		public var vendedor_nacho:MovieClip = new Vendedor_nacho();
		
		//// posibles clientes-compradores
		public var clientes_nena_avion:MovieClip = new Clientes_nena_avion();
		public var clientes_mormon:MovieClip = new Clientes_mormon();
		public var clientes_coqueta:MovieClip = new Clientes_coqueta();
		public var clientes_punky:MovieClip = new Clientes_punky();
		public var clientes_vieja:MovieClip = new Clientes_vieja();
		public var clientes_viejo:MovieClip = new Clientes_viejo();
		
		///asistente
		public var asistente:MovieClip = new Asistente();
	
		////GLOBITOS PERSONAJES
/*		public var globito:MovieClip = new Globito();
		public var globito_contento:MovieClip = new Globito_contento();
		public var globito_enojado:MovieClip = new Globito_enojado();
*/		
		
		///elementos interfaZ
		///placas de interfaz
		public var placa_ayudante_contratar:MovieClip = new P_ayudante_contratar();
		public var placa_ayudante_sugerido:MovieClip = new P_ayudante_sugerido();
		public var placa_ayuda:MovieClip = new P_ayuda();
		public var placa_info_financiera:MovieClip = new P_info_financiera();
		public var placa_pausa:MovieClip = new P_pausa();

		///placas de Compra
		public var placa_compra_frutas:MovieClip = new P_compra_de_frutas();
		public var placa_dona_frutas:MovieClip = new P_dona_frutas(); 
		public var placa_vitrina_sugerida:MovieClip = new P_vitrina_sugerida();
		public var placa_compra_varios:MovieClip = new P_compra_de_varios();
		public var mensaje_compra_realizada:MovieClip = new Mensaje_compra_realizada();
		public var mensaje_atender_bien:MovieClip = new Mensaje_atender_bien();
		public var mensaje_perdiste_x_popularidad:MovieClip = new Mensaje_perdiste_x_popularidad();
		
		public var mensaje_llegaron_los_productos:MovieClip = new Mensaje_llegaron_los_productos();
		public var check_clip:MovieClip = new Check_clip();		
		public var check_cruz:MovieClip = new Check_cruz();		

		//malo
		public var malo:MovieClip = new Malo();
		public var placa_compra_malo:MovieClip = new P_compra_malo();
		public var placa_compra_malo_enlatados:MovieClip = new P_compra_malo_enlatados();

		///placas de Dialogo
		public var placa_dialogo_asesora:MovieClip = new P_dialogo_asesora();
		public var placa_dialogo_donar:MovieClip = new P_dialogo_donar();
		public var placa_dialogo_venta:MovieClip = new P_dialogo_venta();
		public var placa_dialogo_mal_estado:MovieClip = new P_dialogo_mal_estado();
		

		///placas AUTONAMAS
		//public var placa_calculadora:MovieClip = new P_calculadora();
		public var placa_calculadora_sugerida:MovieClip = new P_calculadora_sugerida();
		public var placa_gano:MovieClip = new P_gano();
		public var placa_perdio:MovieClip = new P_perdio();
		
		/// placa comprado
		public var placa_comprado:MovieClip = new Placa_comprado();
		
		///loader_placas
		public var Loader_placas:Sprite = new Sprite();
		public var Loader_dialogo:Sprite = new Sprite();
		public var Loader_textos_pedidos: Sprite = new Sprite();
		
		public var td:TextFormat = new TextFormat();
		public var myFont = new Fuente2();
		//public var myFont = "Verdana";
		
		private var intentos:int=0;
		private var intentosValor:int=0;
		private var color_btn_deshabilitado:String = "0x999999";
		private var easing_tmax:String = "Back.easeIn";


		//sustituir por variable global IENBA
		public var PlayerBase:String = "girl_1";
		

		public function Verduleria_integrada()
		{
			init2();
			init();

		}

		private function init2():void
		{
			td.color = 0x6A6732;
			td.size = 17;
			td.font = myFont.fontName;
			td.align = TextFormatAlign.RIGHT;

			IniciarVariables();
			F_colocar_indicadores();			
			F_ColocarVendedor();

		}
		
		//**********************************************************
		// Inicializaciónd de variables y banderas
		// 
		// Cambiar aquí para modificar el comportamiento del juego
		// 
		//**********************************************************
		private function IniciarVariables():void {
			
			_sys_Popularidad = 300; /// 300 x defecto  ---> Es la variable que almacena la popularidad, inicia en 300
			_sys_PuntosDonacion = 30;                 //--> Puntaje que se adiciona por acción de donar
			_sys_PuntosComunidad = 300;               //--> Puntaje que se otorga al aceptar donar a la comunidad 
			_sys_PuntajeGeneral = 0;                  //--> Variable que almacena el puntaje general
 			_sys_KilosxCajon = 10;                    //--> Definición de kilos que entran en un cajón
			_sys_TotalMeses = 2;                      //--> Unidad de medida en tiempo del sistema  (meses)
			_sys_TotalSemanas = 8;					  //--> Unidad de medida en tiempo del sistema (semanas)
			_sys_CantClientesxSemana = 8;			  //--> Cantidad de clientes que comprende una semana (unidad de medida). Se incrementa con la popularidad
 			_sys_CantClientesAtendidos = 0;			  //--> Cuenta de clientes atendidos para disparar acciones x cant clientes
			_sys_SemanaCorriente = 1;				  //--> Control de semana actual en el transcurso del juego
			_sys_MesCorriente = 1;					  //--> Control de mes actual en el transcurso del juego
			_sys_MaxProductosxCliente = 3;			  //--> Cantidad máxima de productos que el cliente pide (automáticamente)
			_sys_TiempoPacienciaCliente = 30; 		  //--> Tiempo por defecto de paciencia espera del cliente en segundos
 			_sys_SaldoCapital = 6000;				  //--> Almacena el Capital monetario
  		
			_sys_PorcentajeRebajaCostosArregloCamion = 20; //--> Porcentaje de rebaja de costos a aplicar cuando se arregla el camión
			_sys_PorcentajeRebajaCostosEmpleado = 20;      //--> Porcentaje de rebaja de costos a aplicar cuando se contrata un empleado
			_sys_PromedioKilosxCliente = 6;				   //--> Cantidad de kilos/unidades promedio de mercadería que puede pedir un cliente
  			_sys_PuntosMiniJuego = 500;					   //--> Cantidad de puntos que otorga el minijuego
			_sys_PuntosAumentoEspera = 200;				   //--> Cada 200 puntos que suma, aumenta la espera del cliente (si modulo de _sys_PuntosAumentoEspera = 0)
			_sys_PuntosAumentoClientesxSemana =  500;	   //--> Cada 500 puntos de popularidad, aumenta los clientes x semana (utiliza módulo de _sys_PuntosAumentoClientesxSemana)
			_sys_SegundosAumentoEspera = 10;			   //--> Al comprar la balanza, esta variable determina la espera que aumenta el cliente
			_sys_PuntosBienAtendido = 100;				   //--> Variable que suma puntaje (popularidad) en caso de bien atendido
			_sys_PuntosMalAtendido = -20;				   //--> Variable que suma puntaje (popularidad) en caso de mal atendido
			_sys_UnidadCambioPago = 200;				   //--> Umbral mayor para determinar con cuánta plata pagó el cliente
			_sys_PagosCuotasMensuales = 0;				   //--> Control para determinar qué cuotas fijas está pagando el usuario
			_sys_RelacionPopularidadCantClientes = 800;    //--> Cada cuántos puntos aumenta la cantidad de clientes concurrentes
			_sys_DiaCorriente = 1;						   //--> Lleva control del día corriente (relación de 3)
			_sys_CantClientesSemanaActual = 0;			   //--> Lleva control de clientes en la semana corriente
			_sys_CantMaxClientes=1;						   //--> Cantidad máxima de clientes concurrentes en el stage (se va incrementando)
			
			
			//************************************
			// Variables de control interno
			//
			//************************************
			 intentos =0;
			 intentosValor =0;
			 _itxt_asesor =0;	 

			_sys_CliAnt=-1;
			_sys_CliAct=-1;
		
			_sys_ClientesEnEscena=0;     //--> Cantidad de clienes on Stage	

			_sys_CtrlDonar=0;
		
		
			_sys_blnHabilitarAyudante = false;	 //---> Bandera para habilitar contratación de ayudante
 			_sys_blnAyudanteContratado = false;	 //---> Determina si el ayudante está contratado o no
			_sys_blnArregloCamion = false;       //---> Determina si se contrató arreglo de camión o no
			
		  	_sys_blnEsperaClientes = false; 	 //---> Define si los clientes esperan o no
		 	_sys_blnTieneCalculadora = false;	 //---> Define si tiene calculadora o no - !*por default va en false 
			
			_sys_blnClienteBienAtendido = false;  //---> Control si el cliente fue bien atendido o no 
		 	_sys_blnDebitarMercaderia = false;	  //---> Bandera que indica cuándo debitar la mercadería
		 	_sys_vblnPagarFijosIni = true; 		  //---> Control para pago de gastos fijos iniciales
		 	_sys_vblnPagarFijosFin = true;  	  //---> Control para pago de gastos fijos finales
		 	

			_sys_blnTieneVitrina = false; 		  //---> Verifica si compró vitrina (va false por default)
			_sys_blnHabilitarMalo = true;		  //---> Bandera para habilitar aparición del "malo"
			_sys_blnSugerirVitrina = true;		  //---> Bandera para habilitar compra de vitrina

			
			//****************
			// Array con el Stock de Mercadería del puesto 
			// Nota: para el caso de elementos como aceitunas, etc. se utiliza el campo cant_kilos a modo de unidad
			// Nota2: Para determinar cantidad de cajones se divide caant_kilos / _sys_kilosxCajon
			//
			//****************
			
			_ArrayMercaderia = new Array();
			_ArrayMercaderia.push({producto: "naranjas"  , cant_kilos: 10, tipo:"P", precio_kilo: 25, costo_kilo: 15, peso_unidad_gramos: 100});
			_ArrayMercaderia.push({producto: "manzanas"  , cant_kilos: 10, tipo:"P", precio_kilo: 70, costo_kilo: 50, peso_unidad_gramos: 100});
			_ArrayMercaderia.push({producto: "limones"   , cant_kilos: 10, tipo:"P", precio_kilo: 32, costo_kilo: 20, peso_unidad_gramos: 100});
			_ArrayMercaderia.push({producto: "bananas"   , cant_kilos:  0, tipo:"P", precio_kilo: 65, costo_kilo: 45, peso_unidad_gramos: 100});
			_ArrayMercaderia.push({producto: "papas"     , cant_kilos: 0, tipo:"P", precio_kilo: 35, costo_kilo: 25, peso_unidad_gramos: 100});
			_ArrayMercaderia.push({producto: "berenjenas", cant_kilos: 0, tipo:"P", precio_kilo: 52, costo_kilo: 40, peso_unidad_gramos: 100});
			_ArrayMercaderia.push({producto: "cebollas"  , cant_kilos: 0, tipo:"P", precio_kilo: 30, costo_kilo: 22.5, peso_unidad_gramos: 100});
			_ArrayMercaderia.push({producto: "tomates"   , cant_kilos: 0, tipo:"P", precio_kilo: 45, costo_kilo: 35, peso_unidad_gramos: 100});
			_ArrayMercaderia.push({producto: "zapallitos", cant_kilos: 0, tipo:"P", precio_kilo: 50, costo_kilo: 37.5, peso_unidad_gramos: 100});

			// utilizamos el mismo array para los productos de vitrina
			// utilizamos el campo cant_kilos como cant_unidades, precio_kilo por precio_unidad y costo_kilo por costo_unidad
			_ArrayMercaderia.push({producto: "miel"		 , cant_kilos: 0, tipo:"V", precio_kilo: 25, costo_kilo: 15, peso_unidad_gramos: 0});
			_ArrayMercaderia.push({producto: "aceitunas" , cant_kilos: 0, tipo:"V", precio_kilo: 30, costo_kilo: 20, peso_unidad_gramos: 0});
			_ArrayMercaderia.push({producto: "dulces"	 , cant_kilos: 0, tipo:"V", precio_kilo: 30, costo_kilo: 20, peso_unidad_gramos: 0});
			_ArrayMercaderia.push({producto: "especias"  , cant_kilos: 0, tipo:"V", precio_kilo: 35, costo_kilo: 25, peso_unidad_gramos: 0});


			//****************
			// Array para el pedido de mercadería a la granja. Cuando se debita, se inicializa el array
			//
			//****************

			_ArrayPedido = new Array();
			_ArrayPedido.push({producto: "naranjas"  , cant_cajones: 0});
			_ArrayPedido.push({producto: "manzanas"  , cant_cajones: 0});
			_ArrayPedido.push({producto: "limones"   , cant_cajones: 0});
			_ArrayPedido.push({producto: "bananas"   , cant_cajones: 0});
			_ArrayPedido.push({producto: "papas"     ,  cant_cajones: 0});
			_ArrayPedido.push({producto: "berenjenas",  cant_cajones: 0});
			_ArrayPedido.push({producto: "cebollas"  ,  cant_cajones: 0});
			_ArrayPedido.push({producto: "tomates"   ,  cant_cajones: 0});
			_ArrayPedido.push({producto: "zapallitos",  cant_cajones: 0});
			
			//utilizamos cant_cajones como cantidad en unidades
			_ArrayPedido.push({producto: "miel"		 ,  cant_cajones: 0});
			_ArrayPedido.push({producto: "aceitunas" ,  cant_cajones: 0});
			_ArrayPedido.push({producto: "dulces"    ,  cant_cajones: 0});
			_ArrayPedido.push({producto: "especias"  ,  cant_cajones: 0});
						
			
			_ArrayClientes = new Array();
			_ArrayClientes.push("mormon");
			_ArrayClientes.push("nena_avion");
			_ArrayClientes.push("nena_coqueta");
			_ArrayClientes.push("punky");
			_ArrayClientes.push("vieja");
			_ArrayClientes.push("viejito");


			//****************
			// Array con elementos varios que el usuario puede comprar, incluye el precio y una bandera para indicar si está comprado o no
			//
			//****************
			
			_ArrayMateriales = new Array();
			_ArrayMateriales.push({material: "balanza_electronica", comprado:"N", costo: 2000 });
			_ArrayMateriales.push({material: "arreglo_camion", comprado:"N", costo: 3000 });
			_ArrayMateriales.push({material: "mesa", comprado:"N", costo: 800 });
			_ArrayMateriales.push({material: "radio", comprado:"N", costo: 500 });
			_ArrayMateriales.push({material: "vitrina", comprado:"N", costo: 1500 });
			_ArrayMateriales.push({material: "calculadora", comprado:"N", costo: 200 });

			_ArrayPagosMensuales = new Array();
			_ArrayPagosMensuales.push({rubro: "sueldo_empleado", valor: 2000 });
			_ArrayPagosMensuales.push({rubro: "cuota_prestamo", valor: 3000 });
			_ArrayPagosMensuales.push({rubro: "costo_puesto", valor: 1000 });
			
			_ArrayTextoAsesor = new Array();
 			_ArrayTextoAsesor.push("Acabas de sacar un préstamo de $6000. Ya puedes comprar los productos e insumos necesarios para poner en marcha tu negocio.");
			_ArrayTextoAsesor.push("Deberás pagar una cuota de $3000 durante los próximos dos meses para cancelarlo.");
			_ArrayTextoAsesor.push("Sigue las instrucciones para conocer cómo funciona tu negocio.");
			
			
			_ArrayTextoAsesor.push("¡Hola! Este es tu nuevo emprendimiento. Deberás comprar mercadería, atender bien a tus clientes y pagar los gastos...");
			_ArrayTextoAsesor.push("El kilo es la unidad de medida de peso que equivale a mil gramos.");
			_ArrayTextoAsesor.push("Las ferias en la Edad Media fueron el espacio público por excelencia, en el cual, además de los productos necesarios para la subsistencia, era posible encontrar las expresiones festivas de juglares y artistas populares.");
			_ArrayTextoAsesor.push("La palabra Dinero es derivada del latín denarium, el cual era una moneda que utilizaron los romanos para realizar sus actividades comerciales.");
			_ArrayTextoAsesor.push("La aparición del dinero constituye uno de los grandes avances de la civilización humana en toda su historia.");
			_ArrayTextoAsesor.push("Desde tiempos remotos la humanidad ideó sistemas para dar valor a las cosas y poder intercambiarlas, primero se utilizó el trueque, después el intercambio y luego surgió el dinero.");
			_ArrayTextoAsesor.push("El pionero en utilizar billetes, fue el emperador mongol, KUBALI KHAN en el Siglo XI, para él, era el certificado de propiedad de una cantidad de monedas de oro.");
			_ArrayTextoAsesor.push("En Europa, en sus inicios, los billetes eran certificados sobre la existencia de un deposito de oro en un Banco.");
			_ArrayTextoAsesor.push("Los primeros billetes oficiales se emitieron en 1694, por el Banco de Inglaterra.");
			_ArrayTextoAsesor.push("¿Sabias que las primeras monedas utilizadas durante miles de años en zonas de África, el Océano Indico y Oceanía eran conchas marinas?");
			_ArrayTextoAsesor.push("¿Sabias que las primeras monedas utilizadas en la América precolombina y en los primeros años de la colonización fue el cacao?");
			_ArrayTextoAsesor.push("¿Sabías que las primeras monedas de algunas culturas de la América prehispánica fueron las plumas exóticas?");
			_ArrayTextoAsesor.push("¿Sabías que las primeras monedas amplias zonas del mundo (fundamentalmente desérticas) fue la sal?");
			_ArrayTextoAsesor.push("Ya en el siglo IX d. C., durante la dinastía Tang, aparecieron los primeros Bancos en los que la gente depositaba sus monedas y a cambio se le extendía un certificado por el importe depositado que servía como medio de pago. Fueron los primeros billetes");
			_ArrayTextoAsesor.push("Un Banco es una entidad que se dedica a trabajar con el dinero: lo reciben y lo prestan al público obteniendo una ganancia por las operaciones realizadas.");
			_ArrayTextoAsesor.push("Hacer un presupuesto de nuestros gastos, considerando los ingresos y nuestras necesidades estamos haciendo finanzas. Y aunque nos parezca extraño siempre se puede ahorrar. Por más pequeño que sea siempre nos dará una cuota de tranquilidad.");
			_ArrayTextoAsesor.push("Evitemos compras que no sean estrictamente necesarias, así podremos ahorrar alguna moneda, con el paso del tiempo se convertirán en billetes.");
			_ArrayTextoAsesor.push("Un crédito es un préstamo de dinero en el que la persona que lo recibe se compromete a devolver en el tiempo establecido y pagando intereses, seguros y/o comisiones.");
		 
		}
		
		
		
		private function IniciarJuego(event:MouseEvent):void
		{
			Loader_dialogo.removeChildAt (0);
			
			
			 
			F_habilito_botones();

			_timerClientes.addEventListener(TimerEvent.TIMER, fnColocarClientes); 
			  
			_timerClientes.start();
			_itxt_asesor = 3; /// para que no vuelva a los mensajes iniciales
			
		}
		
		
		private function F_ColocarVendedor():void {
			
			switch(PlayerBase){
				
				case "boy_1":
					trace("agrego personaje");
					Vendedor.addChild (vendedor_matias);
					break;
				
				case "boy_2":
				
					Vendedor.addChild (vendedor_nacho);
				
					break;
					
				case "girl_1":
				
					Vendedor.addChild (vendedor_leticia);
				
					break;
					
				case "girl_2":
				
					Vendedor.addChild (vendedor_karina);
				
					break;
				
			}
			
		}
		 

		public function init():void
		{
			addChild(Loader_placas);
			//Loader_placas.x = stage.stageWidth / 2;
			//Loader_placas.y = stage.stageHeight / 2;
			Loader_placas.x = 600;
			Loader_placas.y = 400;
			addChild(Loader_dialogo);
			Loader_dialogo.y = 390;
			Loader_dialogo.addChildAt(Loader_textos_pedidos,0);
			vitrina.visible = false;
			calculadora_mesa.visible = false;
			placa_compra_frutas.candado.visible = false;
			placa_compra_frutas.candado_calcular.visible = false;

			
			////bloqueo botones de calculadora y vitrina
			TweenMax.to(placa_compra_varios.compra_varios_scrool.btn_compra_calculadora, 1, {tint:color_btn_deshabilitado});
			placa_compra_varios.compra_varios_scrool.btn_compra_calculadora.mouseEnabled = false;
			TweenMax.to(placa_compra_varios.compra_varios_scrool.btn_compra_vitrina, 1, {tint:color_btn_deshabilitado});
			placa_compra_varios.compra_varios_scrool.btn_compra_vitrina.mouseEnabled = false;
			
			///listeners para interfaz
			placa_inicio.btn_iniciar.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaAsesoraInicio);
			btn_capital.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaCapital);
			btn_compras_frutas.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaComprasFrutas);
			btn_compras_varios.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaComprasVarios);
			btn_asistente.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaAsistente);
			btn_asesora.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaAsesora);
			btn_ayuda.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaAyuda);
			play_pause_clip.addEventListener(MouseEvent.MOUSE_DOWN, F_Parar_Reiniciar);
			///listeners personajes;
			clientes_nena_avion.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);
			clientes_mormon.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);
			clientes_coqueta.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);
			clientes_punky.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);
			clientes_vieja.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);
			clientes_viejo.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);
			
			//deshabilito los clicks en los globitos
			clientes_nena_avion.globito.mouseEnabled = false;
			clientes_nena_avion.mouseChildren = false;
			clientes_mormon.globito.mouseEnabled = false;
			clientes_mormon.mouseChildren = false;
			clientes_coqueta.globito.mouseEnabled = false;
			clientes_coqueta.mouseChildren = false;
			clientes_punky.globito.mouseEnabled = false;
			clientes_punky.mouseChildren = false;
			clientes_vieja.globito.mouseEnabled = false;
			clientes_vieja.mouseChildren = false;
			clientes_viejo.globito.mouseEnabled = false;
			clientes_viejo.mouseChildren = false;

		}
		
		
		
		 
		 
		//*************************
		// Coloca los clientes en el escenario
		//
		//************************
		
		private function fnColocarClientes(evt:TimerEvent):void {
			var iCliente:Number;
			var segundostimer:Number;
			
			 
			
			if(_sys_ClientesEnEscena < _sys_CantMaxClientes) {
				
				iCliente = fnClienteOn();
				 
				_sys_CliAnt = iCliente;
				
				 
				segundostimer = _sys_TiempoPacienciaCliente*1000;
				switch ( _ArrayClientes[iCliente]){
					case "mormon":
 					
						// colocar personaje boy 1
						loader_clientes.addChild(clientes_mormon)
						clientes_mormon.name = "clientes_mormon";
						
						if( clientes_mormon.x >600) {
							clientes_mormon.y = 1100;
							clientes_mormon.gotoAndPlay("espalda");
						}else {
							clientes_mormon.gotoAndPlay("frente");
							clientes_mormon.y = 600;
						}
						
						
						TweenMax.to(clientes_mormon, 4, {x:450, y:680,onComplete:clientes_mormon.gotoAndStop, onCompleteParams:["parado"]});
						clientes_mormon.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);

						
						// verificamos si ya hay un cliente en escena si el segundo cliente espera
						 fnGloboInicial(CLI_MORMON);
						
						if( _sys_blnEsperaClientes == false) {
							_timerCliente_mormon = new Timer(segundostimer);
							 _timerCliente_mormon.addEventListener(TimerEvent.TIMER, fnQuitarClienteMormon); 
	
							 _timerCliente_mormon.start();
						}
						
						break;
						
					case "nena_avion": 
					
						// colocar personaje nena avion
						loader_clientes.addChild(clientes_nena_avion)
						clientes_nena_avion.name = "clientes_nena_avion";
						

						TweenMax.to(clientes_nena_avion, 3.5, {x:340, y:680,onComplete:clientes_nena_avion.gotoAndStop, onCompleteParams:["parado"]});
						clientes_nena_avion.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);
						
						if( clientes_nena_avion.x >600) {
							clientes_nena_avion.gotoAndPlay("espalda");
							clientes_nena_avion.y = 850;

						}else {
							clientes_nena_avion.gotoAndPlay("frente");
							clientes_nena_avion.y = 500;
						}
						
						
						fnGloboInicial(CLI_NENA_AVION);

						
						if( _sys_blnEsperaClientes == false) {

							 _timerCliente_nena_avion = new Timer(segundostimer);
							 _timerCliente_nena_avion.addEventListener(TimerEvent.TIMER, fnQuitarClienteNenaAvion); 
							 _timerCliente_nena_avion.start();
						}
						
						break;
						
					case "nena_coqueta": 
					
						// colocar personaje nena coqueta
						loader_clientes.addChild(clientes_coqueta)
						clientes_coqueta.name = "clientes_coqueta";
						
						if( clientes_coqueta.x >600) {
							clientes_coqueta.y = 960; 
							clientes_coqueta.gotoAndPlay("espalda");
						}else {
							clientes_coqueta.gotoAndPlay("frente");
							clientes_coqueta.y = 460; 

						}
						 		
						TweenMax.to(clientes_coqueta, 4, {x:520, y:580,onComplete:clientes_coqueta.gotoAndStop, onCompleteParams:["parado"]});
						clientes_coqueta.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);
						
						
						fnGloboInicial(CLI_NENA_COQUETA);


						if( _sys_blnEsperaClientes == false) {

							_timerCliente_nena_coqueta = new Timer(segundostimer);
							 _timerCliente_nena_coqueta.addEventListener(TimerEvent.TIMER, fnQuitarClienteNenaCoqueta); 
							 _timerCliente_nena_coqueta.start();
						}
						 		
						break;
					
					case "punky": 
					
						// colocar personaje punky
						loader_clientes.addChild(clientes_punky)
						clientes_punky.name = "clientes_punky";
						
						
						if( clientes_punky.x >600) {
							clientes_punky.gotoAndPlay("espalda");
							clientes_punky.y = 980;
						}else {
							clientes_punky.gotoAndPlay("frente");
							clientes_punky.y = 520;
						}
						
						TweenMax.to(clientes_punky, 5, {x:230, y:550, onComplete:clientes_punky.gotoAndStop, onCompleteParams:["parado"]});
						clientes_punky.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);


						fnGloboInicial(CLI_PUNKY);


						if( _sys_blnEsperaClientes == false) {

							_timerCliente_punky = new Timer(segundostimer);
							 _timerCliente_punky.addEventListener(TimerEvent.TIMER, fnQuitarClientePunky); 
							 _timerCliente_punky.start();
						}
						
 						break;
						
					case "vieja": 
					
						// colocar personaje vieja
						loader_clientes.addChild(clientes_vieja)
						clientes_vieja.name = "clientes_vieja";

						if( clientes_vieja.x >600) {
							clientes_vieja.gotoAndPlay("espalda");
							clientes_vieja.y = 650;

						}else {
							clientes_vieja.gotoAndPlay("frente");
							clientes_vieja.y = 800;

						}
						
						TweenMax.to(clientes_vieja, 3, {x:1000, y:750, onComplete:clientes_vieja.gotoAndStop, onCompleteParams:["parado"]});
						clientes_vieja.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);
						//clientes_vieja.addChildAt(globito,0)

						fnGloboInicial(CLI_VIEJA);

						
						if( _sys_blnEsperaClientes == false) {

							_timerCliente_vieja = new Timer(segundostimer);
							 _timerCliente_vieja.addEventListener(TimerEvent.TIMER, fnQuitarClienteVieja); 
							 _timerCliente_vieja.start();
							
						}
						
 						break;
					
				
				case "viejito": 
					
						// colocar personaje viejito
						loader_clientes.addChild(clientes_viejo)
						clientes_viejo.name = "clientes_viejo";
						
						if( clientes_viejo.x > 800) {
							clientes_viejo.gotoAndPlay("espalda");
							clientes_viejo.y = 450;	

						}else {
							clientes_viejo.gotoAndPlay("frente");
							clientes_viejo.y = 850;	

						}
						
						TweenMax.to(clientes_viejo, 6, {x:620, y:650, onComplete:clientes_viejo.gotoAndStop, onCompleteParams:["parado"]});
						clientes_viejo.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);
						//clientes_viejo.addChildAt(globito,0)

						 fnGloboInicial(CLI_VIEJO);


						if( _sys_blnEsperaClientes == false) {

							 _timerCliente_viejito = new Timer(segundostimer);
							 _timerCliente_viejito.addEventListener(TimerEvent.TIMER, fnQuitarClienteViejito); 
							 _timerCliente_viejito.start();
						}

 						break;
					} // switch
				
				
				// aumentamos el control de clientes en escena
				_sys_ClientesEnEscena++;

						/// TURIELLE					
						/* aca hay que ver como controlar los globitos
						_ArrayClientes[iCliente].addChild(globito)
						globito.y = - _ArrayClientes[iCliente].height;
						*/
				
			} // clientes en escena
			
		} // fin function
		
		
	 //***********************************
	 // Control de aparición aleatoria de clientes y no repetición
	 //
	 //***********************************
	 private function fnClienteOn():Number {
               var salir:Boolean = false;
               var existe:Boolean= false;
               var iCliente:int; 
			   var valorCliente:int;	
 


				 do {
						//retorna un índice del array aleatorio
						iCliente = (Math.floor(Math.random() * (_ArrayControlClienteDispo.length )) + 0);
						
						//Guardamos el valor del cliente (no nos importa la posición porque se va a desordenar)
						valorCliente = _ArrayControlClienteDispo[iCliente];
						
					} while ( (valorCliente == _sys_CliAnt) ||  (valorCliente == _sys_CliAct ))
						 
					_sys_CliAnt = valorCliente;
					
					//agregamos al stage el indice valor contenido en la posición iCliente
					_ArrayControlClienteOnStage.push(valorCliente);
					
					//Eliminamos del array de clientes disponibles el que ahora está en el Stage
					for (var i:int = 0; i < _ArrayControlClienteDispo.length; i++){
						
						if(_ArrayControlClienteDispo[i] == valorCliente) {
							  _ArrayControlClienteDispo.splice(i,1);
						}
               		 }


					return valorCliente;
                }


       private function fnClienteOff( iCliente:Number ):void {

			//Volvemos a insertar el cliente en números disponibles
			_ArrayControlClienteDispo.push(iCliente);
					
			//Eliminamos del Array de Control del cliente onStage
			
             for (var i:int = 0; i < _ArrayControlClienteOnStage.length; i++){
                
					if(_ArrayControlClienteOnStage[i] == iCliente) {
                          _ArrayControlClienteOnStage.splice(i,1);
       
	   			}
              }
         }
		 
	
 	 // FIN Control de aparición aleatoria de clientes y no repetición
	 //
	 //***********************************
	
 
 	function fnQuitarPersonaje( vlnPersonaje:int, blnSeFue:Boolean):void {
		
		if( blnSeFue == true) {
			fnGloboNoAtendido( vlnPersonaje );
		}
			
			
		switch( vlnPersonaje) {
			
			case CLI_MORMON:
			
				
				_timerCliente_mormon.stop();
				clientes_mormon.gotoAndPlay("frente");
				TweenMax.to(clientes_mormon, 5, {x:1300, y:790,onComplete:loader_clientes.removeChild, onCompleteParams:[clientes_mormon]});
				fnClienteOff( CLI_MORMON );
				
				
				
				break;
	  		
			case CLI_NENA_AVION:
				_timerCliente_nena_avion.stop();
				clientes_nena_avion.gotoAndPlay("frente");
				TweenMax.to(clientes_nena_avion, 5, {x:1300, y:790,onComplete:loader_clientes.removeChild, onCompleteParams:[clientes_nena_avion]});
				fnClienteOff( CLI_NENA_AVION );
				break;
			
		  	case CLI_NENA_COQUETA:
			
				_timerCliente_nena_coqueta.stop();
				clientes_coqueta.gotoAndPlay("frente");
				TweenMax.to(clientes_coqueta, 5, {x:1300, y:1200,onComplete:loader_clientes.removeChild, onCompleteParams:[clientes_coqueta]});
 				//loader_clientes.removeChild(clientes_coqueta);
 				fnClienteOff( CLI_NENA_COQUETA );

				break;
				
		 	case CLI_PUNKY:
			
				_timerCliente_punky.stop();
				clientes_punky.gotoAndPlay("frente");
				TweenMax.to(clientes_punky, 5, {x:1300, y:800,onComplete:loader_clientes.removeChild, onCompleteParams:[clientes_punky]});
				//loader_clientes.removeChild(clientes_punky);
				fnClienteOff( CLI_PUNKY );
			
				break;
				
 		 	case CLI_VIEJA:
			
				_timerCliente_vieja.stop();
				clientes_vieja.gotoAndPlay("frente");
				TweenMax.to(clientes_vieja, 5, {x:1300, y:800,onComplete:loader_clientes.removeChild, onCompleteParams:[clientes_vieja]});
				//loader_clientes.removeChild(clientes_vieja);
				fnClienteOff( CLI_VIEJA );
				
 				break;
		 
		 	case CLI_VIEJO:
				_timerCliente_viejito.stop();
				clientes_viejo.gotoAndPlay("espalda");
				TweenMax.to(clientes_viejo, 8, {x:-300, y:300,onComplete:loader_clientes.removeChild, onCompleteParams:[clientes_viejo]});
 				//loader_clientes.removeChild(clientes_viejo);
 				fnClienteOff( CLI_VIEJO );
 			
				break;
 
 		}
		_sys_ClientesEnEscena--;
		
	}
 
 
		//**************************************
		// Función CLAVE!!!!
		//
		// Determina todas las acciones cuando termina de atender al cliente
		// Define el tiempo (las semanas transcurres x cant de clientes) 
		// Suma o resta popularidad
		// Re calcula el puntaje
		//
		//**************************************
		private function fnFinAtiendeCliente( blnVentaEfectuada: Boolean ):void {
			
			//Chequeamos la cantidad de clientes y verificamos cambio de semana, clientes
			
			
			if(_sys_blnClienteBienAtendido == true){
				fnGloboBienAtendido(_sys_CliAct);

			}
			
			fnQuitarPersonaje( _sys_CliAct, false );
			_sys_CliAct = -1;
			fnDebitarMercaderia();
			mensaje_compra_realizada.gotoAndStop(2);
			

			_sys_CantClientesSemanaActual++;
			_sys_CantClientesAtendidos++;
			
			//trace(" clientes atendidos " + _sys_CantClientesAtendidos);
			//trace(" clientes semana actual " + _sys_CantClientesSemanaActual);
			//trace(" clientes x semana  " + _sys_CantClientesxSemana);
			
			if( _sys_CantClientesSemanaActual == _sys_CantClientesxSemana) {
				
				_sys_SemanaCorriente++;
				_sys_CantClientesSemanaActual = 0;
				
				if(_sys_SemanaCorriente%4 == 0) {
					
					_sys_MesCorriente++;
				}
 				
				//Verificar si se hizo un pedido y llego el camion
				fnVerificarDebitoMercaderiaComprada();
				
				if( _sys_blnClienteBienAtendido == true) {
					fnActualizarClientesxSemana();
				}
				 
				//Cambiar placa de semana
				
			}
			
			
			if( _sys_blnClienteBienAtendido == true) {
				
					_sys_blnClienteBienAtendido = false;
					
					if ( blnVentaEfectuada == true ) {
						fnSumarPopularidad( CONST_UNIDAD_SUMA_POPULARIDAD );
						
							//En caso de aumentar la popularidad verificamos si se aumenta el timer de espera de los clientes
						fnVerificarTimerEspera();
						
					}
					
			}else {
					
				fnRestarPopularidad( CONST_UNIDAD_RESTA_POPULARIDAD );
			}
				
			if (blnVentaEfectuada == true) {
				fnRebajarStock();

			}
			
			fnAccionesClientes();
			fnAccionesSemanas();
			
			// Calculamos el dia que transcurre, el dia corriente se le resta 6 porque saltaba de 1 al dia 7.
			_sys_DiaCorriente = ((_sys_SemanaCorriente * (_sys_TotalMeses*30))/_sys_TotalSemanas)-6;
			
			if ( _sys_CantClientesSemanaActual < _sys_CantClientesxSemana) {
				
				_sys_DiaCorriente += ( _sys_CantClientesSemanaActual * 7 / _sys_CantClientesxSemana);
			}
			
			
			fnCalcPuntajeGeneral();
			
			F_colocar_indicadores();
			
			
			// popularidad negativa
  			if( _sys_Popularidad < 0) {
				// Pierde el juego x popularidad
				F_bloqueo_botones();
				Loader_placas.addChild(mensaje_perdiste_x_popularidad);
				mensaje_perdiste_x_popularidad.btn_fin.addEventListener(MouseEvent.MOUSE_DOWN, F_Perdio_x_popularidad);
			}
			
			else 
				if (_sys_Popularidad < _sys_PuntosComunidad) {
					// Placa de aviso "Atender bien al cliente
					
					if( _sys_blnHabilitarAvisoAtencion == true) {
					
						Loader_placas.addChild(mensaje_atender_bien);
						mensaje_atender_bien.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Placa);	
						_sys_blnHabilitarAvisoAtencion = false;
						
					
				}else {
					_sys_blnHabilitarAvisoAtencion = true;
				}
			}
			
			
		}
		
		//******************************************************************************
		// por cada producto vendido, se baja el stock y sube la ganancia (saldoCapital)
		//
		//*****************************************************************************
		public function fnRebajarStock():void {

			for (var x:int = 0; x < _ArrayPedidoCliente.length; x++) {


				//Si el stock da para hacer la compra, rebajamos el stock
				if (_ArrayPedidoCliente[x].stock_suficiente == true ) {

					for (var i:int = 0; i< _ArrayMercaderia.length; i++) {
		
						if( _ArrayPedidoCliente[x].producto == _ArrayMercaderia[i].producto){
							
							
							//Restamos al stock
							_ArrayMercaderia[i].cant_kilos -=   _ArrayPedidoCliente[x].cant_pedido; 
							
							//Aumentamos la ganancia
							_sys_SaldoCapital+= _ArrayMercaderia[i].precio_kilo * _ArrayPedidoCliente[x].cant_pedido; 	
						}
					}
				}
			}
				
		}
		
		
		//****************************************
		//  FUNCION CLAVE
		//  
		// Aquí se realizan todos los cálculos automáticos de lo que el cliente pide para comprar
		// 
		// Selecciona aleatoriamente productos
		// Calcula Cantidades
		// Determina plata pagada
		// Determina si fue bien o mal atendido
		//
		//****************************************
		
		
		 public function fnPedidoDelCliente():void {
			
			placa_dialogo_venta.PDC_intentalo_nuevamente.visible = false;		
			placa_dialogo_venta.PDC_vuelto.visible=false;
			placa_dialogo_venta.PDC_venta_correcta.visible=false;
			placa_dialogo_venta.PDC_mal_atendido.visible = false;
			placa_dialogo_venta.PDC_sin_stock.visible = false;


			var ix:int;
			var cant:Number;
			var cantent:int;
			var min:Number=0.5;
			var max:Number=4;
			var bandera:int;
			var cantPedidos:int;
			var blnStockSuficiente:Boolean;
			var unidad:String;
			
			_ArrayPedidoCliente = new Array();
		    
			cantPedidos = fnObtCantPedir();
			_sys_blnClienteBienAtendido = true;
			
			_sys_ImportePedido =0;
			
			do {
				
				//Calculamos una cantidad randómica
				var xcant:Number = (Math.floor(Math.random() * (max - min )) + min);
					 
				cantent = Math.max(1,xcant);
					
				if( bandera == 1) {
					cant = xcant;
					bandera = 0;
				} else {
					cant = cantent;
					bandera = 1;
				}
				
			
				
 				
				//Obtenemos un producto aleatoriamente
				ix = (Math.floor(Math.random() * (_ArrayMercaderia.length )) + 0);
				
				// si hay stock y además no lo pedí todavía...
				if ( fnProductoOk( _ArrayMercaderia[ix].producto, _ArrayMercaderia[ix].cant_stock, _ArrayPedidoCliente ) ){
					
					
					blnStockSuficiente = true;
					
					if ( _ArrayMercaderia[ix].cant_kilos - cant < 0 ){
						blnStockSuficiente = false;
						
					}
					
					//Si lo que viene es un producto de vitrina, redondeamos la cantidad
					
					if( _ArrayMercaderia[ix].tipo == "V") {
						
						cant = Math.round(cant);
						unidad = " Unid."
						
					} else {
						unidad = " Kgs."
						
					}
					
 					 //agregar a array de pedidos

					_ArrayPedidoCliente.push({ producto: _ArrayMercaderia[ix].producto, precio_kilo: _ArrayMercaderia[ix].precio_kilo, cant_pedido: cant, stock: _ArrayMercaderia[ix].cant_kilos, stock_suficiente:blnStockSuficiente, unidad: unidad });

					
				}
				
			} while (_ArrayPedidoCliente.length < cantPedidos)
			
			
			//Calculamos el importe que paga el cliente (más que el importe del pedido)
			
			
			
			// colocar en la placa
			for (var i:int = 0; i < _ArrayPedidoCliente.length; i++) {
				
				//si la mercaderia alcanza...
				if (_ArrayPedidoCliente[i].stock_suficiente == true ) {
					_sys_ImportePedido += (_ArrayPedidoCliente[i].precio_kilo * _ArrayPedidoCliente[i].cant_pedido);
				
				}
				// por cada elemento colocar los valores en la placa
				//trace(_ArrayPedidoCliente[i].producto);
				
				var PedidoCliente:TextField = new TextField();
				PedidoCliente.embedFonts = true;
				PedidoCliente.defaultTextFormat = td;
				PedidoCliente.autoSize = TextFieldAutoSize.LEFT;


				PedidoCliente.text = (_ArrayPedidoCliente[i].producto +":  " + _ArrayPedidoCliente[i].cant_pedido +  _ArrayPedidoCliente[i].unidad).toUpperCase();

				PedidoCliente.x = 340;
				PedidoCliente.y = 244 + (30 * i);
				Loader_textos_pedidos.addChild(PedidoCliente);
				
				var PrecioKilo:TextField = new TextField();
				PrecioKilo.defaultTextFormat = td;
				PrecioKilo.autoSize = TextFieldAutoSize.LEFT;
				
				PrecioKilo.text = _ArrayPedidoCliente[i].precio_kilo;

				PrecioKilo.x = 530;
				PrecioKilo.y = 244 + (30 * i);
				Loader_textos_pedidos.addChild(PrecioKilo);
				
				var Stock:TextField = new TextField();
				Stock.defaultTextFormat = td;
				Stock.autoSize = TextFieldAutoSize.LEFT;
				
				Stock.text = (_ArrayPedidoCliente[i].producto +":  " +_ArrayPedidoCliente[i].stock +   _ArrayPedidoCliente[i].unidad).toUpperCase();

				Stock.x = 650;
				Stock.y = 244 + (30 * i);
				Loader_textos_pedidos.addChild(Stock);
				
				//trace(_ArrayPedidoCliente[i].stock_suficiente);
				
				if (_ArrayPedidoCliente[i].stock_suficiente == false) {
					var check_cruz = new Check_cruz();
					Loader_textos_pedidos.addChild(check_cruz);
					check_cruz.x = 580;
					check_cruz.y = 255 + (30 * i);				}
				else
				 {
					var check_clip = new Check_clip();
					check_clip.x = 580;
					check_clip.y = 255 + (30 * i);
					Loader_textos_pedidos.addChild(check_clip);
				}
		 

			}
			
 
			_sys_ImportePagado = fnGenerarImportePagado( _sys_ImportePedido, _sys_UnidadCambioPago );  

			//trace ("importe pedido " + _sys_ImportePedido);
			
 			
			if( _sys_blnTieneCalculadora== true) {
				placa_dialogo_venta.txt_total.text = _sys_ImportePedido;
				placa_dialogo_venta.PDC_vuelto.txt_vuelto.text = _sys_ImportePagado - _sys_ImportePedido;
			} else {
			
				placa_dialogo_venta.txt_total.text = "";
			}
			
			if( _sys_ImportePedido == 0) {
				
				//RESTELLI Colocar placa de que no hay stock
				
				placa_dialogo_venta.PDC_sin_stock.visible = true;
				placa_dialogo_venta.PDC_intentalo_nuevamente.visible = false;		
				placa_dialogo_venta.PDC_vuelto.visible=false;
				placa_dialogo_venta.PDC_venta_correcta.visible=false;
				placa_dialogo_venta.PDC_mal_atendido.visible = false;
				placa_dialogo_venta.btn_aceptar.visible=false;

				placa_dialogo_venta.PDC_sin_stock.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Dialogo_Venta);
				// Boton cierra la placa
				_sys_blnClienteBienAtendido = false;
				fnGloboMalAtendido( _sys_CliAct );
				
				fnFinAtiendeCliente( false );
				
			}
			
		}
		
	//****************************************
	//  Genera automáticamente, el monto con el que el cliente paga la compra
	// 
	//****************************************
			
	private function fnGenerarImportePagado( vImporteCompra:Number, valormayor: Number) : Number {
		var valor:Number;
		var valoraux:Number = 0;
		var salir:Boolean = false;
		 
		do {
		 
			if (valoraux > vImporteCompra) {
			 
				valor = valoraux - vImporteCompra;
				salir = true;
				 
			}else {
				valoraux+= valormayor;
			 
		}
		 
		 
		} while (salir == false)
		 
		return valoraux;
		}


		//****************************************
		//  Cuando el usuario debe calcular el importe total de la venta, controla que la misma sea correcta
		// 
		//****************************************
		
		
		public function fnCheckImportePedido(event:MouseEvent):void
		{
			//trace(placa_dialogo_venta.txt_total.text)
			var ventaTotal:String = placa_dialogo_venta.txt_total.text;
			
			
			intentosValor++;
			
			//trace ("intentos valor " + intentosValor);
			
			if (intentosValor<= 2) {
				if( Number(ventaTotal) != _sys_ImportePedido)  {
						//trace("calculo mal mal");
				
						//trace ("monto calculado " + _sys_ImportePedido);
						//trace ("monto ingresado " + ventaTotal);
				
						placa_dialogo_venta.PDC_intentalo_nuevamente.visible=true;
						placa_dialogo_venta.PDC_vuelto.visible=false;
						_sys_blnClienteBienAtendido = false;
						
						fnGloboMalAtendido( _sys_CliAct );
						
						
				}else {
					
					//trace("calculo bien");
				
					intentosValor=0;
					placa_dialogo_venta.PDC_intentalo_nuevamente.visible=false;
					placa_dialogo_venta.PDC_vuelto.visible=true;
					placa_dialogo_venta.btn_aceptar.visible=false;
					placa_dialogo_venta.PDC_vuelto.btn_cambio.addEventListener(MouseEvent.MOUSE_DOWN, fnCalcVueltoUsuario); /// chuequeo si sumo bien
					//trace("_sys_ImportePagado"+_sys_ImportePagado)
					placa_dialogo_venta.PDC_vuelto.txt_pago.text =  _sys_ImportePagado;
					intentosValor=0;
					}
					
			} else {
					
					//trace("se fue");
					//ACA-GT
					fnGloboMalAtendido( _sys_CliAct );
					F_Cliente_Mal_Atendido();

					//cerrar las placas
					intentosValor=0;
					fnFinAtiendeCliente( false );

				}
			
 		}
		
		
		private function F_Cliente_Mal_Atendido():void {
			placa_dialogo_venta.PDC_mal_atendido.visible = true;
			placa_dialogo_venta.PDC_intentalo_nuevamente.visible=false;
			placa_dialogo_venta.PDC_vuelto.visible=false;
			placa_dialogo_venta.btn_aceptar.visible=false;
			placa_dialogo_venta.PDC_mal_atendido.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Dialogo_Venta);
		}
		
		
		//****************************************
		//  Calculo automático del vuelto que da el cliente
		// 
		//****************************************
		public function fnCalcVueltoUsuario(event:MouseEvent):void
		{
			
			var vueltoUsuario = placa_dialogo_venta.PDC_vuelto.txt_vuelto.text;
			
			var vuelto:Number;
  			
			vuelto = _sys_ImportePagado - _sys_ImportePedido;
			
			//AddIntentos();
			intentosValor++;
			
			//trace ("vuelto " + vuelto);
			//trace ("vuelto ingresado " + vueltoUsuario);
			//trace( "intentos " + ObtIntentos());

			if (intentosValor <= 2) {
				if( Number(vueltoUsuario) != vuelto) {
						//trace("cambio mal");
						placa_dialogo_venta.PDC_intentalo_nuevamente.visible=true;
						placa_dialogo_venta.PDC_vuelto.visible=true
						//setChildIndex(placa_dialogo_venta.PDC_vuelto,numChildren - 1); 
						_sys_blnClienteBienAtendido = false;
						fnGloboMalAtendido( _sys_CliAct );

						//trace("agregando intentos");
						//trace ("intento " + ObtIntentos());
						
				}else {
					
					//trace("cambio ok, termina venta");
					placa_dialogo_venta.PDC_intentalo_nuevamente.visible=false;
					placa_dialogo_venta.btn_aceptar.visible = false;
					placa_dialogo_venta.PDC_venta_correcta.visible=true;
					placa_dialogo_venta.PDC_venta_correcta.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Dialogo_Venta_Exitoso); 	
					placa_dialogo_venta.PDC_vuelto.visible=false;
					ClearIntentos();
				}
			}  else {
				
				fnGloboMalAtendido(_sys_CliAct );
				
				F_Cliente_Mal_Atendido();

				//F_Cierro_Dialogo();
				//cerrar las placas
				ClearIntentos();
				fnFinAtiendeCliente( false );

			}
		}
		
		
				
		//******************************************		
		// Activar acciones que dependen de la cantidad de clientes atendidos
		//
		//******************************************		
		private function fnAccionesClientes():void {
			
			switch(_sys_CantClientesAtendidos){
				
				case CONST_CLIENTES_CONTRATA_AYUDANTE:
					_sys_blnHabilitarAyudante = true;
					
					//pop pup "ayudante sugerido"
					Loader_placas.addChild(placa_ayudante_sugerido);
					btn_asistente.addEventListener(MouseEvent.MOUSE_DOWN, F_PlacaAsistente);
					placa_ayudante_sugerido.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Placa);
					break;
					
				case CONST_CLIENTES_COMPRA_CALCULADORA: 
				
					fnCalculadora_Sugerida();
				
					break;
			}
		}



		private function fnCalculadora_Sugerida():void {
			
			//Acciones para compra de calculadora
			Loader_placas.addChild(placa_calculadora_sugerida);
			placa_compra_varios.compra_varios_scrool.btn_compra_calculadora.addEventListener(MouseEvent.MOUSE_DOWN, F_Pramteros_compravarios);
			TweenMax.to(placa_compra_varios.compra_varios_scrool.btn_compra_calculadora, 1, {tint:null});
			placa_compra_varios.compra_varios_scrool.btn_compra_calculadora.mouseEnabled = true;
			placa_compra_varios.compra_varios_scrool.candado_calculadora.visible = false;
			F_bloqueo_botones();
			placa_calculadora_sugerida.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Placa);

		}
		
		
		//******************************************		
		//Activar acciones que dependen de la cantidad de semanas transcurridas 
		// 
		// CONTROL DEL TIEMPO DE JUEGO!!!!
		// 
		//******************************************		
		private function fnAccionesSemanas():void {
			
			 
			var blnPersonajeMalo:Boolean=false;
			
			switch (_sys_SemanaCorriente) {
				
				case 3:
				
					//Aparece el Malo
					if(_sys_blnHabilitarMalo == true) {
						blnPersonajeMalo =true;
						
						fnPersonajeMalo();
						
						_sys_blnHabilitarMalo = false;
					}
					break;
				
				
				case 5:
				
					//Juego recolección IENMBA
					fnJuegoRecoleccion();
					break;
				
				case 4:
				
					//¨Paga los gastos del primer mes
 					if(_sys_vblnPagarFijosIni == true) { ///hay que ver aca!!!
						fnPagarGastosIni();
					}
					break;
				
				case 6:
				
					//llama al minijuego del cálculo
					fnMiniJuegoCalculo();
					break;
				
				case 7:
					// disponible
					
  					break;
				
				
				case 8:
				 	
 					
					//Debe pagar los gastos finales
					if(_sys_vblnPagarFijosFin == true) {

						fnPagarGastosFin();
					}
					break;
				
				
			}
			
			//----------------------------------------
			// Control de llamada a la donación
			// _sys_CtrlDonar responde a semanas
			//----------------------------------------
			if( _sys_CtrlDonar < 5 && blnPersonajeMalo == false) {
				var vlngSemanaMangueo = _sys_CtrlDonar + 2;
				//vlngSemanaMangueo = 3;
				
				if( _sys_SemanaCorriente == vlngSemanaMangueo ) {
					
					fnTareasComunidad(_sys_CtrlDonar);
				}
				
			}
			 
		} // fin Acciones Semanas
		
		
		
		public function F_bloqueo_botones():void
		{
			Placa_anular_btn.visible = true;

		}

		public function F_habilito_botones():void
			{
				Placa_anular_btn.visible = false;
	
			}
			
		private function F_Cierro_Dialogo_Asesora(event:MouseEvent):void
			{		
			TweenMax.to(placa_dialogo_asesora.asesora, 0.5, {x:-500, onComplete:F_Cierro_Dialogo_Varios});

			}
		
		private function F_Cierro_Dialogo_Varios():void
		{				
			Loader_dialogo.removeChildAt(0);
			F_habilito_botones();
			
		}
		

		private function F_Cierro_Dialogo():void
		{
			//trace("cierro placa venta");
			
			while (Loader_textos_pedidos.numChildren > 0) {
			Loader_textos_pedidos.removeChildAt(0);

			}
			Loader_dialogo.removeChild(placa_dialogo_venta);
			F_habilito_botones();
			
		}
		
		private function F_Cierro_Dialogo_Donacion():void
		{				
			F_habilito_botones();
			TweenMax.to(placa_dialogo_donar.personaje, 0.5, {x:-500, onComplete:removeChild, onCompleteParams:[placa_dialogo_donar]});
		}
		 
		private function F_Cierro_Dialogo_Venta(event:MouseEvent):void
		{
			TweenMax.to(placa_dialogo_venta.compradores, 0.5, {x:-500, onComplete:F_Cierro_Dialogo});
			placa_dialogo_venta.PDC_intentalo_nuevamente.visible = false;		
			placa_dialogo_venta.PDC_vuelto.visible=false;
			placa_dialogo_venta.PDC_venta_correcta.visible=false;
			placa_dialogo_venta.PDC_mal_atendido.visible = false;
			placa_dialogo_venta.PDC_sin_stock.visible = false;
		
		}
		
		private function F_Cierro_Dialogo_Venta_Exitoso(event:MouseEvent):void
		{
			fnFinAtiendeCliente( true );				
			TweenMax.to(placa_dialogo_venta.compradores, 0.5, {x:-500, onComplete:F_Cierro_Dialogo});
			placa_dialogo_venta.PDC_intentalo_nuevamente.visible = false;		
			placa_dialogo_venta.PDC_vuelto.visible=false;
			placa_dialogo_venta.PDC_venta_correcta.visible=false;
			placa_dialogo_venta.PDC_mal_atendido.visible = false;
			placa_dialogo_venta.PDC_sin_stock.visible = false;
		
		}
		
		private function F_Cierro_Placa(event:MouseEvent):void
		{
			while (Loader_placas.numChildren > 0) {
				Loader_placas.removeChildAt(0);
				}
			F_habilito_botones();		
		}

		private function F_PlacaCapital(event:MouseEvent):void
		{
			call_PlacaCapital(false);
		}
		
		
		//*****************************************
		//  Función con placa para pagar los gastos mensuales fijos!
		// 
		//*****************************************
		
		private function call_PlacaCapital( esAutomatico:Boolean):void {
			
			var vTotalGastos:Number= 0; 
			var vSueldoPagar:Number = 0;
			
			if(_sys_blnAyudanteContratado == true) {
				vSueldoPagar = _ArrayPagosMensuales[COSTO_SUELDO].valor;
			}


			//if( _sys_vblnPagarFijosIni == true  || _sys_vblnPagarFijosFin == true) {
			
			if (esAutomatico==true) {
				placa_info_financiera.btn_pagar.addEventListener(MouseEvent.CLICK, F_PlacaCapital_ConfirmarPagos);
				placa_info_financiera.btn_pagar.mouseEnabled = true;
				placa_info_financiera.candado.visible = false;
				TweenMax.to(placa_info_financiera.btn_pagar, 1, {tint:null});

			} else {
				
				placa_info_financiera.btn_pagar.removeEventListener(MouseEvent.CLICK, F_PlacaCapital_ConfirmarPagos);		 
				placa_info_financiera.btn_pagar.mouseEnabled = false;
				placa_info_financiera.candado.visible = true;
				TweenMax.to(placa_info_financiera.btn_pagar, 1, {tint:color_btn_deshabilitado});

			}
			if( _sys_PagosCuotasMensuales == 1 ) {
					placa_info_financiera.cuota_uno.gotoAndStop(2);

				} 
				else if (_sys_PagosCuotasMensuales == 2 ) {
					placa_info_financiera.cuota_dos.gotoAndStop(2);

					//F_Gano();
				}
				

			
			vTotalGastos = vSueldoPagar +_ArrayPagosMensuales[COSTO_CUOTA].valor + _ArrayPagosMensuales[COSTO_ALQUILER].valor;
			
			placa_info_financiera.txt_mes.text = _sys_MesCorriente-1;
			placa_info_financiera.txt_cuota.text = _ArrayPagosMensuales[COSTO_CUOTA].valor;
			placa_info_financiera.txt_gastos_fijos.text = _ArrayPagosMensuales[COSTO_ALQUILER].valor;

			placa_info_financiera.txt_sueldos.text = vSueldoPagar;
			placa_info_financiera.txt_gastos_personales.text = 0;
			placa_info_financiera.txt_total_gastos.text = vTotalGastos;
			placa_info_financiera.txt_total_capital.text = _sys_SaldoCapital;
			
			
			placa_info_financiera.txt_saldo.text = _sys_SaldoCapital - vTotalGastos;
			
			_sys_tmp_PuntajeGeneral = _sys_PuntajeGeneral+500;

			
			Loader_placas.addChild(placa_info_financiera);

			if (esAutomatico == false) {
				
				placa_info_financiera.btn_cerrar.visible = true;
				placa_info_financiera.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Placa);
			} else {
				placa_info_financiera.btn_cerrar.visible = false;
			}
			F_bloqueo_botones();
			
		}

		//*****************************************
		//  CONFIRMACION DE PAGOS FIJOS (GANA O PIERDE!!!!!)
		//
		//*****************************************

		private function F_PlacaCapital_ConfirmarPagos(event:MouseEvent):void
		{
			
			trace("aca gabriel");
			trace( Number(placa_info_financiera.txt_total_gastos.text));
			trace(_sys_SaldoCapital - Number(placa_info_financiera.txt_total_gastos.text));
			
			trace("saldo " + Number(placa_info_financiera.txt_saldo.text) );
			
			if( Number(placa_info_financiera.txt_saldo.text) < 0) {
			//if ( _sys_SaldoCapital - Number(placa_info_financiera.txt_total_gastos.text) <  0) {
				
				F_Perdio();
							
				trace("perdisteeee");
				// ver como terminar
			} else{
			
					_sys_SaldoCapital-= Number(placa_info_financiera.txt_total_gastos.text);
							
					_sys_PagosCuotasMensuales++;
					
					if( _sys_PagosCuotasMensuales == 1 ) {
							placa_info_financiera.cuota_uno.gotoAndStop(2);
							trace("felicitaciones pagaste tu primer cuota");
				
					} 
						else if( _sys_PagosCuotasMensuales == 2 ) {
							placa_info_financiera.cuota_dos.gotoAndStop(2);
							trace("felicitaciones ganaste");
				
							F_Gano();
					}
							
	
					F_colocar_indicadores();
					
					if(_sys_vblnPagarFijosIni == true) {
						_sys_vblnPagarFijosIni = false;
	
					}else {
						_sys_vblnPagarFijosFin =  false;
	
					}
					
					/*placa_info_financiera.btn_pagar.addEventListener(MouseEvent.CLICK, F_PlacaCapital_ConfirmarPagos);		 
					TweenMax.to(placa_info_financiera.btn_pagar, 1, {tint:null});
					placa_info_financiera.candado.visible = false;
					placa_info_financiera.btn_pagar.mouseEnabled = true;
					*/
					call_PlacaCapital(false);
			}
		}


		//*****************************************
		//  Placa para compra de mercadería por parte del emprendedor
		//
		//*****************************************


		private function F_PlacaComprasFrutas(event:MouseEvent):void
		{
			Loader_placas.addChild(placa_compra_frutas);
			fnLimpiarCamposPedido();
			placa_compra_frutas.no_te_da_la_plata.visible = false;
			
			placa_compra_frutas.btn_vitrina.mouseEnabled = true;
			placa_compra_frutas.btn_puesto.mouseEnabled = false;
			placa_compra_frutas.placa_compra_de_vitrina.visible = false;
			placa_compra_frutas.btn_vitrina.clic.visible = false;
			placa_compra_frutas.btn_puesto.clic.visible = true;
					
			//botones para pasar de la placa de compra vitrina a puesto
			placa_compra_frutas.btn_puesto.addEventListener(MouseEvent.MOUSE_DOWN, F_ver_btn_Compra_Productos);
			placa_compra_frutas.btn_vitrina.addEventListener(MouseEvent.MOUSE_DOWN, F_ver_btn_Compra_Productos);
			
			///precio x kilo
			placa_compra_frutas.txt_precio_C_bananas.text =  "BANANAS = $" + _ArrayMercaderia[BANANAS].costo_kilo  * _sys_KilosxCajon;  //precio x cajón
			placa_compra_frutas.txt_precio_C_limones.text =  "LIMONES = $" + _ArrayMercaderia[LIMONES].costo_kilo  * _sys_KilosxCajon;
			placa_compra_frutas.txt_precio_C_manzanas.text = "MANZANAS = $" + _ArrayMercaderia[MANZANAS].costo_kilo  * _sys_KilosxCajon;
			placa_compra_frutas.txt_precio_C_naranjas.text = "NARANJAS = $" + _ArrayMercaderia[NARANJAS].costo_kilo  * _sys_KilosxCajon;
			placa_compra_frutas.txt_precio_C_berenjenas.text = "BERENJENAS = $" + _ArrayMercaderia[BERENJENAS].costo_kilo  * _sys_KilosxCajon;
			placa_compra_frutas.txt_precio_C_cebollas.text = "CEBOLLAS = $" + _ArrayMercaderia[CEBOLLAS].costo_kilo  * _sys_KilosxCajon;
			placa_compra_frutas.txt_precio_C_tomates.text = "TOMATES = $" + _ArrayMercaderia[TOMATES].costo_kilo  * _sys_KilosxCajon;
			placa_compra_frutas.txt_precio_C_zapallitos.text = "ZAPALLITOS = $" + _ArrayMercaderia[ZAPALLITOS].costo_kilo  * _sys_KilosxCajon;
			placa_compra_frutas.txt_precio_C_papas.text = "PAPAS = $" + _ArrayMercaderia[PAPAS].costo_kilo  * _sys_KilosxCajon;
			///total kilos en tu puesto
			placa_compra_frutas.txt_kilos_puesto_bananas.text =  "BANANAS = " + _ArrayMercaderia[BANANAS].cant_kilos +"KG";
			placa_compra_frutas.txt_kilos_puesto_limones.text =  "LIMONES = " + _ArrayMercaderia[LIMONES].cant_kilos +"KG";
			placa_compra_frutas.txt_kilos_puesto_manzanas.text = "MANZANAS = " + _ArrayMercaderia[MANZANAS].cant_kilos +"KG";
			placa_compra_frutas.txt_kilos_puesto_naranjas.text = "NARANJAS = " + _ArrayMercaderia[NARANJAS].cant_kilos +"KG";
			placa_compra_frutas.txt_kilos_puesto_berenjenas.text = "BERENJENAS = " + _ArrayMercaderia[BERENJENAS].cant_kilos +"KG";
			placa_compra_frutas.txt_kilos_puesto_cebollas.text = "CEBOLLAS = " + _ArrayMercaderia[CEBOLLAS].cant_kilos +"KG";
			placa_compra_frutas.txt_kilos_puesto_tomates.text = "TOMATES = " + _ArrayMercaderia[TOMATES].cant_kilos +"KG";
			placa_compra_frutas.txt_kilos_puesto_zapallitos.text = "ZAPALLITOS = " + _ArrayMercaderia[ZAPALLITOS].cant_kilos +"KG";
			placa_compra_frutas.txt_kilos_puesto_papas.text = "PAPAS = " + _ArrayMercaderia[PAPAS].cant_kilos +"KG";
		
			//// botones para compra de productos
			placa_compra_frutas.btn_compra_productos.addEventListener(MouseEvent.MOUSE_DOWN, F_Pramteros_compraProductos);
			placa_compra_frutas.btn_calcular.addEventListener(MouseEvent.MOUSE_DOWN, F_Calcular_compraProductos);
			
			/// placa compra de productos vitrina
			placa_compra_frutas.placa_compra_de_vitrina.no_te_da_la_plata.visible = false;
			
			placa_compra_frutas.placa_compra_de_vitrina.txt_compra_C_miel.text =""
			placa_compra_frutas.placa_compra_de_vitrina.txt_compra_C_aceitunas.text =""
			placa_compra_frutas.placa_compra_de_vitrina.txt_compra_C_dulces.text =""
			placa_compra_frutas.placa_compra_de_vitrina.txt_compra_C_especias.text =""
			
			placa_compra_frutas.placa_compra_de_vitrina.txt_precio_V_miel.text =   "MIEL = $" + _ArrayMercaderia[MIEL].costo_kilo;  //usamos este campo como precio unitario
			placa_compra_frutas.placa_compra_de_vitrina.txt_precio_V_aceitunas.text = "ACEITUNAS = $" + _ArrayMercaderia[ACEITUNAS].costo_kilo;  //usamos este campo como precio unitario
			placa_compra_frutas.placa_compra_de_vitrina.txt_precio_V_dulces.text =  "DULCES = $" + _ArrayMercaderia[DULCES].costo_kilo;  //usamos este campo como precio unitario
			placa_compra_frutas.placa_compra_de_vitrina.txt_precio_V_especias.text =  "ESPECIAS = $" + _ArrayMercaderia[ESPECIAS].costo_kilo;  //usamos este campo como precio unitario
			
			
			placa_compra_frutas.placa_compra_de_vitrina.txt_cantidad_V_miel.text  = "MIEL = " + _ArrayMercaderia[MIEL].cant_kilos +" UN";
			placa_compra_frutas.placa_compra_de_vitrina.txt_cantidad_V_aceitunas.text  = "ACEITUNAS = " + _ArrayMercaderia[ACEITUNAS].cant_kilos +" UN";
			placa_compra_frutas.placa_compra_de_vitrina.txt_cantidad_V_dulces.text  = "DULCES = " + _ArrayMercaderia[DULCES].cant_kilos +" UN";
			placa_compra_frutas.placa_compra_de_vitrina.txt_cantidad_V_especias.text  = "ESPECIAS = " + _ArrayMercaderia[ESPECIAS].cant_kilos +" UN";

			if (_sys_blnTieneVitrina==true) {

				TweenMax.to(placa_compra_frutas.placa_compra_de_vitrina.btn_compra_productos, 0.5, {tint:null});
				TweenMax.to(placa_compra_frutas.placa_compra_de_vitrina.btn_calcular, 0.5, {tint:null});
				placa_compra_frutas.placa_compra_de_vitrina.btn_compra_productos.mouseEnabled = true;
				placa_compra_frutas.placa_compra_de_vitrina.btn_calcular.mouseEnabled = true;
				placa_compra_frutas.placa_compra_de_vitrina.candado_calcular.visible = false;
				placa_compra_frutas.placa_compra_de_vitrina.candado.visible = false;
				placa_compra_frutas.placa_compra_de_vitrina.btn_compra_productos.addEventListener(MouseEvent.MOUSE_DOWN, F_Pramteros_compraProductosVitrina);
				placa_compra_frutas.placa_compra_de_vitrina.btn_calcular.addEventListener(MouseEvent.MOUSE_DOWN, F_Calcular_compraProductosVitrina);
				
			} else {
				TweenMax.to(placa_compra_frutas.placa_compra_de_vitrina.btn_compra_productos, 0.5, {tint:color_btn_deshabilitado});
				TweenMax.to(placa_compra_frutas.placa_compra_de_vitrina.btn_calcular, 0.5, {tint:color_btn_deshabilitado});
				placa_compra_frutas.placa_compra_de_vitrina.btn_compra_productos.mouseEnabled = false;
				placa_compra_frutas.placa_compra_de_vitrina.btn_calcular.mouseEnabled = false;
				placa_compra_frutas.placa_compra_de_vitrina.candado_calcular.visible = true;
				placa_compra_frutas.placa_compra_de_vitrina.candado.visible = true;
				
			}

			placa_compra_frutas.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Placa); 
			
			F_bloqueo_botones();
		}
	
	
		private function F_ver_btn_Compra_Productos(event:MouseEvent):void
                {
               switch (event.target.name)
				{
				case "btn_puesto" :
										   
					placa_compra_frutas.btn_puesto.mouseEnabled = false;				
					placa_compra_frutas.btn_vitrina.mouseEnabled = true;
					placa_compra_frutas.placa_compra_de_vitrina.visible = false;
					placa_compra_frutas.btn_vitrina.clic.visible = false;
					placa_compra_frutas.btn_puesto.clic.visible = true;

					break;
					
					case "btn_vitrina" :
					placa_compra_frutas.btn_puesto.mouseEnabled = true;
					placa_compra_frutas.btn_vitrina.mouseEnabled = false;
					placa_compra_frutas.placa_compra_de_vitrina.visible = true;
					placa_compra_frutas.btn_puesto.clic.visible = false;
					placa_compra_frutas.btn_vitrina.clic.visible = true;

					break;
					default :
					
					}

                }
				
		private function F_Calcular_compraProductos(event:MouseEvent):void
                {
                        placa_compra_frutas.placa_compra_de_vitrina.no_te_da_la_plata.visible = false;

                   
                        if( fnSaldoSuficienteCompra() == false ) {
                            placa_compra_frutas.no_te_da_la_plata.visible = true;
                       	}

                }
				
			private function F_Calcular_compraProductosVitrina(event:MouseEvent):void
                {
                        placa_compra_frutas.placa_compra_de_vitrina.no_te_da_la_plata.visible = false;

                   
                        if( fnSaldoSuficienteCompraVitrina() == false ) {
                            placa_compra_frutas.placa_compra_de_vitrina.no_te_da_la_plata.visible = true;
                       	}

                }
				
				
	
	    private function fnSaldoSuficienteCompraVitrina():Boolean {
			var ret:Boolean = true;
			
			 var vlngCantidad:Number;
                        var _TmpImporte:Number=0;


                        vlngCantidad = Number(placa_compra_frutas.placa_compra_de_vitrina.txt_compra_C_miel.text);
                        if(vlngCantidad > 0) {
                                        _TmpImporte+= fnCalcularProductoVitrina("miel",vlngCantidad);
                        }

                        vlngCantidad = Number(placa_compra_frutas.placa_compra_de_vitrina.txt_compra_C_aceitunas.text);
                        if(vlngCantidad > 0) {
                                        _TmpImporte+= fnCalcularProductoVitrina("aceitunas",vlngCantidad);
                        }

                        vlngCantidad = Number(placa_compra_frutas.placa_compra_de_vitrina.txt_compra_C_dulces.text);
                        if(vlngCantidad > 0) {
                                        _TmpImporte+= fnCalcularProductoVitrina("dulces",vlngCantidad);
                        }

                        vlngCantidad = Number(placa_compra_frutas.placa_compra_de_vitrina.txt_compra_C_especias.text);
                        if(vlngCantidad > 0) {
                                        _TmpImporte+= fnCalcularProductoVitrina("especias",vlngCantidad);
                        }

                      

						
						placa_compra_frutas.placa_compra_de_vitrina.txt_calcular_gastando.text = "$ "+ _TmpImporte;

                        if( _sys_SaldoCapital - _TmpImporte < 0) {
                           ret = false;												
                       	}
					return ret;
			
			}
	
	
	 private function fnSaldoSuficienteCompra():Boolean {
			var ret:Boolean = true;
			
			 var vlngCajones:Number;
                        var _TmpImporte:Number=0;


                        vlngCajones = Number(placa_compra_frutas.txt_compra_C_bananas.text);
                        if(vlngCajones > 0) {
                                        _TmpImporte+= fnCalcularProducto("bananas",vlngCajones);
                        }

                        vlngCajones = Number(placa_compra_frutas.txt_compra_C_limones.text);
                        if(vlngCajones > 0) {
                                        _TmpImporte+= fnCalcularProducto("limones",vlngCajones);
                        }

                        vlngCajones = Number(placa_compra_frutas.txt_compra_C_manzanas.text);
                        if(vlngCajones > 0) {
                                        _TmpImporte+= fnCalcularProducto("manzanas",vlngCajones);
                        }

                        vlngCajones = Number(placa_compra_frutas.txt_compra_C_naranjas.text);
                        if(vlngCajones > 0) {
                                        _TmpImporte+= fnCalcularProducto("naranjas",vlngCajones);
                        }

                        vlngCajones = Number(placa_compra_frutas.txt_compra_C_berenjenas.text);
                        if(vlngCajones > 0) {
                                        _TmpImporte+= fnCalcularProducto("berenjenas",vlngCajones);
                        }

                        vlngCajones = Number(placa_compra_frutas.txt_compra_C_cebollas.text);
                        if(vlngCajones > 0) {
                                        _TmpImporte+= fnCalcularProducto("cebollas",vlngCajones);
                        }

                        vlngCajones = Number(placa_compra_frutas.txt_compra_C_tomates.text);
                        if(vlngCajones > 0) {
                                        _TmpImporte+= fnCalcularProducto("tomates",vlngCajones);
                        }

                        vlngCajones = Number(placa_compra_frutas.txt_compra_C_zapallitos.text);
                        if(vlngCajones > 0) {
                                        _TmpImporte+= fnCalcularProducto("zapallitos",vlngCajones);
                        }

                        vlngCajones = Number(placa_compra_frutas.txt_compra_C_papas.text);
                        if(vlngCajones > 0) {
                                        _TmpImporte+= fnCalcularProducto("papas",vlngCajones);
                        }

						
						placa_compra_frutas.txt_calcular_gastando.text = "$ "+ _TmpImporte;

                        if( _sys_SaldoCapital - _TmpImporte < 0) {
                           ret = false;												
                       	}
					return ret;
			
			}
	
	
		
				public function fnCalcularProducto( vstrProducto: String, vlngCajones: Number):Number {

                        var ImporteRet:Number = 0;

                        for (var i:int = 0; i< _ArrayMercaderia.length; i++) {

                                if( vstrProducto.toUpperCase() == _ArrayMercaderia[i].producto.toUpperCase()){

                                        ImporteRet += _ArrayMercaderia[i].costo_kilo * (vlngCajones * _sys_KilosxCajon);

                                        //Verificamos si le da la plata
                                        //trace( "va gastando : " + ImporteRet);


                                }
                        }
                        return ImporteRet;

                }


				public function fnCalcularProductoVitrina( vstrProducto: String, vlngCantidad: Number):Number {

                        var ImporteRet:Number = 0;

                        for (var i:int = 0; i< _ArrayMercaderia.length; i++) {

                                if( vstrProducto.toUpperCase() == _ArrayMercaderia[i].producto.toUpperCase()){

                                        ImporteRet += _ArrayMercaderia[i].costo_kilo * vlngCantidad;  

                                        //Verificamos si le da la plata
                                        //trace( "va gastando : " + ImporteRet);
                                }
                        }
                        return ImporteRet;
                }



		private function F_Pramteros_compraProductosVitrina(event:MouseEvent):void
		{
			placa_compra_frutas.placa_compra_de_vitrina.no_te_da_la_plata.visible = false;
			
			var vlngCantidad:Number;
			
 
			 if( fnSaldoSuficienteCompraVitrina() == false ) {
                            placa_compra_frutas.placa_compra_de_vitrina.no_te_da_la_plata.visible = true;
             } else {

				vlngCantidad = Number(placa_compra_frutas.placa_compra_de_vitrina.txt_compra_C_miel.text);
				if(vlngCantidad > 0) {
						fnComprarProductoVitrina("miel",vlngCantidad);
				}
						
				vlngCantidad = Number(placa_compra_frutas.placa_compra_de_vitrina.txt_compra_C_aceitunas.text);
				if(vlngCantidad > 0) {
						fnComprarProductoVitrina("aceitunas",vlngCantidad);
				}
	
				vlngCantidad = Number(placa_compra_frutas.placa_compra_de_vitrina.txt_compra_C_dulces.text);
				if(vlngCantidad > 0) {
						fnComprarProductoVitrina("dulces",vlngCantidad);		
				}
	
				vlngCantidad = Number(placa_compra_frutas.placa_compra_de_vitrina.txt_compra_C_especias.text);
				if(vlngCantidad > 0) {
						fnComprarProductoVitrina("especias",vlngCantidad);
				}
						
				
				if( _sys_ImporteCompraTemp > 0) {
					
					while (Loader_placas.numChildren > 0) {
						Loader_placas.removeChildAt(0);
					}
				
					fnTerminarCompra(true);
					
 				}
						
				F_habilito_botones();
			 }
			 			
		}
		


		private function F_Pramteros_compraProductos(event:MouseEvent):void
		{
			placa_compra_frutas.no_te_da_la_plata.visible = false;
			
			var vlngCajones:Number;
			
 
			 if( fnSaldoSuficienteCompra() == false ) {
                            placa_compra_frutas.no_te_da_la_plata.visible = true;
             } else {

				vlngCajones = Number(placa_compra_frutas.txt_compra_C_bananas.text);
				if(vlngCajones > 0) {
						fnComprarProducto("bananas",vlngCajones);
				}
						
				vlngCajones = Number(placa_compra_frutas.txt_compra_C_limones.text);
				if(vlngCajones > 0) {
						fnComprarProducto("limones",vlngCajones);
				}
	
				vlngCajones = Number(placa_compra_frutas.txt_compra_C_manzanas.text);
				if(vlngCajones > 0) {
						fnComprarProducto("manzanas",vlngCajones);		
				}
	
				vlngCajones = Number(placa_compra_frutas.txt_compra_C_naranjas.text);
				if(vlngCajones > 0) {
						fnComprarProducto("naranjas",vlngCajones);
				}
						
				vlngCajones = Number(placa_compra_frutas.txt_compra_C_berenjenas.text);
				if(vlngCajones > 0) {
						fnComprarProducto("berenjenas",vlngCajones);
				}
				
				vlngCajones = Number(placa_compra_frutas.txt_compra_C_cebollas.text);
				if(vlngCajones > 0) {
						fnComprarProducto("cebollas",vlngCajones);
				}
				
				vlngCajones = Number(placa_compra_frutas.txt_compra_C_tomates.text);
				if(vlngCajones > 0) {
						fnComprarProducto("tomates",vlngCajones);	
				}
				
				vlngCajones = Number(placa_compra_frutas.txt_compra_C_zapallitos.text);
				if(vlngCajones > 0) {
						fnComprarProducto("zapallitos",vlngCajones);	
				}
				
				vlngCajones = Number(placa_compra_frutas.txt_compra_C_papas.text);
				if(vlngCajones > 0) {
						fnComprarProducto("papas",vlngCajones);		
				}
				 
				if( _sys_ImporteCompraTemp > 0) {
					
					while (Loader_placas.numChildren > 0) {
						Loader_placas.removeChildAt(0);
					}
				
					fnTerminarCompra(false);
					
					Loader_placas.addChild(mensaje_compra_realizada);
					if (_sys_blnArregloCamion == true) {
						mensaje_compra_realizada.gotoAndStop(2);				
									 
					} else {
								F_habilitar_BotonCompraFrutas(false);
								mensaje_compra_realizada.gotoAndStop(1);					
					}
				}else {
				
				 	F_habilitar_BotonCompraFrutas(true);
				}
						
				mensaje_compra_realizada.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Placa);

			 }
			 			
		}
		
		


		private function F_PlacaComprasVarios(event:MouseEvent):void
		{
			Loader_placas.addChild(placa_compra_varios);
			placa_compra_frutas.placa_compra_de_vitrina.no_te_da_la_plata.visible = false;
			
			placa_compra_varios.compra_varios_scrool.text_COSTO_BALANZA.text = _ArrayMateriales[I_CONS_COSTO_BALANZA].costo;
			placa_compra_varios.compra_varios_scrool.text_COSTO_CAMION.text =_ArrayMateriales[I_CONS_COSTO_CAMION].costo;
			placa_compra_varios.compra_varios_scrool.text_COSTO_RADIO.text =_ArrayMateriales[I_CONS_COSTO_RADIO].costo;
			////TURIELLE cambiar los costos de la alculadora y vitrina
			placa_compra_varios.compra_varios_scrool.text_COSTO_CALCULADORA.text =_ArrayMateriales[I_CONS_COSTO_CALCULADORA].costo;
			placa_compra_varios.compra_varios_scrool.text_COSTO_VITRINA.text =_ArrayMateriales[I_CONS_COSTO_VITRINA].costo;
						
			////
			placa_compra_varios.text_mensaje_varios.text = " ";
			placa_compra_varios.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Placa);
			///compra varios
			placa_compra_varios.compra_varios_scrool.btn_compra_balanza.addEventListener(MouseEvent.MOUSE_DOWN, F_Pramteros_compravarios);
			placa_compra_varios.compra_varios_scrool.btn_compra_camion.addEventListener(MouseEvent.MOUSE_DOWN, F_Pramteros_compravarios);
			placa_compra_varios.compra_varios_scrool.btn_compra_radio.addEventListener(MouseEvent.MOUSE_DOWN, F_Pramteros_compravarios);
			//placa_compra_varios.compra_varios_scrool.btn_compra_calculadora.addEventListener(MouseEvent.MOUSE_DOWN, F_Pramteros_compravarios);
			//placa_compra_varios.compra_varios_scrool.btn_compra_vitrina.addEventListener(MouseEvent.MOUSE_DOWN, F_Pramteros_compravarios);

			F_bloqueo_botones();
			//fnArregloCamion(); /// SOLO PARA TESTEO
			TweenMax.to(placa_compra_varios.compra_varios_scrool, 1, {x:-275, ease:easing_tmax});
			placa_compra_varios.btn_anterior.visible = false;
			placa_compra_varios.btn_siguiente.visible = true;
			placa_compra_varios.btn_siguiente.addEventListener(MouseEvent.MOUSE_DOWN, F_Pramteros_compra_varios_Scrool1);
			placa_compra_varios.btn_anterior.addEventListener(MouseEvent.MOUSE_DOWN, F_Pramteros_compra_varios_Scrool2);
						

		}
		private function F_Pramteros_compra_varios_Scrool1(event:MouseEvent):void
			{
				TweenMax.to(placa_compra_varios.compra_varios_scrool, 1, {x:-645, ease:easing_tmax});
				placa_compra_varios.btn_anterior.visible = true;
				placa_compra_varios.btn_siguiente.visible = false;

			}
		
		private function F_Pramteros_compra_varios_Scrool2(event:MouseEvent):void
			{
				TweenMax.to(placa_compra_varios.compra_varios_scrool, 1, {x:-275, ease:easing_tmax});
				placa_compra_varios.btn_anterior.visible = false;
				placa_compra_varios.btn_siguiente.visible = true;

			} 


		//**************************************
		//  Placa y lógica de elementos varios para el puesto (Balanza, camión, vitrina, radio, etc)
		//
		//**************************************

		private function F_Pramteros_compravarios(event:MouseEvent):void
		{
			var placa_comprado = new Placa_comprado();
			var blnSaldoSuficiente:Boolean =true;
			
			switch (event.target.name)
			{
				case "btn_compra_balanza" :
				
					if( _sys_SaldoCapital - _ArrayMateriales[I_CONS_COSTO_BALANZA].costo < 0) {
						blnSaldoSuficiente = false;
					} else {
					   
					   //balanza.gotoAndStop(2);
						
						_sys_SaldoCapital -= _ArrayMateriales[I_CONS_COSTO_BALANZA].costo;
						 
						_ArrayMateriales[I_CONS_COSTO_BALANZA].comprado ="S";
						
						_sys_TiempoPacienciaCliente +=  _sys_SegundosAumentoEspera;
						placa_compra_varios.compra_varios_scrool.balanza.addChild(placa_comprado);
						event.target.mouseEnabled = false;
						event.target.alpha = 0.3;
						balanza.gotoAndStop(2);
						
					}
					
					break;
				case "btn_compra_camion" :
				
 					if( _sys_SaldoCapital - _ArrayMateriales[I_CONS_COSTO_CAMION].costo < 0) {
						blnSaldoSuficiente = false;
					} else {
					
						_sys_SaldoCapital -= _ArrayMateriales[I_CONS_COSTO_CAMION].costo;
						_ArrayMateriales[I_CONS_COSTO_CAMION].comprado ="S";
						
						fnBajarCostosMercaderia( _sys_PorcentajeRebajaCostosArregloCamion );
						_sys_blnArregloCamion = true;
				
						placa_compra_varios.compra_varios_scrool.camion.addChild(placa_comprado);
						event.target.mouseEnabled = false;
						event.target.alpha = 0.3;
					}
					
					break;
					 
				case "btn_compra_radio" :
				
					if( _sys_SaldoCapital - _ArrayMateriales[I_CONS_COSTO_RADIO].costo < 0) {
						blnSaldoSuficiente = false;
					} else {
					
						placa_compra_varios.compra_varios_scrool.radio.addChild(placa_comprado);
						event.target.mouseEnabled = false;
						event.target.alpha = 0.3;
						//Rebaja del capital
						_sys_SaldoCapital -= _ArrayMateriales[I_CONS_COSTO_RADIO].costo;
						_ArrayMateriales[I_CONS_COSTO_RADIO].comprado ="S";
					}
					
					break;	
				case "btn_compra_calculadora" :
				///TURIELLE
 					if( _sys_SaldoCapital - _ArrayMateriales[I_CONS_COSTO_CALCULADORA].costo < 0) {
						blnSaldoSuficiente = false;
					} else {
					
						_sys_SaldoCapital -= _ArrayMateriales[I_CONS_COSTO_CALCULADORA].costo;
						_ArrayMateriales[I_CONS_COSTO_CALCULADORA].comprado ="S";
						
						//fnBajarCostosMercaderia( _sys_PorcentajeRebajaCostosArregloCamion );
						//_sys_blnArregloCamion = true;
				
						placa_compra_varios.compra_varios_scrool.calculadora.addChild(placa_comprado);
						event.target.mouseEnabled = false;
						event.target.alpha = 0.3;
						calculadora_mesa.visible = true;
						_sys_blnTieneCalculadora = true;
					
					}
					

					break;
					case "btn_compra_vitrina" :
						if( _sys_SaldoCapital - _ArrayMateriales[I_CONS_COSTO_VITRINA].costo < 0) {
							blnSaldoSuficiente = false;
						} else {
						
							_sys_SaldoCapital -= _ArrayMateriales[I_CONS_COSTO_VITRINA].costo;
							_ArrayMateriales[I_CONS_COSTO_VITRINA].comprado ="S";
							
							//fnBajarCostosMercaderia( _sys_PorcentajeRebajaCostosArregloCamion );
							//_sys_blnArregloCamion = true;
							
							 
							vitrina.visible = true;
							placa_compra_varios.compra_varios_scrool.vitrina.addChild(placa_comprado);
							event.target.mouseEnabled = false;
							event.target.alpha = 0.3;
							
							_sys_blnTieneVitrina = true;
						
						}
					
					break;
					default :
					
				}
				
				if( blnSaldoSuficiente == false) {
					
					placa_compra_varios.text_mensaje_varios.text = "No tienes dinero suficiente";
				}
				
				F_colocar_indicadores();
				
				
			}
			
			
		private function F_PlacaAsistente(event:MouseEvent):void
		{
			Loader_placas.addChild(placa_ayudante_contratar);
			F_bloqueo_botones();
			placa_ayudante_contratar.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Placa);
			
			
			if( _sys_blnHabilitarAyudante == true ) {
 				placa_ayudante_contratar.btn_contratar.addEventListener(MouseEvent.CLICK, F_Contratar_Ayudante); 
				placa_ayudante_contratar.btn_contratar.mouseEnabled = true;
				placa_ayudante_contratar.candado.visible = false;
				TweenMax.to(placa_ayudante_contratar.btn_contratar, 0.5, {tint:null});

				
			} else {

				placa_ayudante_contratar.btn_contratar.mouseEnabled = false;
				placa_ayudante_contratar.candado.visible = true;
				TweenMax.to(placa_ayudante_contratar.btn_contratar, 0.5, {tint:color_btn_deshabilitado});

			}
			
			
 			
			
			placa_ayudante_contratar.txt_valor_salario.text = _ArrayPagosMensuales[COSTO_SUELDO].valor;
			F_bloqueo_botones();
			//fnContratarAyudante(); // contrato ayudante

		}

		private function F_PlacaAyuda(event:MouseEvent):void
		{
			Loader_placas.addChild(placa_ayuda);
			placa_ayuda.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Placa);
			placa_ayuda.btn_siguiente.addEventListener(MouseEvent.MOUSE_DOWN, F_Scrool_siguiente);
			placa_ayuda.btn_anterior.addEventListener(MouseEvent.MOUSE_DOWN, F_Scrool_anterior);
			placa_ayuda.btn_anterior.visible = false;
			F_bloqueo_botones();
			placa_ayuda.scrool_ayuda.gotoAndStop(1);
		}
		private function F_Scrool_siguiente(event:MouseEvent):void
		{
			placa_ayuda.scrool_ayuda.nextFrame();
			placa_ayuda.btn_anterior.visible = true;

		}
		private function F_Scrool_anterior(event:MouseEvent):void
		{
			placa_ayuda.scrool_ayuda.prevFrame();
		}
		
		//// placas dialogo
		private function F_PlacaAsesoraInicio(event:MouseEvent):void
		{
			placa_inicio.visible = false;
			Loader_dialogo.addChildAt(placa_dialogo_asesora,0);
			placa_dialogo_asesora.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, IniciarJuego);
			placa_dialogo_asesora.txt_asesora_dialogo.text = fnObtTextoAsesorInicial(_itxt_asesor); /// cambiar por valor xml
			
 			placa_dialogo_asesora.btn_siguiente.addEventListener(MouseEvent.MOUSE_DOWN, fnCambiarTexto);
			 
		}
		
		private function fnCambiarTexto( event:MouseEvent):void {
			 _itxt_asesor++;	 
			placa_dialogo_asesora.txt_asesora_dialogo.text = fnObtTextoAsesorInicial(_itxt_asesor); /// cambiar por valor xml
			
			if(_itxt_asesor>2) {
				placa_dialogo_asesora.btn_siguiente.visible=false;
				
			}


		}
		
		private function F_PlacaAsesora(event:MouseEvent):void
		{
			F_bloqueo_botones();
			Loader_dialogo.addChildAt(placa_dialogo_asesora,0);
			TweenMax.to(placa_dialogo_asesora.asesora, 1, {x:0});

			placa_dialogo_asesora.txt_asesora_dialogo.text = fnObtTextoAsesor(false);
			placa_dialogo_asesora.btn_cerrar.removeEventListener(MouseEvent.MOUSE_DOWN, IniciarJuego);

			placa_dialogo_asesora.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Dialogo_Asesora);
		}

			function fnObtTextoAsesorInicial( iMsg:int):String {
				var texto:String;
				texto = _ArrayTextoAsesor[iMsg];
							
			return  texto; 
 
		}

		function fnObtTextoAsesor( MensajeInicio:Boolean):String {
			var i:int;
			
			if(MensajeInicio == true) {
				i= 0;
			} else {
			
				i = (Math.floor(Math.random() * (_ArrayTextoAsesor.length - 2 )) + 2);
			}
			
			return  _ArrayTextoAsesor[i]; 
 
		}


		//*****************************************
		//  Al clickear en el cliene, se abre la placa de venta de mercadería
		//  Pedido del cliente
		//*****************************************

		private function F_PlacaVenta(event:MouseEvent):void
		{
			trace(event.target.name.toString());
				  //var placa_dialogo_venta:MovieClip = new P_dialogo_venta();
			F_bloqueo_botones();
			placa_dialogo_venta = new P_dialogo_venta();
			
			Loader_dialogo.addChildAt(placa_dialogo_venta,0);

			//setChildIndex(Loader_dialogo,numChildren - 1); // tiramos el cuadro de dialogo para el top
			//trace(event.target.name);
			//trace("paro el timmer del selccionado");
			event.target.removeEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);

			switch (event.target.name)
			{
				case "clientes_nena_avion" :
					placa_dialogo_venta.compradores.gotoAndStop("nena_avion")
					_timerCliente_nena_avion.stop();
					_sys_CliAct = CLI_NENA_AVION;
					
					
					break;
				case "clientes_mormon" :
					placa_dialogo_venta.compradores.gotoAndStop("mormon")
					_timerCliente_mormon.stop();
					_sys_CliAct = CLI_MORMON;
					
					break;
				case "clientes_coqueta" :
					placa_dialogo_venta.compradores.gotoAndStop("nena_coqueta")
					 _timerCliente_nena_coqueta.stop();
					 _sys_CliAct = CLI_NENA_COQUETA;
					 
					break;
				case "clientes_punky" :
					placa_dialogo_venta.compradores.gotoAndStop("punky")
					 _timerCliente_punky.stop();
					 _sys_CliAct = CLI_PUNKY;
					 
					break;
				case "clientes_vieja" :
					placa_dialogo_venta.compradores.gotoAndStop("vieja")
					_timerCliente_vieja.stop();
					_sys_CliAct = CLI_VIEJA;
					
					break;
				case "clientes_viejo" :
					placa_dialogo_venta.compradores.gotoAndStop("viejito")
					 _timerCliente_viejito.stop();
					 _sys_CliAct = CLI_VIEJO;
					 
					break;
					default :

			}
			
			intentos=0;
			intentosValor = 0;

			//placa_dialogo_venta.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Dialogo);
			placa_dialogo_venta.btn_aceptar.addEventListener(MouseEvent.MOUSE_DOWN, fnCheckImportePedido); /// chuequeo si sumo bien
			TweenMax.to(placa_dialogo_venta.compradores, 1, {x:0});

			fnPedidoDelCliente();

		}
		
		
		private function fnGloboInicial(vlnPersonaje: int):void {
						
			switch( vlnPersonaje) {
			
						
			case CLI_MORMON:
			
				clientes_mormon.globito.gotoAndStop("normal") ;
				
				break;
	  		
			case CLI_NENA_AVION:
 				clientes_nena_avion.globito.gotoAndStop("normal") ;
				
								 
				break;
			
		  	case CLI_NENA_COQUETA:
			
				clientes_coqueta.globito.gotoAndStop("normal") ;
				 
				break;
				
		 	case CLI_PUNKY:
			
 				clientes_punky.globito.gotoAndStop("normal") ; 
				 
				break;
				
 		 	case CLI_VIEJA:
			
 				clientes_vieja.globito.gotoAndStop("normal") ; 
 				
 				break;
		 
		 	case CLI_VIEJO:
 				clientes_viejo.globito.gotoAndStop("normal") ;
				 
				break; 
			}
			
			
		}
		
		
		private function fnGloboBienAtendido(vlnPersonaje: int):void {
						
			switch( vlnPersonaje) {
			
						
			case CLI_MORMON:
			
				//RESTELLI
				clientes_mormon.globito.gotoAndStop("bien") ;
				
				break;
	  		
			case CLI_NENA_AVION:
 				clientes_nena_avion.globito.gotoAndStop("bien")   
				
								 
				break;
			
		  	case CLI_NENA_COQUETA:
			
				clientes_coqueta.globito.gotoAndStop("bien"); 
				 
				break;
				
		 	case CLI_PUNKY:
			
 				clientes_punky.globito.gotoAndStop("bien") ;
				 
				break;
				
 		 	case CLI_VIEJA:
			
 				clientes_vieja.globito.gotoAndStop("bien") ;
 				
 				break;
		 
		 	case CLI_VIEJO:
 				clientes_viejo.globito.gotoAndStop("bien"); 
				 
				break; 
			}
			
			
		}
		
		
		private function fnGloboMalAtendido(vlnPersonaje: int):void {
			
			
			switch( vlnPersonaje) {
			
						
			case CLI_MORMON:
			
				//RESTELLI
				clientes_mormon.globito.gotoAndStop("mal");  
				
				break;
	  		
			case CLI_NENA_AVION:
 				clientes_nena_avion.globito.gotoAndStop("mal"); 
				
								 
				break;
			
		  	case CLI_NENA_COQUETA:
			
				clientes_coqueta.globito.gotoAndStop("mal");   
				 
				break;
				
		 	case CLI_PUNKY:
			
 				clientes_punky.globito.gotoAndStop("mal") ; 
				 
				break;
				
 		 	case CLI_VIEJA:
			
 				clientes_vieja.globito.gotoAndStop("mal") ; 
 				
 				break;
		 
		 	case CLI_VIEJO:
 				clientes_viejo.globito.gotoAndStop("mal") ;
				 
				break; 
			}
			
			
		}
		
		 
		
		private function fnGloboNoAtendido( vlnPersonaje: int ):void {
			
						
			switch( vlnPersonaje) {
			
						
			case CLI_MORMON:
			
				//RESTELLI
				clientes_mormon.globito.gotoAndStop("mal") ;
				
				break;
	  		
			case CLI_NENA_AVION:
 				clientes_nena_avion.globito.gotoAndStop("mal") ;
				
								 
				break;
			
		  	case CLI_NENA_COQUETA:
			
				clientes_coqueta.globito.gotoAndStop("mal") ;
				 
				break;
				
		 	case CLI_PUNKY:
			
 				clientes_punky.globito.gotoAndStop("mal") ; 
				 
				break;
				
 		 	case CLI_VIEJA:
			
 				clientes_vieja.globito.gotoAndStop("mal") ;
 				
 				break;
		 
		 	case CLI_VIEJO:
 				clientes_viejo.globito.gotoAndStop("mal") ;
				 
				break; 
			}
			
			
		}
			
		
		
		
		
		
		
		private function F_Parar_Reiniciar(event:MouseEvent):void
		{
			//Turielle 
			//control de timmers
			placa_pausa.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Parar_Reiniciar);
			
			if (_en_pausa == false)
			{
				Loader_placas.addChild(placa_pausa);
				play_pause_clip.gotoAndStop("play");
				this._en_pausa = true;
				Placa_anular_btn.visible = true;
				_timerClientes.stop();

			}
			else
			{
				play_pause_clip.gotoAndStop("stop");
				trace("reanudar");
				_en_pausa = false;
				Loader_placas.removeChild(placa_pausa);		
				Placa_anular_btn.visible = false;
				_timerClientes.start();


			}
		}
		
		  
		
	 function fnQuitarClienteMormon(evt:TimerEvent):void {
			///pasar el param
			clientes_mormon.removeEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);
			fnQuitarPersonaje( CLI_MORMON, true );
			

		}
		
		private function fnQuitarClienteNenaAvion(evt:TimerEvent):void {
			
			clientes_nena_avion.removeEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);
			fnQuitarPersonaje( CLI_NENA_AVION, true );
		}
		
		
		
		private function fnQuitarClienteNenaCoqueta(evt:TimerEvent):void {

			clientes_coqueta.removeEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);
			fnQuitarPersonaje( CLI_NENA_COQUETA, true );
		}
		
		private function fnQuitarClientePunky(evt:TimerEvent):void {

			clientes_punky.removeEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);
			fnQuitarPersonaje( CLI_PUNKY, true );
		}
		
		private function fnQuitarClienteVieja(evt:TimerEvent):void {
			
			clientes_vieja.removeEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);
			fnQuitarPersonaje( CLI_VIEJA , true);
		}
		
		private function fnQuitarClienteViejito(evt:TimerEvent):void {
			
			clientes_viejo.removeEventListener(MouseEvent.MOUSE_DOWN, F_PlacaVenta);
			fnQuitarPersonaje( CLI_VIEJO , true);

		}
		 
		
		
		

		
		
		// llamar al final del proceso de compra de productos
		private function  fnTerminarCompra( blnProductosVitrina:Boolean ):void {
                
 			
			if (_sys_ImporteCompraTemp > 0) { 
					_sys_ImporteCompraTemp = 0;
					

					
					if( blnProductosVitrina == true ) {
						
						fnDebitarImporteCostoMercaderiaVitrina();

						fnDebitarMercaderiaVitrina();

						
					} else {
					
							fnDebitarImporteCostoMercaderia();
							
	
						
							if (_sys_blnArregloCamion == true ) {
			
								 fnDebitarMercaderia();
								 mensaje_compra_realizada.gotoAndStop(2);
								  
								 
								 
								
							}else {
										  // Se debita a la semana siguiente
								  _sys_SemanaDebitarMercaderia = _sys_DiaCorriente + 1;
								 
								 //fnDebitarMercaderia();
								 //mensaje_compra_realizada.gotoAndStop(2);
							}
						
						}
					  //Debita el costo de la compra en el momento
					
					 F_colocar_indicadores();
					 
					 
				  }
				  
				  //placa compro
              }
			  
				
			private function fnDebitarImporteCostoMercaderiaVitrina():void {

  
           		for (var i:int = 0; i< _ArrayPedido.length; i++) {
					
					 
                	if(_ArrayPedido[i].cant_cajones > 0) {

					  	for (var x:int = 0; x < _ArrayMercaderia.length; x++) {

                             if( _ArrayPedido[i].producto == _ArrayMercaderia[x].producto) {
								 
								 //trace("entro aca a calcular");
								 //trace (_ArrayPedido[i].producto );
								 //trace (_sys_SaldoCapital);

                             	_sys_SaldoCapital-= _ArrayMercaderia[x].costo_kilo * _ArrayPedido[i].cant_cajones;
								
								//trace (_sys_SaldoCapital);

                              }
                         }
                     }
                 }

              }
				
				
				

			private function fnDebitarImporteCostoMercaderia():void {

  
           		for (var i:int = 0; i< _ArrayPedido.length; i++) {
					
					 
                	if(_ArrayPedido[i].cant_cajones > 0) {

					  	for (var x:int = 0; x < _ArrayMercaderia.length; x++) {

                             if( _ArrayPedido[i].producto == _ArrayMercaderia[x].producto) {
								 
								 //trace("entro aca a calcular");
								 //trace (_ArrayPedido[i].producto );
								 //trace (_sys_SaldoCapital);

                             	_sys_SaldoCapital-= _ArrayMercaderia[x].costo_kilo * (_ArrayPedido[i].cant_cajones * _sys_KilosxCajon);
								
								//trace (_sys_SaldoCapital);

                              }
                         }
                     }
                 }

              }
				

	//********************
	// Si el emprendedor compró mercadería en la granja, verifica si hay que debitar la mercadería y agregarla al stock del puesto
	// granja
	//********************

	function fnVerificarDebitoMercaderiaComprada(): void {
			
			 
			if (_sys_SemanaDebitarMercaderia == _sys_DiaCorriente  ) {
				
 				
				fnDebitarMercaderia();
				_sys_SemanaDebitarMercaderia = -1;
				
				// Placa que indica que se debitó la mercadería
				Loader_placas.addChild(mensaje_llegaron_los_productos);
				mensaje_llegaron_los_productos.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Placa);
				F_colocar_indicadores();
			}
		}								
		
		
		function F_colocar_indicadores():void{
		
			var semanadisplay: Number  = _sys_SemanaCorriente;
			reloj_clip.tiempo_dia.text = "Dia "+_sys_DiaCorriente;
			reloj_clip.tiempo_semana.text = "Semana " + semanadisplay;
			score_clip.total_score.text = _sys_PuntajeGeneral;

			
			//trace("semana corriente" + _sys_SemanaCorriente+1);
 			
			btn_popularidad.total_popularidad.text = _sys_Popularidad;
			btn_capital.total_capital.text = _sys_SaldoCapital;
			fnMostrarProductosDisponibles();
			
			
		}
			
		//Aumenta la cantidad de clientes que determinan una semana (valor de tiempo)
		private function fnActualizarClientesxSemana():void {
			
			if(( _sys_Popularidad % _sys_PuntosAumentoClientesxSemana ) == 0 ) {

				_sys_CantClientesxSemana += _sys_Popularidad / _sys_PuntosAumentoClientesxSemana;
			}
		}
		
		
		//Si corresponde sube el tiempo de espera del cliente
		private function fnVerificarTimerEspera():void{
			
			//Si llego a la cantidad de puntos que se necesitan para sumar espera..
			if(( _sys_Popularidad % _sys_PuntosAumentoEspera) == 0 ) {
				
				_sys_TiempoPacienciaCliente += (_sys_Popularidad / _sys_PuntosAumentoEspera) * _sys_SegundosAumentoEspera;
						
			}
			
		}

		
		//************************************************
		// Calcula el puntaje general 
		//
		//************************************************

		private function fnCalcPuntajeGeneral():void {
			_sys_PuntajeGeneral = Math.round(((_sys_SaldoCapital)* _sys_Popularidad)/300 + _sys_tmp_PuntajeGeneral);
			
			trace(_sys_PuntajeGeneral);
			trace(_sys_tmp_PuntajeGeneral);
			trace(_sys_DiaCorriente);
			trace(_sys_SemanaDebitarMercaderia);


			if( _sys_PuntajeGeneral < 0) {
				
				if(_sys_tmp_PuntajeGeneral>0) {
					_sys_PuntajeGeneral = _sys_tmp_PuntajeGeneral;
				}else {
					_sys_PuntajeGeneral=0;
				}
			}
			
			
		}


		
		//******************
		// TAREAS DE LA COMUNIDAD  
		//******************
   		//  
		private function fnTareasComunidad( vlngControl ):void {
			
			F_bloqueo_botones();
			addChild(placa_dialogo_donar);
			placa_dialogo_donar.y = 390;
			TweenMax.to(placa_dialogo_donar.personaje, 0.5, {x:0});		

			placa_dialogo_donar.btn_aceptar.visible = true;
			placa_dialogo_donar.btn_rechazar.visible = true;
			placa_dialogo_donar.btn_aceptar.addEventListener(MouseEvent.MOUSE_DOWN, F_Parametros_SiAceptaDonar);
			placa_dialogo_donar.btn_rechazar.addEventListener(MouseEvent.MOUSE_DOWN, F_Parametros_NoAceptaDonar);
			
			var vtxtPregunta;
			
			trace("control " + vlngControl);
			
			if ( vlngControl < 2) {
				vtxtPregunta = "Hola! El Merendero del barrio estaría necesitando una donación de alimentos. Podrás colaborar?";
				placa_dialogo_donar.txt_donar_dialogo.text = vtxtPregunta;

				
			} else {
				
				vtxtPregunta = "Hola! La Escuela del Barrio quiere incorporar fruta en la merienda. Podrás colaborar?";
				placa_dialogo_donar.txt_donar_dialogo.text = vtxtPregunta;
			}
			
			
		}

		
		private function F_Parametros_NoAceptaDonar(event:MouseEvent):void {
			F_bloqueo_botones();
			var vtxtRespuesta;
			vtxtRespuesta = "Bueno, de todas formas gracias por tu tiempo”";
			placa_dialogo_donar.txt_donar_dialogo.text = vtxtRespuesta;
			_sys_CtrlDonar+=1;
			placa_dialogo_donar.btn_aceptar.visible = false;
			placa_dialogo_donar.btn_rechazar.visible = false;
			TweenMax.to(placa_dialogo_donar.personaje, 0.5, {x:-500, delay:1, onComplete:F_Cierro_Dialogo_Donacion});		
		}
		
		
		// Aca aceptó y vamos a mostrar los productos

		private function F_Parametros_SiAceptaDonar(event:MouseEvent):void {
			
			//F_Cierro_Dialogo_Donacion();
			TweenMax.to(placa_dialogo_donar.personaje, 1, {x:-500, delay:0.5, onComplete:F_Cierro_Dialogo_Donacion});		
			Loader_placas.addChild(placa_dona_frutas);
            placa_dona_frutas.no_te_da_el_stock.visible = false;
							
					// RESTELLI - Cargar Fruta en la placa 
					placa_dona_frutas.txt_kilos_puesto_bananas.text =  "BANANAS = " + _ArrayMercaderia[BANANAS].cant_kilos +"KG";
					placa_dona_frutas.txt_kilos_puesto_limones.text =  "LIMONES = " + _ArrayMercaderia[LIMONES].cant_kilos +"KG";
					placa_dona_frutas.txt_kilos_puesto_manzanas.text = "MANZANAS = " + _ArrayMercaderia[MANZANAS].cant_kilos +"KG";
					placa_dona_frutas.txt_kilos_puesto_naranjas.text = "NARANJAS = " + _ArrayMercaderia[NARANJAS].cant_kilos +"KG";
					placa_dona_frutas.txt_kilos_puesto_berenjenas.text = "BERENJENAS = " + _ArrayMercaderia[BERENJENAS].cant_kilos +"KG";
					placa_dona_frutas.txt_kilos_puesto_cebollas.text = "CEBOLLAS = " + _ArrayMercaderia[CEBOLLAS].cant_kilos +"KG";
					placa_dona_frutas.txt_kilos_puesto_tomates.text = "TOMATES = " + _ArrayMercaderia[TOMATES].cant_kilos +"KG";
					placa_dona_frutas.txt_kilos_puesto_zapallitos.text = "ZAPALLITOS = " + _ArrayMercaderia[ZAPALLITOS].cant_kilos +"KG";
					placa_dona_frutas.txt_kilos_puesto_papas.text = "PAPAS = " + _ArrayMercaderia[PAPAS].cant_kilos +"KG";
					
					placa_dona_frutas.btn_donar.addEventListener(MouseEvent.MOUSE_DOWN, F_Parametros_Donacion);
					F_bloqueo_botones();			
		}

		private function F_Parametros_Realizo_Donacion( ):void {
			
			F_bloqueo_botones();
			addChild(placa_dialogo_donar);
			placa_dialogo_donar.y = 390;

			var vtxtRespuesta;
			vtxtRespuesta = "“¡Muchísimas gracias!";
			placa_dialogo_donar.txt_donar_dialogo.text = vtxtRespuesta;
			placa_dialogo_donar.btn_aceptar.visible = false;
			placa_dialogo_donar.btn_rechazar.visible = false;

			TweenMax.to(placa_dialogo_donar.personaje, 0.5, {x:-500, delay:1, onComplete:F_Cierro_Dialogo_Donacion});		
			fnMostrarProductosDisponibles();
		}

		private function F_Parametros_Donacion(event:MouseEvent):void
		{
 			var vlngKilos:Number;
			var blnHayStock:Boolean = true;
			var blnDonacionOk:Boolean= false;
 
 
 				placa_dona_frutas.no_te_da_el_stock.visible = false;

				vlngKilos = Number(placa_dona_frutas.txt_compra_C_bananas.text);
				if(vlngKilos > 0 && blnHayStock == true) {
						blnHayStock = fnAlcanzaElStock(BANANAS,vlngKilos); 
						blnDonacionOk =true;
						
				}
						
				vlngKilos = Number(placa_dona_frutas.txt_compra_C_limones.text);
				if(vlngKilos > 0 && blnHayStock == true) {
						blnDonacionOk =true;
						blnHayStock = fnAlcanzaElStock(LIMONES,vlngKilos);
				}
	
				vlngKilos = Number(placa_dona_frutas.txt_compra_C_manzanas.text);
				if(vlngKilos > 0 && blnHayStock == true) {
						blnHayStock = fnAlcanzaElStock(MANZANAS,vlngKilos);		
						blnDonacionOk =true;
				}
	
				vlngKilos = Number(placa_dona_frutas.txt_compra_C_naranjas.text);
				if(vlngKilos > 0 && blnHayStock == true) {
						blnHayStock = fnAlcanzaElStock(NARANJAS,vlngKilos);
						blnDonacionOk =true;
				}
						
				vlngKilos = Number(placa_dona_frutas.txt_compra_C_berenjenas.text);
				if(vlngKilos > 0 && blnHayStock == true) {
						blnHayStock = fnAlcanzaElStock(BERENJENAS,vlngKilos);
						blnDonacionOk =true;
				}
				
				vlngKilos = Number(placa_dona_frutas.txt_compra_C_cebollas.text);
				if(vlngKilos > 0 && blnHayStock == true) {
						blnHayStock = fnAlcanzaElStock(CEBOLLAS,vlngKilos);
						blnDonacionOk =true;
				}
				
				
				vlngKilos = Number(placa_dona_frutas.txt_compra_C_tomates.text);
				if(vlngKilos > 0 && blnHayStock == true) {
						blnHayStock = fnAlcanzaElStock(TOMATES,vlngKilos);
						blnDonacionOk =true;
				}
				
				vlngKilos = Number(placa_dona_frutas.txt_compra_C_zapallitos.text);
				if(vlngKilos > 0 && blnHayStock == true) {
						blnHayStock = fnAlcanzaElStock(ZAPALLITOS,vlngKilos);	
						blnDonacionOk =true;

				}
				
				vlngKilos = Number(placa_dona_frutas.txt_compra_C_papas.text);
				if(vlngKilos > 0 && blnHayStock == true) {
						blnHayStock = fnAlcanzaElStock(PAPAS,vlngKilos);		
						blnDonacionOk =true;

				}
				
				if (blnHayStock == false) {
					
					placa_dona_frutas.no_te_da_el_stock.visible = true;
 
				} else {
					
						vlngKilos = Number(placa_dona_frutas.txt_compra_C_bananas.text);
						if(vlngKilos > 0) {
								fnDonarMercaderia(BANANAS,vlngKilos);
						}
						
						vlngKilos = Number(placa_dona_frutas.txt_compra_C_limones.text);
						if(vlngKilos > 0) {
								fnDonarMercaderia(LIMONES,vlngKilos);
						}
			
						vlngKilos = Number(placa_dona_frutas.txt_compra_C_manzanas.text);
						if(vlngKilos > 0) {
								fnDonarMercaderia(MANZANAS,vlngKilos);		
						}
						
						vlngKilos = Number(placa_dona_frutas.txt_compra_C_naranjas.text);
						if(vlngKilos > 0) {
								fnDonarMercaderia(NARANJAS,vlngKilos);
						}
								
						vlngKilos = Number(placa_dona_frutas.txt_compra_C_berenjenas.text);
						if(vlngKilos > 0) {
								fnDonarMercaderia(BERENJENAS,vlngKilos);
						}
						
						//RESTELLI
						vlngKilos = Number(placa_dona_frutas.txt_compra_C_cebollas.text);
						if(vlngKilos > 0) {
								fnDonarMercaderia(CEBOLLAS,vlngKilos);
						}
						
						vlngKilos = Number(placa_dona_frutas.txt_compra_C_tomates.text);
						if(vlngKilos > 0) {
								fnDonarMercaderia(TOMATES,vlngKilos);	
						}
						
						vlngKilos = Number(placa_dona_frutas.txt_compra_C_zapallitos.text);
						if(vlngKilos > 0) {
								fnDonarMercaderia(ZAPALLITOS,vlngKilos);	
						}
						
						vlngKilos = Number(placa_dona_frutas.txt_compra_C_papas.text);
						if(vlngKilos > 0) {
								fnDonarMercaderia(PAPAS,vlngKilos);		
						}
				}
				
				if( blnHayStock == true && blnDonacionOk == true ){
					
					_sys_CtrlDonar+=2;

					F_Parametros_Realizo_Donacion(); ///mensaje de gracias 
					Loader_placas.removeChild(placa_dona_frutas);

				}
				
		}
	 
	 
	 
	  private function fnAlcanzaElStock( idxProducto: int, vlngKilos: Number): Boolean {
			var retorno:Boolean=true; 
			
			 
			if( _ArrayMercaderia[idxProducto].cant_kilos - vlngKilos < 0) {
				
				retorno = false;
			}
			
			return retorno;
			
		}


	  public function fnDonarMercaderia( idxProducto: int, vlngKilos: Number): void {
			var retorno:Boolean=true; 
			
			//rebajamos el stock
			_ArrayMercaderia[idxProducto].cant_kilos -= vlngKilos
			
			fnSumarPopularidad( vlngKilos * _sys_PuntosDonacion );
			
		}

		
		//Para ser llamado cuando se hace el pedido x parte del cliente
		private function fnMostrarProductosDisponibles():void {
			
			//recorrer Array de productos
			var cant_cajones:Number;
			
			for (var i:int = 0; i< _ArrayMercaderia.length; i++) {
				
				//if(vstrProducto == _ArrayMercaderia[i].producto){
					
					if(_ArrayMercaderia[i].cant_kilos > 0 ) {
						
						//Mostrar producto
						
						
						if(_ArrayMercaderia[i].tipo == "V") {
							cant_cajones = _ArrayMercaderia[i].cant_kilos;  //usamos este campo como si fuesen unidades
						}else {
						
							cant_cajones = _ArrayMercaderia[i].cant_kilos / _sys_KilosxCajon;
						}
						
						
						if(cant_cajones <= 1) {
							cant_cajones = 1; 
							
						} else {
								if (cant_cajones <= 2) {
									cant_cajones = 2;
								} else {
									cant_cajones = 3;
								}
						}
						
						//trace("verifica stock");
						//trace( _ArrayMercaderia[i].producto);
						//trace(_ArrayMercaderia[i].cant_kilos);
						//trace( cant_cajones);
						
						
						
						switch (_ArrayMercaderia[i].producto) {
							case "bananas":
							  	  //muestro bananas
								  C_banana1.visible = true;
								  C_banana2.visible = false;
								  
								  if (cant_cajones >= 2) {
								  	C_banana2.visible = true;
								  }
								  
							   break;
							case "manzanas":
								  C_manzana1.visible = true;
								  C_manzana2.visible = false;

								  
								  if (cant_cajones >= 2) {
								  	C_manzana2.visible = true;
								  }
								
								break;
							case "naranjas":
								  C_naranja1.visible = true;
								  C_naranja2.visible = false;
								  
								  if (cant_cajones >= 2) {
								  	C_naranja2.visible = true;
								  }
								  
								break;	
							case "limones":
								  C_limon1.visible = true;
								  C_limon2.visible = false;

									
								  if (cant_cajones >= 2) {
								  	C_limon2.visible = true;
								  }
								  
								break;	
							case "berenjenas":
								  C_berenjena1.visible = true;
								  C_berenjena2.visible = false;

								  
								  if (cant_cajones >= 2) {
								  	C_berenjena2.visible = true;
								  }
								 
								break;	
							case "cebollas":
								  C_cebolla1.visible = true;
								  C_cebolla2.visible = true;
								break;
							case "papas":
								  C_papa1.visible = true; 
								  C_papa2.visible = false;

								  if (cant_cajones >= 2) {
								  	C_papa2.visible = true;
								  }
								break;
							case "zapallitos":
								  C_zapallito1.visible = true;
								  C_zapallito2.visible = false;
								  if (cant_cajones >= 2) {
								  	C_zapallito2.visible = true;
								  }
								break;
							case "tomates":
								  C_tomates1.visible = true;
								  C_tomates2.visible = false;
								  if (cant_cajones >= 2) {
								  	C_tomates2.visible = true;
								  }
								break;	
							
							// NRESTELLI agregar graficos de vitrina
							case "miel":
								  vitrina.miel1.visible = true;
								  vitrina.miel2.visible  = false;
								  if (cant_cajones >= 2) {
								  vitrina.miel2.visible  = true;
								  }
								break;	
								
								
							case "aceitunas":
								  vitrina.aceitunas1.visible = true;
								  vitrina.aceitunas2.visible = false;
								  if (cant_cajones >= 2) {
								  vitrina.aceitunas2.visible = true;
								  }
								break;	
								
							case "dulces":
								  vitrina.dulces1.visible = true;
								  vitrina.dulces2.visible = false;
								  if (cant_cajones >= 2) {
								  vitrina.dulces2.visible = true;
								  }
								break;	
							
							case "especias":
								  vitrina.especias1.visible = true;
								  vitrina.especias2.visible = false;
								  if (cant_cajones >= 2) {
								  vitrina.especias2.visible = true;
								  }
								break;	
								
							}
										
						
 					}else{
						
						switch (_ArrayMercaderia[i].producto) {
							case "bananas":
								  C_banana1.visible = false;
								  C_banana2.visible = false;
							   break;
							case "manzanas":
								  C_manzana1.visible = false;
								  C_manzana2.visible = false;
								break;
							case "naranjas":
								  C_naranja1.visible = false;
								  C_naranja2.visible = false;
								break;	
							case "limones":
								  C_limon1.visible = false;
								  C_limon2.visible = false;
								break;	
							case "berenjenas":
								  C_berenjena1.visible = false;
								  C_berenjena2.visible = false;
								break;	
							case "cebollas":
								  C_cebolla1.visible = false;
								  C_cebolla2.visible = false;
								break;
							case "papas":
								  C_papa1.visible = false;
								  C_papa2.visible = false;
								break;
							case "zapallitos":
								  C_zapallito1.visible = false;
								  C_zapallito2.visible = false;
								break;
							case "tomates":
								  C_tomates1.visible = false;
								  C_tomates2.visible = false;
								break;		
								
								
							case "miel":
								  vitrina.miel1.visible = false;
								  vitrina.miel2.visible = false;  
								break;	
								
							case "aceitunas":
								  vitrina.aceitunas1.visible = false;
								  vitrina.aceitunas2.visible = false;  
								  
								break;	
								
							case "dulces":
								  vitrina.dulces1.visible = false;
								  vitrina.dulces2.visible = false;  
								  
								break;	
							
							case "especias":
								  vitrina.especias1.visible = false;
								  vitrina.especias2.visible = false;  
								break;		
																
					}					
				}
					
			}
				
		}
		 
		
		
		
		
		//producto y cantidad de cajones
		 public function fnComprarProducto( vstrProducto: String, vlngCajones: Number):void {
			 
  			for (var i:int = 0; i< _ArrayMercaderia.length; i++) {

				if( vstrProducto.toUpperCase() == _ArrayMercaderia[i].producto.toUpperCase()){
					
					_sys_ImporteCompraTemp += _ArrayMercaderia[i].costo_kilo * (vlngCajones * _sys_KilosxCajon);
					
					//Verificamos si le da la plata
					//trace( "va gastando : " + _sys_ImporteCompraTemp);
					
					if( ( _sys_SaldoCapital - _sys_ImporteCompraTemp < 0) || (_sys_SaldoCapital- (_ArrayMercaderia[i].costo_kilo * (vlngCajones * _sys_KilosxCajon)) < 0) )
					
					{
						
						//trace(" no le da la plata ");
						
						fnLimpiarPedido();
						
						//RESTELLI
						//placa_dona_frutas.no_te_da_la_plata.visible = true;
						
					 
					}else{
					
						//agregamos al array de pedidos
						
						for (var x:int = 0; x< _ArrayPedido.length; x++) {
							
							if( _ArrayPedido[x].producto.toUpperCase() == vstrProducto.toUpperCase()){
								
								_ArrayPedido[x].cant_cajones = vlngCajones;
								
 
								
							}
							
						}
						//Agregamos al stock 
					}
				}
			}
			
		}
		
		
		//producto y cantidad de productos vitrina
		 public function fnComprarProductoVitrina( vstrProducto: String, vlngCantidad: Number):void {
			 
			
	
  			for (var i:int = 0; i< _ArrayMercaderia.length; i++) {

				if( vstrProducto.toUpperCase() == _ArrayMercaderia[i].producto.toUpperCase()){
					
					_sys_ImporteCompraTemp += _ArrayMercaderia[i].costo_kilo * vlngCantidad;  
					
					//Verificamos si le da la plata
					//trace( "va gastando : " + _sys_ImporteCompraTemp);
					
					if( ( _sys_SaldoCapital - _sys_ImporteCompraTemp < 0) || (_sys_SaldoCapital- (_ArrayMercaderia[i].costo_kilo * vlngCantidad) < 0) )
					
					{
						
						//trace(" no le da la plata ");
						
						fnLimpiarPedido();
						
						//RESTELLI
						//placa_dona_frutas.no_te_da_la_plata.visible = true;
						
					 
					}else{
					
						//agregamos al array de pedidos
						
						for (var x:int = 0; x< _ArrayPedido.length; x++) {
							
							if( _ArrayPedido[x].producto.toUpperCase() == vstrProducto.toUpperCase()){
								
								_ArrayPedido[x].cant_cajones = vlngCantidad;
								
											 //trace("estoy comprando" + vstrProducto + " cant " + vlngCantidad);

								
							}
							
						}
						//Agregamos al stock 
					}
				}
			}
			
		}
		
		
		
		
		//Limpiamos las variables de pedido de mercadería para volver a iniciar
		function fnLimpiarPedido():void {
			
			
			fnLimpiarCamposPedido();
			for (var x:int = 0; x< _ArrayPedido.length; x++) {
								
				_sys_ImporteCompraTemp=0;
				_ArrayPedido[x].cant_cajones = 0;
								
			}
			
		}
		
		
		//Limpiamos las variables de pedido de mercadería para volver a iniciar
		function fnLimpiarCamposPedido():void {
			
			placa_compra_frutas.txt_calcular_gastando.text = "";
			 
			_sys_ImporteCompraTemp=0;
								
			
			placa_compra_frutas.txt_compra_C_bananas.text="";
 			placa_compra_frutas.txt_compra_C_limones.text="";
 			placa_compra_frutas.txt_compra_C_manzanas.text="";
 			placa_compra_frutas.txt_compra_C_naranjas.text="";
 			placa_compra_frutas.txt_compra_C_berenjenas.text="";
 			placa_compra_frutas.txt_compra_C_cebollas.text="";
 			placa_compra_frutas.txt_compra_C_tomates.text="";
 			placa_compra_frutas.txt_compra_C_zapallitos.text="";
 			placa_compra_frutas.txt_compra_C_papas.text="";	
			
		}
		


		private function fnDebitarMercaderia():void {
			// Placa que indica que se debitó la mercadería
				Loader_placas.addChild(mensaje_llegaron_los_productos);
				mensaje_llegaron_los_productos.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Placa);
				F_colocar_indicadores();
			for (var i:int = 0; i< _ArrayPedido.length; i++) {
								
				//si se pidió esta mercadería
				if(_ArrayPedido[i].cant_cajones > 0) {
					
					for (var x:int = 0; x< _ArrayMercaderia.length; x++) {

						if( _ArrayPedido[i].producto == _ArrayMercaderia[x].producto) {
							
							//agregamos al stock
							_ArrayMercaderia[x].cant_kilos += (_ArrayPedido[i].cant_cajones * _sys_KilosxCajon )
							
							//Restamos al capital
							// _sys_SaldoCapital-= _ArrayMercaderia[x].costo_kilo * (_ArrayPedido[i].cant_cajones * _sys_KilosxCajon); 

							//limpiamos el array de pedidos
							_ArrayPedido[i].cant_cajones = 0;
							
							
						}
					}				
				}
			}
			fnMostrarProductosDisponibles();
			F_habilitar_BotonCompraFrutas(true);
			
		}
		 
		 
		 private function fnDebitarMercaderiaVitrina():void {
			
			for (var i:int = 0; i< _ArrayPedido.length; i++) {
								
				//si se pidió esta mercadería
				if(_ArrayPedido[i].cant_cajones > 0) {
					
					for (var x:int = 0; x< _ArrayMercaderia.length; x++) {

						if( _ArrayPedido[i].producto == _ArrayMercaderia[x].producto) {
							
							//agregamos al stock
							_ArrayMercaderia[x].cant_kilos += _ArrayPedido[i].cant_cajones; 
							
							//Restamos al capital
							// _sys_SaldoCapital-= _ArrayMercaderia[x].costo_kilo * (_ArrayPedido[i].cant_cajones * _sys_KilosxCajon); 

							//limpiamos el array de pedidos
							_ArrayPedido[i].cant_cajones = 0;
							
							
						}
					}				
				}
			}
			fnMostrarProductosDisponibles();
			F_habilitar_BotonCompraFrutas(true);
			
		}
		 
		 
		 		 
		 function F_habilitar_BotonCompraFrutas ( blnHabilitar: Boolean ):void {
			 
			 if( blnHabilitar == true ) {
				 
				
				 placa_compra_frutas.candado.visible = false;
				 placa_compra_frutas.candado_calcular.visible = false;
				 TweenMax.to(placa_compra_frutas.btn_calcular, 1, {tint:null});
				 TweenMax.to(placa_compra_frutas.btn_compra_productos, 1, {tint:null});
 				  placa_compra_frutas.btn_compra_productos.mouseEnabled = true;
				  placa_compra_frutas.btn_calcular.mouseEnabled = true;


				 
			 } else {
				 
				 placa_compra_frutas.candado.visible = true;
				 placa_compra_frutas.candado_calcular.visible = true;
				 TweenMax.to(placa_compra_frutas.btn_calcular, 1, {tint:color_btn_deshabilitado});
				 TweenMax.to(placa_compra_frutas.btn_compra_productos, 1, {tint:color_btn_deshabilitado});
				 placa_compra_frutas.btn_calcular.mouseEnabled = false;
				  placa_compra_frutas.btn_compra_productos.mouseEnabled = false;

			 
			 }
		 }
		 
		
		
		 
  
		
		
		private function fnMiniJuegoCalculo():void {
			
			// disparar minijuego 2
			

			

			// placa sugerir vitrina y 
			
			if (_sys_blnSugerirVitrina == true) {
			
				fnVitrina_Sugerida();
				_sys_blnSugerirVitrina = false;
			}
			// descontar costo del camion y vitrina del Saldo
 			
			 

		}
		
		private function fnVitrina_Sugerida():void {
			
			// habilito compra de vitrina
			Loader_placas.addChild(placa_vitrina_sugerida);
			TweenMax.to(placa_compra_varios.compra_varios_scrool.btn_compra_vitrina, 1, {tint:null});
			placa_compra_varios.compra_varios_scrool.btn_compra_vitrina.mouseEnabled = true;
			placa_compra_varios.compra_varios_scrool.btn_compra_vitrina.addEventListener(MouseEvent.MOUSE_DOWN, F_Pramteros_compravarios);
			placa_compra_varios.compra_varios_scrool.candado_vitrina.visible = false;
			
			F_bloqueo_botones();
			placa_vitrina_sugerida.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Placa);

		}
		
		private function fnPagarGastosIni():void {
			
			_sys_vblnPagarFijosIni = true;
			 call_PlacaCapital(true);
			 
			// placa pago de gastos
			// calcular si puede pagar
			// descontar importe del saldo
 
			
		}
		
		
		private function fnPagarGastosFin():void {
			
			_sys_vblnPagarFijosFin = true;
			 call_PlacaCapital(true);
			 
			// placa pago de gastos
			// calcular si puede pagar
			// descontar importe del saldo
			// si puede pagar, mostrar saldo final
			// terminar juego
 
			
		}

		
		
		private function fnJuegoRecoleccion():void {
			
			trace("aca levantaria el juego recoleccion");
			
			//Mini juego RESTELLI
			
			// si el usuario juega, aumentar popularidad
			// _sys_Popularidad+= _UnidadPopularidad;
 			
			fnSumarPopularidad( _sys_PuntosMiniJuego );
		}
		
		
		
		private function fnArregloCamion():void {
			
			// bajar costo del arreglo del Saldo de la Cuenta
			
			for (var i:int = 0; i< _ArrayMateriales.length; i++) {
				
				if( _ArrayMateriales[i].material == "arreglo_camion") {
					
					_sys_SaldoCapital -= _ArrayMateriales[i].costo;
					
				}
			}

			
			//Bajar costos de la mercadería
			
			fnBajarCostosMercaderia( _sys_PorcentajeRebajaCostosArregloCamion );
			
			_sys_blnArregloCamion = true;
			
			F_colocar_indicadores();
			
 			
		}
		
		
		private function retCantKilos(): Number {
			var cantKilos:Number = Math.round(Math.random() * (_sys_PromedioKilosxCliente - 0.5) + 0.5)
			return cantKilos;
		}
		
		
		private function F_Contratar_Ayudante(event:MouseEvent):void {
					
			// Si contrata ayudante
			
 				placa_ayudante_contratar.btn_contratar.removeEventListener(MouseEvent.CLICK, F_Contratar_Ayudante); 
				placa_ayudante_contratar.btn_contratar.mouseEnabled = false;
				placa_ayudante_contratar.candado.visible = true;
				TweenMax.to(placa_ayudante_contratar.btn_contratar, 0.5, {tint:color_btn_deshabilitado});				
			
				_sys_blnAyudanteContratado = true;
				_sys_blnEsperaClientes = true;
				loader_clientes.addChild(asistente);
				asistente.x = 170;
				asistente.y = 400;
				_sys_blnHabilitarAyudante = false;
				
				//Bajar costos
				
				fnBajarCostosMercaderia( _sys_PorcentajeRebajaCostosEmpleado );
				F_colocar_indicadores();
			
 			
		}
		
		
		//Baja los costos de toda Mercadería
		private function fnBajarCostosMercaderia( _PorcentajeRebaja ):void{
			var vTasaRebaja = (100 - _PorcentajeRebaja)/100;
			
			for (var i:int = 0; i< _ArrayMercaderia.length; i++) {
				
				_ArrayMercaderia[i].costo_kilo = _ArrayMercaderia[i].costo_kilo * vTasaRebaja; 
				
			}
			
		}
		
		
		//******************
		// PERSONAJE MALO 
		//******************
   		
		private function fnPersonajeMalo():void {
 			var ix:int;
			var intentos:int=1;
			
			_xmalo_cantCajones = (Math.floor(Math.random() * (3 - 1 )) + 1);
			
			ix = (Math.floor(Math.random() * (_ArrayMercaderia.length )) + 0);
				
			_xmalo_producto = _ArrayMercaderia[ix].producto;
			_xmalo_precio1 = _ArrayMercaderia[ix].costo_kilo * _sys_KilosxCajon * 0.7;
			_xmalo_precio2 = _ArrayMercaderia[ix].costo_kilo * _sys_KilosxCajon * 0.5;
			

			F_bloqueo_botones();
			Loader_dialogo.addChildAt(placa_compra_malo,0);
			TweenMax.to(placa_compra_malo.personaje, 0.5, {x:0});		
			placa_compra_malo.btn_aceptar.visible = true;
			placa_compra_malo.btn_rechazar.visible = true;
			placa_compra_malo.btn_aceptar.addEventListener(MouseEvent.MOUSE_DOWN, fnPersonajeMaloSiAcepta);
			placa_compra_malo.btn_rechazar.addEventListener(MouseEvent.MOUSE_DOWN, fnPersonajeMaloNoAcepta1);
					
			_xmalo_precio = _xmalo_precio1;
 			placa_compra_malo.txt_malo_dialogo.text = "¡Hola estimado negociante! hoy le traigo una oferta única: " + _xmalo_cantCajones + " cajones de " + _xmalo_producto + " ¡por la módica suma de " + _xmalo_precio1 + " pesos!";

 			
		}
		
		//Si no acepta suma popularidad
 		
		
		private function fnPersonajeMaloNoAcepta1(event:MouseEvent):void {
			F_bloqueo_botones();
			_xmalo_precio = _xmalo_precio2;
 			placa_compra_malo.btn_rechazar.addEventListener(MouseEvent.MOUSE_DOWN, fnPersonajeMaloNoAcepta2);
			placa_compra_malo.txt_malo_dialogo.text = "Ah no estás convencido, que tal si te lo ofrezco a " + Math.round(_xmalo_precio2) + " pesos!";


 		}
		
		
		
		
		private function fnPersonajeMaloNoAcepta2(event:MouseEvent):void {
			
			F_bloqueo_botones();
			placa_compra_malo.btn_aceptar.visible = false;
			placa_compra_malo.btn_rechazar.visible = false;
			fnSumarPopularidad( _sys_PuntosComunidad );
			placa_compra_malo.txt_malo_dialogo.text = "Vos te lo perdés, ¡Chau!";
			TweenMax.to(placa_compra_malo.personaje, 0.5, {x:-500, delay:2, onComplete:F_Cierro_Dialogo_Varios});		

			F_colocar_indicadores();

		}
		
		
		private function fnPersonajeMaloSiAcepta(event:MouseEvent):void {
			 
 			
			F_bloqueo_botones();
			_timerCliente_enfermo.addEventListener(TimerEvent.TIMER, fnClienteEnfermoProductoMalo); 
			_timerCliente_enfermo.start();

			placa_compra_malo.btn_aceptar.visible = false;
			placa_compra_malo.btn_rechazar.visible = false;
			
			fnComprarProductoMalo( _xmalo_producto, _xmalo_cantCajones, _xmalo_precio);
			placa_compra_malo.txt_malo_dialogo.text = "Muchas gracias, ¡estarías loco de no comprar a ese precio!\nPero habrá que venderlos rápido... están un poco pasaditos...";
			TweenMax.to(placa_compra_malo.personaje, 0.5, {x:-500, delay:2, onComplete:F_Cierro_Dialogo_Varios});		
			F_colocar_indicadores();

		}



		 public function fnComprarProductoMalo( vstrProducto: String, vlngCantCajones: Number, vdblCostoCajon:Number ):void {
			 
  			for (var i:int = 0; i< _ArrayMercaderia.length; i++) {

				if( vstrProducto.toUpperCase() == _ArrayMercaderia[i].producto.toUpperCase()){
					
					_ArrayMercaderia[i].cant_kilos += ( _sys_KilosxCajon * vlngCantCajones );
					_sys_SaldoCapital -= (vdblCostoCajon * vlngCantCajones);
					
				}
			}
		 }
						 
		 
		private function fnClienteEnfermoProductoMalo(evt:TimerEvent):void {

			// Colocar placa del cliente enfermo
			F_bloqueo_botones();
			addChild(placa_dialogo_mal_estado);
			placa_dialogo_mal_estado.y = 399;
			placa_dialogo_mal_estado.btn_cerrar.addEventListener(MouseEvent.MOUSE_DOWN, F_Cierro_Dialogo_Enfermo);

			var vtxt_mal_estado;
			vtxt_mal_estado = "Vengo a decirle que las productos que le compre estaban todos en mal estado.¡Que asco!";
			placa_dialogo_mal_estado.txt_mal_estado_dialogo.text = vtxt_mal_estado;
			
			_timerCliente_enfermo.stop();
			
			fnRestarPopularidad( _sys_PuntosComunidad );
			
			F_colocar_indicadores();
			
			
			// Si tiene menos de 300 puntos alerta
			
		}
		private function F_Cierro_Dialogo_Enfermo(event:MouseEvent):void
		{				
			F_habilito_botones();
			removeChild(placa_dialogo_mal_estado);
			
		}
		
		
		private function fnSumarPopularidad(valor:Number):void {
			_sys_Popularidad += valor;
			
			
			if( _sys_Popularidad % _sys_RelacionPopularidadCantClientes == 0) {
			   
				//Si aumenta la popularidad aumenta la cantidad máxima de clientes concurrentes
				if(_sys_CantMaxClientes < CONST_TOPE_CLIENTES) {
					_sys_CantMaxClientes++;
					
				}
			}
			
		}
		
		
		
		private function fnRestarPopularidad( valor:Number ):void {
			_sys_Popularidad -= valor;
			
			//Si disminuye la popularidad baja la cantidad de clientes
			if(_sys_CantMaxClientes > 2) {
				_sys_CantMaxClientes--;
			}
		}
		
		
		private function AgregarSaldoCapital( vImporte:Number ):void {
			_sys_SaldoCapital += vImporte;
		}
		
		private function QuitarSaldoCapital( vImporte:Number ):void {
			_sys_SaldoCapital -= vImporte;
		}
		
		
		
		
		
		private function AddIntentos():void {
			intentos++;
		}
		
		private function ObtIntentos():int {
			
			return intentos;
		}
		
		private function ClearIntentos():void {
			
			intentos=0;
		}
		
		
		
		function fnObtCantPedir():int {
          var pedidos:int;

           for (var i:int = 0; i < _ArrayMercaderia.length; i++) {
                if(_ArrayMercaderia[i].cant_kilos > 0) {

                   pedidos++;
                }
            }
             return Math.min(pedidos, CONST_TOPE_PEDIDO);

        }
		
		   
		// verifica si ese producto todavía no se pidió y si tiene stock
		private function fnProductoOk( vstrProductoPedido: String, vlngCantidadStock:Number, _ArrayPedidoCliente:Array ):Boolean {
			var ok:Boolean= true;
			 
			
			for (var i:int=0 ; i<_ArrayPedidoCliente.length; i++) {
				
				//ya estaba cargado el producto
				if( _ArrayPedidoCliente[i].producto == vstrProductoPedido) {
					ok = false;
					
				}
			}
			if ( ok == true) {
				
				if (vlngCantidadStock <= 0) {
					ok = false;
				}
				
				
			}
			
			return ok;
		}
		private function F_Gano():void {
				addChild(placa_gano);
				//// IENBA agregar la funcion de personaje elejido al principio
				placa_gano.personaje_elejido.gotoAndStop(PlayerBase);
					
				}
		
		private function F_Perdio():void {
				addChild(placa_perdio);
				placa_perdio.btn_jugar.addEventListener(MouseEvent.MOUSE_DOWN, F_Reiniciar);
				placa_perdio.btn_salir.addEventListener(MouseEvent.MOUSE_DOWN, F_Salir);
				}
				
		private function F_Perdio_x_popularidad(event:MouseEvent):void{
				Loader_placas.removeChild(mensaje_perdiste_x_popularidad);
				F_Perdio();
				}		
		
		
		
		private function F_Reiniciar(event:MouseEvent):void{
			// IENBA vovler a cargar el swf en el loader madre, para borrar todo
			trace("recarga el swf");
			//init();
			//init2();
			
		}
		
		private function F_Salir(event:MouseEvent):void{
			/// que pasa si le das al btn salir?
			///IENBA
		}
		
	}
	
}