package 
{

	public class Clientes_Textil
	{

		public var Cliente:Array = new Array("Martín","Julio","Andrea","Olga","Lucía","Gustavo");
		
		public var Banco:Array = new Array(300,4,0.25,0.5, 10, "Chaleco");// precio, tiempo de arreglo, alfajías, tablones,  nombre
		public var Silla:Array = new Array(300,8,0.25,0.25, 10, "Campera");// precio, tiempo de arreglo, alfajías, tablones
		public var Mesa:Array = new Array(1900,8,0.5,0.5, 10, "Buzo");// precio, tiempo de arreglo, alfajías, tablones
		public var Cama:Array = new Array(1200,4,1,1, 10, "Taburete");// precio, tiempo de arreglo, alfajías, tablones, tiempo de buscar, objeto
		public var Mesa_Luz:Array = new Array(500,4,1,0.25, 10, "Mesa_Luz");// precio, tiempo de arreglo, alfajías, tablones
		public var Coso1:Array = new Array(3000,8,1,4, 10, "Banco");// precio, tiempo de arreglo, alfajías, tablones,  nombre
		public var Coso2:Array = new Array(300,14,2,4, 10, "Silla");// precio, tiempo de arreglo, alfajías, tablones
		public var Coso3:Array = new Array(1900,18,4,4, 10, "Mesa");// precio, tiempo de arreglo, alfajías, tablones
		public var Coso4:Array = new Array(300,22,2,4, 10, "Taburete");// precio, tiempo de arreglo, alfajías, tablones, tiempo de buscar, objeto
		public var Coso5:Array = new Array(1000,12,2,3, 10, "Mesa_Luz");// precio, tiempo de arreglo, alfajías, tablones
		
		public var Objetos:Array = new Array(Coso1, Coso2, Coso3, Coso4, Coso5, Banco, Silla, Mesa, Cama, Mesa_Luz);
		
		public var Prendas:Array = new Array("Chaleco", "Campera","Buzo","Pollera","Vestido","Short");
		
		
		
		public var TextosChaleco:Array = new Array("¡Hola! Se me rompió el chaleco que uso para salir. ¿Lo podrías arreglar?","¡Hola! Se me rompió el chaleco que uso para salir. ¿Lo podrías arreglar?","¡Buenas tardes! ¿Necesito un banco bajo donde pueda apoyar mis pies mientras tejo? ¿Podría hacerlo?");
		public var TextosCampera:Array = new Array("Hola, tengo una campera que esta rota!, ¿Me la podés arreglar?","Hola, tengo una campera que esta rota!, ¿Me la podés arreglar?","¡Buenasssss! Estoy necesitando una silla, ya que un amigo se quedará en casa durante un tiempo ¿Es posible?" );
		public var TextosBuzo:Array = new Array("Hola que tal? Se me rompió el buzo donde acostumbro a usar. ¿Se podrá arreglar?","Hola que tal? Se me rompió el buzo donde acostumbro a usar. ¿Se podrá arreglar?","¿Que tal? Estoy necesitando una mesa rústica para el jardín de mi casa ¿Hacen ese tipo de piezas aquí?");
		public var TextosPollera:Array = new Array("Hola, ayer se me rompió el prenda que acostumbro usar","Hola, ayer se me rompió el prenda que acostumbro usar","¡Hola! ¡Buenas! Mirá necesito hacer un taburete alto.  ¿Podés hacerlo?");
		public var TextosShort:Array = new Array("¿Qué tal? la prenda no abre, ¿será difícil arreglarlo?", "¿Qué tal? la prenda no abre, ¿será difícil arreglarlo?","¡Hola, buenas tardes! Necesito una mesa de luz nueva, ya que la que tengo esta muy viejita. ¿Tú podrías hacerla?");
		public var TextosVestido:Array = new Array("¿Qué tal? se me rompió el cierre del vestido, ¿será difícil arreglarlo?", "¿Qué tal? la prenda no abre, ¿será difícil arreglarlo?","¡Hola, buenas tardes! Necesito una mesa de luz nueva, ya que la que tengo esta muy viejita. ¿Tú podrías hacerla?");

		
		public var TextosBronca:Array = new Array("Lo estaba necesitando, no me cumpliste!", "No cumpliste con lo prometido!","Antes de comprometerte pensá si podés cumplir","¡¡No me arreglaste la prenda que te pedi!!","¡DIJISTE QUE PODÍAS ARREGLARLO Y NO CUMPLISTE TU PALABRA!!!!","¡ME DIJISTE QUE PODÍAS HACERLO ¿Y AHORA DECÍS QUE NO?!!!!! ¡QUIERO UN REMBOLSO");
		
		public var TextosAsesora:Array = new Array(
		
		
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
	

		public var Malo:Array = new Array("Buenos dias joven emprendedor! Yo soy el magnifico vendedor ambulante, aqui para satisfacer todos necesidades empresariales!","Hoy tengo un ofertón para nuevos emprendimientos! Te doy tablones por el espectacular precio de 300 pesos. Que dice Tío?", "Ah, no estas convencidos, que tal si te los vendo a 200 pesos, si escuchaste bien, por solo 200 pesos, mi ultima oferta!", "Hoy tengo un ofertón para nuevos emprendimientos! Te doy telas por el espectacular precio de 300 pesos. Que dice Tío?");
		
		public var Comunidad:Array = new Array("Hola, te gustaría contribuir con la comunidad?, Necesitamos arreglar unas cortinas de la Escuela? Gastarás unos pocos materiales. Son 2 telas y 5 rollos de hilos");

		public function Clientes()
		{
			// constructor code
		}

	}

}