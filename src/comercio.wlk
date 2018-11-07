import sucursales.*
/*c */
class Comercio {
	var pedidos 
	var sucursales
	var listaDeTalles = new Range (32,48)
	
	/*me dijeron que da lo mismo quien recibe el pedido, si la sucursal o el comercio así que lo puse acá */
	/*1 */
	method registrarPedido(unPedido) {pedidos.add(unPedido)}
	
	/*2 */
	method totalFacturado() = sucursales.sum({pedido => pedido.precioDePedido()})
	
	/*3 */
	method totalFacturadoPor(unaSucursal) = unaSucursal.sum({pedido => pedido.pedidosRegistrados().precioDePedido()})
	
	/*4 
	 *nota: el color de la remera es un booleano (si no "esDeColor" = blanco, gris o negro)
	 * por lo tanto el parametro tambien lo es*/
	method pedidosPor(unColor) = pedidos.size({pedido => unColor == pedidos.remeraDePedido().esDeColor()})
	
	/*5 */
	method pedidoMasCaro() = pedidos.max({pedido=> pedido.precioPorPedido()})
	
	/*6 */
	method mapeoDeTalles() = pedidos.map({pedidos.remeraDePedido().talle()})
	
	method tallesNoPedidos() = 	listaDeTalles.filter({pedido => not pedido.contains({self.mapeoDeTalles()})})
	
	/*7 */
	method sucursalQueMasFacturo() = sucursales.max({sucursal => self.totalFacturadoPor(sucursal)})
	
	/*8 */
	method mapeoDeTallesPor(unaSucursal) = unaSucursal.pedidosRegistrados().map({self.mapeoDeTalles()})
	
	method vendioTodosLosTalles() = listaDeTalles.all({sucursal => self.mapeoDeTallesPor(sucursal)})
	
}