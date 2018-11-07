import remeras.*

class Pedido {
	const cantidadDePedido = 0
	const sucursal
	const property remeraDePedido
	var property pedidosRegistrados = []
	
	method precioDePedidoBase() = remeraDePedido.costoDeRemera() * cantidadDePedido
		
	method aplicaDescuento() = sucursal.pedidoMinimoParaDescuento() < cantidadDePedido 
	
	method precioConDescuento() = self.precioDePedidoBase() 
	                              - self.precioDePedidoBase() * (remeraDePedido.porcentajeDeDescuento() / 100 )
	                                   
	method precioDePedido() = if(self.aplicaDescuento()) {self.precioConDescuento()}                                
                                                    else self.precioDePedidoBase()
                                                    
    method registrarPedidos(unPedido) { pedidosRegistrados.add(unPedido)}                                                
                                                                                                        
}       

class Sucursal {
		const property pedidoMinimoParaDescuento = 0
		
		
	
}