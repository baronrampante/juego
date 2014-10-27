package 
{

	public class Clientes
	{

		public var Cliente:Array = new Array("Martín","Julio","Andrea","Olga","Lucía","Gustavo");
		
		public var Banco:Array = new Array(300,4,0.25,0.5, 10, "Banco");// precio, tiempo de arreglo, alfajías, tablones,  nombre
		public var Silla:Array = new Array(300,6,0.25,0.25, 10, "Silla");// precio, tiempo de arreglo, alfajías, tablones
		public var Mesa:Array = new Array(1900,3,0.5,0.5, 10, "Mesa");// precio, tiempo de arreglo, alfajías, tablones
		public var Cama:Array = new Array(1200,3,1,1, 10, "Cama");// precio, tiempo de arreglo, alfajías, tablones, tiempo de buscar, objeto
		public var Mesa_Luz:Array = new Array(500,1,1,0.25, 10, "Mesa_Luz");// precio, tiempo de arreglo, alfajías, tablones
		public var Coso1:Array = new Array(3000,4,0.25,0.5, 10, "Banco");// precio, tiempo de arreglo, alfajías, tablones,  nombre
		public var Coso2:Array = new Array(300,4,0.25,0.25, 10, "Silla");// precio, tiempo de arreglo, alfajías, tablones
		public var Coso3:Array = new Array(1900,10,0.5,0.5, 10, "Mesa");// precio, tiempo de arreglo, alfajías, tablones
		public var Coso4:Array = new Array(300,10,1,1, 10, "Cama");// precio, tiempo de arreglo, alfajías, tablones, tiempo de buscar, objeto
		public var Coso5:Array = new Array(1000,10,1,0.25, 10, "Mesa_Luz");// precio, tiempo de arreglo, alfajías, tablones
		
		public var Objetos:Array = new Array(Coso1, Coso2, Coso3, Coso4, Coso5, Banco, Silla, Mesa, Cama, Mesa_Luz);
		
		
		
		public var TextosBanco:Array = new Array("¡Hola! Se me rompió el banco que uso para tocar piano. ¿Lo podrías arreglar?","¡Que tal?, se me rompió una pata del banco. ¡Te agradezco si lo pod{es arreglar?");
		public var TextosSilla:Array = new Array("Hola, tengo una silla que esta rota!, ¿Me la podés arreglar?","¡Que tal?, el respaldo de la silla se me rompió, lo podr{as reparar?" );
		public var TextosMesa:Array = new Array("Hola que tal? Se me rompió la mesa donde acostumbro a leer. ¿Se podrá arreglar?","¡Cómo estás, La mesa se me rompío, la estará necesitando medio urgente? ");
		public var TextosCama:Array = new Array("Hola, ayer se me rompió la parrilla de la cama","Hola, el respaldo de la cama se me rompió, ¿es posible arreglarlo?");
		public var TextosMesa_Luz:Array = new Array("¿Qué tal? el cajón de la mesita de luz no abre, ¿será difícil arreglarlo?", "Hola, se ,e partió una pata de la mesa de luz. ¿Podrá arreglarlo?");
		
		public var TextosAsesora:Array = new Array("El oficio del carpintero es el trabajo con la madera, ya sea en la construcción &#40;andamios, ventanas, puertas, etc&#41; o en la manufactura de mobiliario &#40;mesas, sillas, armarios" , 
		"El trabajo de la madera es una de las actividades de la industria humana más antiguas que existen, por lo cual en cada cultura y regiones encontraremos diferentes maneras y herramientas para trabajar este material",
		"La unidad básica de longitud es el metro. El centímetro y el kilómetro derivan del metro, y son unidades utilizadas habitualmente.El oficio del carpintero es el trabajo con la madera, ya sea en la construcción &#41;andamios, ventanas, puertas, etc.; o en la manufactura de mobiliario &#40;mesas, sillas, armarios&#41",
		"El trabajo de la madera es una de las actividades de la industria humana más antiguas que existen, por lo cual en cada cultura y regiones encontraremos diferentes maneras y herramientas para trabajar este material.",
		"La unidad básica de longitud es el metro. El centímetro y el kilómetro derivan del metro, y son unidades utilizadas habitualmente.",
		"La palabra Dinero es derivada del latín denarium, el cual era una moneda que utilizaron los romanos para realizar sus actividades comerciales.",
		"La aparición del dinero constituye uno de los grandes avances de la civilización humana en toda su historia.",
		"Desde tiempos remotos la humanidad ideó sistemas para dar valor a las cosas y poder intercambiarlas, primero se utilizó el trueque, después el intercambio y luego surgió el dinero.",
		"El pionero en utilizar billetes, fue el emperador mongol, KUBALI KHAN en el Siglo XI, para él, era el certificado de propiedad de una cantidad de monedas de oro.",
		"En Europa, en sus inicios, los billetes eran certificados sobre la existencia de un deposito de oro en un banco.",
		"Los primeros billetes oficiales se emitieron en 1694, por el Banco de Inglaterra.",
		"¿Sabias que las primeras monedas utilizadas durante miles de años en zonas de África, el Océano Indico y Oceanía eran conchas marinas?<",
		"¿Sabias que las primeras monedas utilizadas en la América precolombina y en los primeros años de la colonización fue el cacao?",
		"¿Sabías que las primeras monedas de algunas culturas de la América prehispánica fueron las plumas exóticas?",
		"¿Sabías que en las zonas desérticas del mundo la moneda utilizada era la sal? Los trabajadores recibían sal como pago por el trabajo realizado. En la antigua Roma, la sal que cobraban los empleados recibía el nombre de “salarium”.  De ahí es de donde proviene la palabra “salario”.",
		"Ya en el siglo IX d. C., durante la dinastía Tang, aparecieron los primeros bancos en los que la gente depositaba sus monedas y a cambio se le extendía un certificado por el importe depositado que servía como medio de pago. Fueron los primeros billetes.",
		"Un banco es una entidad que se dedica a trabajar con el dinero: lo reciben y lo prestan al público obteniendo una ganancia por las operaciones realizadas.",
		"Al hacer un presupuesto de nuestros gastos, considerando los ingresos y nuestras necesidades, estamos haciendo finanzas. Y aunque nos parezca extraño siempre se puede ahorrar. Por más pequeño que sea siempre nos dará una cuota de tranquilidad.",
		"Evitemos compras que no sean estrictamente necesarias, así podremos ahorrar alguna moneda, con el paso del tiempo se convertirán en billetes.",
		"Un crédito es un préstamo de dinero en el que la persona que lo recibe se compromete a devolver en el tiempo establecido y pagando intereses, seguros y&#47;o comisiones.");
	

		public var Malo:Array = new Array("Buenos dias joven emprendedor! Yo soy el magnifico vendedor ambulante, aqui para satisfacer todos necesidades empresariales!","Hoy tengo un ofertón para nuevos emprendimientos! Te doy tablones por el espectacular precio de 300 pesos. Que dice Tío?", "Ah, no estas convencidos, que tal si te los vendo a 200 pesos, si escuchaste bien tablones por solo 200 pesos, mi ultima oferta!");
		
		public var Comunidad:Array = new Array("Hola, te gustaría contribuir con la comunidad?, Necesitamos arreglar unos bancos de la Escuela? Gastarás unos pocos materiales.");

		public function Clientes()
		{
			// constructor code
		}

	}

}